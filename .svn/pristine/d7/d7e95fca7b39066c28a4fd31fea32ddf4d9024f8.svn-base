@UsersModule
Feature: Any One Approval Policy
  I want to use this template for my feature file

  @RIC_AnyOne_Case1
  Scenario: Auth Mode behaviour of Any One Approval Policy with 5 RIC - Application approved by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_3 - UM_RIC_3 | Approved |

  @RIC_AnyOne_Case2
  Scenario: Behaviour of Any One Approval Policy with 5 RIC - Application Rejected by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_AnyOne_Case3
  Scenario: Behaviour of Any One Approval Policy with 5 RIC - Application approved by any one RIC and rejected by other RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | PanelName | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 | Approved  |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_3 - UM_RIC_3 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |

  @RIC_AnyOne_Case4
  Scenario: Behaviour of Any One Approval Policy with 5 RIC - Application rejected by any one RIC and approved by other RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | PanelName | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 | Rejected  |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_3 - UM_RIC_3 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |

  @RIC_AnyOne_Case5
  Scenario: RIC selection changed in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UMUr1  |      0 |    0 | Pending |

  @RIC_AnyOne_Case6
  Scenario: RIC selection changed in Approval Policy page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-tUMUr1tion-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                    1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case7
  Scenario: RIC selection changed in Approval Policy page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case8
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_AnyOne_Case9
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case10
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case11
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case12
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case13
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_Ur13  |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_Ur13  | UM_Ur13  |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID  | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_Ur13 | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid  | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_Ur13 |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_Ur13  |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid  | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_Ur13 |                  1 |          0 |        0 | ET         |                     1 | UM_Ur13   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | UM_Ur13  | admin    | Welcome UM_Ur13 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User    | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_Ur13 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID  | FromDt | ToDt | Status   |
      | Rejected  | UM_Ur13 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | UM_Ur13  | admin    | Welcome UM_Ur13 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | UM_Ur13  | admin    | Welcome UM_Ur13 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case14
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case15
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case16
  Scenario: RIC (Which approved leave application) gets removed from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      |               | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case17
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case18
  Scenario: RIC (Which rejected leave application) gets removed from Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      |               | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case19
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1      | UMUr1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                | Status  |
      | UM_RIC_1.1 - UM_RIC_1.1 | Pending |
      | UM_RIC_2 - UM_RIC_2     | Pending |
      | UM_RIC_3 - UM_RIC_3     | Pending |
      | UM_RIC_4 - UM_RIC_4     | Pending |
      | UM_RIC_5 - UM_RIC_5     | Pending |

  @RIC_AnyOne_Case20
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1      | UMUr1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case21
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1      | UMUr1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case22
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case23
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case24
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case25
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc25  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc25    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AnyOne_Case26
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc26  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc26    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case27
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc27  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc27    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case28
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc28 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc28 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case29
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc29 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc29 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case30
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc30 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc30 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case31
  Scenario: Approval Policy gets removed from Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case32
  Scenario: Approval Policy gets removed from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case33
  Scenario: Approval Policy gets removed from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case34
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case35
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case36
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case37
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case38
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc38  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc38    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case39
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc39  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc39    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |

  @RIC_AnyOne_Case40
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc40  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc40    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |

  @RIC_AnyOne_Case41
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All Sequential, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequeApprvlPlc41 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequeApprvlPlc41  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case42
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvlPlc42  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc42    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AnyOne_Case43
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvlPlc43  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc43    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |

  @RIC_AnyOne_Case44
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvlPlc44  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AllApprvlPlc44    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_AnyOne_Case45
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialApprvlPlc45 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc45 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case46
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialApprvlPlc46 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc46 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case47
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialApprvlPlc47 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc47 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case48
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc48 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc48 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case49
  Scenario: Approval Policy gets changed from Any One to All in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc49  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy    | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AllApprvlPlc49 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AnyOne_Case50
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc50 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc50 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |

  @RIC_AnyOne_Case51
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc51 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_SequentialApprvlPlc51 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_AnyOne_Case52
  Scenario: Approval Policy gets changed from Any One to All in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc52  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy    | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AllApprvlPlc52 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case53
  Scenario: Approval Policy gets changed from Any One to All in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc53  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAny1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy    | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 | UM_AllApprvlPlc53 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case54
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case55
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | UMUr1  |          0 |        0 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @RIC_AnyOne_Case56
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | ApprovedRequest | SA    | UMUr1  |          0 |        0 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |

  @RIC_AnyOne_Case57
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |

  @RIC_AnyOne_Case58
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case59
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case60
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc60  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReprtngGrpAll60  | UM_AllApprvlPlc60    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup     | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReprtngGrpAll60 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AnyOne_Case61
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All Sequential Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc61 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name              | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1  | UM_AnyOneAprvlPlc1       | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGrpSeq61 | UM_SequentialApprvlPlc61 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup       | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpSeq61 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case62
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc62  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name              | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1  | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGrpAll62 | UM_AllApprvlPlc62    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup       | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAll62 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case63
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvlPlc63  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name              | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1  | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGrpAll63 | UM_AllApprvlPlc63    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup       | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAll63 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case64
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All Sequential, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc64 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name              | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1  | UM_AnyOneAprvlPlc1       | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGrpSeq64 | UM_SequentialApprvlPlc64 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup       | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpSeq64 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case65
  Scenario: Reporting Group gets changed in User Configuration page, Reporting Group Approval Policy-> 1st group= Any One and 2nd group= All Sequential, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName               | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvlPlc1       | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_SequentialApprvlPlc65 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name              | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1  | UM_AnyOneAprvlPlc1       | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGrpSeq65 | UM_SequentialApprvlPlc65 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup       | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpSeq65 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case66
  Scenario: Any RIC gets deleted from User Configuration Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Delete user via API
      | UserID   |
      | UM_RIC_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case67
  Scenario: Any RIC gets deleted from User Configuration Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Delete user via API
      | UserID   |
      | UM_RIC_2 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge | Status   |
      | UM_RIC_2 | Approved |

  @RIC_AnyOne_Case68
  Scenario: Any RIC gets deleted from User Configuration Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Delete user via API
      | UserID   |
      | UM_RIC_2 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge | Status   |
      | UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case69
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_2 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case70
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_2 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AnyOne_Case71
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_2 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AnyOne_Case72
  Scenario: Leave Modification Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | In-Charge3      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_3 - UM_RIC_3 | Approved |
    Then Apply for leave application "modification" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |            1 | Leave Modification Request Sent |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case73
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case74
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case75
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case76
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, and Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case77
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UMUr1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AnyOne_Case78
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName         | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_AnyOneAprvlPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc1   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UMUr1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UMUr1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AnyOne_Case79
  Scenario: General Rules - Mismatch with Exception Examples, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Config= In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc79 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc79"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc79  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        1 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case80
  Scenario: Mismatch with Exception Examples for Normal Application, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc80 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc80"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 3    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc80  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        3 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case81
  Scenario: General Rules - Mismatch with Exception Examples, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc81 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc81"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc81  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        1 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case82
  Scenario: Mismatch with Exception Examples for Normal Application, RG = RIC 1,2,3, Approval Policy Page Configuration = In-Charge 1,2,3and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc82 | Any One           | true       | true       | true       | false      | false      |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc82"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc82  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        3 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AnyOne_Case83
  Scenario: GENERAL RULES-Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= Duration, Leave Application Date = 0 to 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc83 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc83"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 3    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc83  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        1 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_AnyOne_Case84
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= Duration, Leave Application Date = 0 to 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc84 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc84"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc84  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        1 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case85
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc85 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc85"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc85  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AnyOne_Case86
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Configuration = In-Charge 1 to 5, Exception Authorization Mode= All Sequential, Customized Based On= Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc86 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc86"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc86  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        3 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case87
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Configuration = In-Charge 1 to 5, Exception Authorization Mode= All, Customized Based On= Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc87 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc87"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 3    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc87  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        3 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AnyOne_Case88
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc88 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc88"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc88  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | ET         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  #  FIT
  @RIC_AnyOne_Case89
  Scenario: General Rules - Multiple Leaves in Exceptions Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | EU      | UM_EU_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
      | EV      | UM_EV_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
      | EW      | UM_EW_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "EUVW_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | EU      |
      | EV      |
      | EW      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc89 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc89"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | EU UM_EU_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
      | Paid Leave      | EV UM_EV_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3              | In-Charge 3    |
      | Paid Leave      | EW UM_EW_MltLvlRIC | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2                          |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc89  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup                | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | EUVW_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | EU         |      0 |     0 |    0 |          | credit |       |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | EV         |      0 |     0 |    0 |          | credit |       |
      | UMUr1  |          0 |           0 |                 |                 |    5 |          |                | EW         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | EU         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -1 |       -1 | EV         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -2 |       -2 | EW         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-1" To= "-1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | No Authorization |

  @RIC_AnyOne_Case90
  Scenario: General Rules - Multiple Leaves in Exceptions UnPaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | EX      | UM_EX_MltLvlRIC | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
      | EY      | UM_EY_MltLvlRIC | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
      | EZ      | UM_EZ_MltLvlRIC | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "EXYZ_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | EX      |
      | EY      |
      | EZ      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc90 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc90"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Unpaid Leave    | EX UM_EX_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
      | Unpaid Leave    | EY UM_EY_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3              | In-Charge 3    |
      | Unpaid Leave    | EZ UM_EZ_MltLvlRIC | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2                          |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc90  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup                | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | EXYZ_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | EX         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -1 |       -1 | EY         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -2 |       -2 | EZ         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-1" To= "-1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | No Authorization |

  @RIC_AnyOne_Case91
  Scenario: General Rules - Multiple Leaves in Exceptions Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | FA      | LM_FA_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | FD      | LM_FB_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | FC      | LM_FC_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "FABC_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | FA      |
      | FD      |
      | FC      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc91 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc91"
      | ApplicationType   | LeaveIdName       | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Hourly Paid Leave | FA LM_FA_HrPLeave | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
      | Hourly Paid Leave | FD LM_FB_HrPLeave | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3              | In-Charge 3    |
      | Hourly Paid Leave | FC LM_FC_HrPLeave | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2                          |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc91  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup                | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | FABC_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | UMUr1  |          0 |           0 |                 |                 |      | 140720230200 |              1 | FA         |        |       |      |          | credit | 099:00 |
      | UMUr1  |          0 |           0 |                 |                 |      | 140720230200 |              1 | FD         |        |       |      |          | credit | 099:00 |
      | UMUr1  |          0 |           0 |                 |                 |      | 140720230200 |              1 | FC         |        |       |      |          | credit | 099:00 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | UMUr1  |                  4 |          0 |        0 | FA         |                     1 |               0 | 09:00             | 18:00           | UMUr1     |
      | UMUr1  |                  4 |         -1 |       -1 | FD         |                     1 |              -1 | 09:00             | 18:00           | UMUr1     |
      | UMUr1  |                  4 |         -2 |       -2 | FC         |                     1 |              -2 | 09:00             | 18:00           | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-1" To= "-1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | No Authorization |

  @RIC_AnyOne_Case92
  Scenario: General Rules - Multiple Leaves in Exceptions Hourly UnPaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | FD      | LM_FD_HrPLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | FE      | LM_FE_HrPLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | FF      | LM_FF_HrPLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "FDEF_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | FD      |
      | FE      |
      | FF      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc92 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc92"
      | ApplicationType     | LeaveIdName       | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Hourly Unpaid Leave | FD LM_FD_HrPLeave | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
      | Hourly Unpaid Leave | FE LM_FE_HrPLeave | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3              | In-Charge 3    |
      | Hourly Unpaid Leave | FF LM_FF_HrPLeave | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2                          |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc92  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup                | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | FDEF_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | UMUr1  |                  4 |          0 |        0 | FD         |                     1 |               0 | 09:00             | 18:00           | UMUr1     |
      | UMUr1  |                  4 |         -1 |       -1 | FE         |                     1 |              -1 | 09:00             | 18:00           | UMUr1     |
      | UMUr1  |                  4 |         -2 |       -2 | FF         |                     1 |              -2 | 09:00             | 18:00           | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-1" To= "-1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | No Authorization |

  @RIC_AnyOne_Case93
  Scenario: General Rules - Multiple Leaves in Exceptions Compensatory Off Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UMUr1    |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
      | UM_RIC_4 |
      | UM_RIC_5 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | FG      | LM_FG_COffEncash | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
      | FH      | LM_FH_COffEncash | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
      | FI      | LM_FI_COffEncash | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "FGHI_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Final In-Charge | Validation         |
      | UM_AnyOneAprvlPlc93 | Any One           | true       | true       | true       | true       | true       |                 | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AnyOneAprvlPlc93"
      | ApplicationType        | LeaveIdName       | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Compensatory Off Leave | FG LM_FG_COffEncash | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
      | Compensatory Off Leave | FH LM_FH_COffEncash | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3              | In-Charge 3    |
      | Compensatory Off Leave | FI LM_FI_COffEncash | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2                          |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UMUr1    | UMUr1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAny1 | UM_AnyOneAprvlPlc93  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup                | WeekOffGroup | Validation         |
      | UMUr1  | UM_ReportingGrpAny1 |                | FGHI_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
        | UMUr1  | UM_ReportingGrpAny1 |                | FGHI_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
          And Configure Off Day Configuration in Shift Schedule "GS"
      | OffDay1 |
      | None    |
     And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | UMUr1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | UMUr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | UMUr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | UMUr1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UMUr1  |                          1 | admin        |    1 |
    When Manual Overtime/C-OFF Entry for UserID= "UMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "UMUr1" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "UMUr1" on AtdDate= "-2"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UMUr1  |                  1 |          0 |        0 | FG         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -1 |       -1 | FH         |                     1 | UMUr1     |
      | UMUr1  |                  1 |         -2 |       -2 | FI         |                     1 | UMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UMUr1    | admin    | Welcome UMUr1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-1" To= "-1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | No Authorization |
