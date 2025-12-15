@UsersModule
Feature: All Approval Policy
  I want to use this template for my feature file

  @RIC_All_Case1
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC - Application Approved only by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case2
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC - Application Approved one by onr each RIC in sequence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | Approved         |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |

  @RIC_All_Case3
  Scenario: Auth Mode behaviour of All Approval Policy with 5 RIC - Application Approved by RIC1, RIC5 and Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Approved |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | Approved         |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |

  @RIC_All_Case4
  Scenario: Behaviour of All Approval Policy with 5 RIC - Application Approved by multiple RIC but Rejected by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_U1  |      0 |    0 | No Authorization |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_U1  |      0 |    0 | No Authorization |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |

  @RIC_All_Case5
  Scenario: Behaviour of All Approval Policy with 5 RIC - Application Rejected by multiple RIC and Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Rejected |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | Rejected         |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |

  @RIC_All_Case6
  Scenario: Behaviour of All Approval Policy with 5 RIC - Application Rejected by multiple RIC but Approved by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Rejected |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | Rejected         |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |

  @RIC_All_Case7
  Scenario: Behaviour of All Approval Policy with 5 RIC - Leave Application Approved and Rejected by multiple RICs but Approved by Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Pending  |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Rejected |
      | UM_RIC_2 - UM_RIC_2             | Rejected |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_U1  |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | Approved         |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Rejected  | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_U1  |      0 |    0 | No Authorization |
      | Approved  | UM_U1  |      0 |    0 | No Authorization |

  @RIC_All_Case8
  Scenario: RIC selection changed in Approval Policy page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_All_Case9
  Scenario: RIC selection changed in Approval Policy page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | false      | true       | true       | true       | false      | In-Charge 3    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved         |

  @RIC_All_Case10
  Scenario: RIC selection changed in Approval Policy page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | false      | true       | true       | true       | false      | In-Charge 3    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Rejected         |

  @RIC_All_Case11
  Scenario: Authorization Mode gets changed from All to Any One in Approval Policy page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case12
  Scenario: Authorization Mode gets changed from All to All Sequential in Approval Policy page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case13
  Scenario: Authorization Mode gets changed from All to Any One in Approval Policy page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |

  @RIC_All_Case14
  Scenario: Authorization Mode gets changed from All to All Sequential in Approval Policy page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |

  @RIC_All_Case15
  Scenario: Authorization Mode gets changed from All to Any One in Approval Policy page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |

  @RIC_All_Case16
  Scenario: Authorization Mode gets changed from All to All Sequential in Approval Policy page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |

  @RIC_All_Case17
  Scenario: Final In-Charge gets changed in Approval Policy page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case18
  Scenario: Final In-Charge gets changed in Approval Policy page while leave application approved by other RICs but NO Authorization from Final RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Pending  |
      | UM_RIC_5 - UM_RIC_5             | Pending  |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case19
  Scenario: Final In-Charge gets changed in Approval Policy page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Approved         |

  @RIC_All_Case20
  Scenario: Final In-Charge gets changed in Approval Policy page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 2    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_2 - UM_RIC_2 - Final RIC | Rejected         |

  @RIC_All_Case21
  Scenario: Any RIC gets removed from Reporting Group Page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_All_Case22
  Scenario: Any RIC gets removed from Reporting Group Page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case23
  Scenario: RIC (Which approved leave application) gets removed from Reporting Group Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case24
  Scenario: Any RIC gets removed from Reporting Group Page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case25
  Scenario: RIC (Which rejected leave application) gets removed from Reporting Group Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case26
  Scenario: Any RIC gets changed from Reporting Group Page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1      | UM_U1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1.1 - UM_RIC_1.1         | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_All_Case27
  Scenario: Any RIC gets changed from Reporting Group Page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1      | UM_U1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case28
  Scenario: Any RIC gets changed from Reporting Group Page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1      | UM_U1      |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case29
  Scenario: Any RIC gets added from Reporting Group Page while leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case30
  Scenario: Any RIC gets added from Reporting Group Page while leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |

  @RIC_All_Case31
  Scenario: Any RIC gets added from Reporting Group Page while leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_All_Case32
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to Any One Approval Policy, leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc32 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc32 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case33
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to All Sequential Approval Policy, leave application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc33 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc33 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case34
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to Any One Approval Policy, leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc34 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc34 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case35
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to Any One Approval Policy, leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc35 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc35 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case36
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to All Sequential Approval Policy, leave application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc36 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc36 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case37
  Scenario: Approval Policy gets changed from Reporting Group Page - changed from All to All Sequential Approval Policy, leave application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc37 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc37 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case38
  Scenario: Approval Policy gets removed from Reporting Group Page while Leave Application status is Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case39
  Scenario: Approval Policy gets removed from Reporting Group Page while Leave Application status is Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case40
  Scenario: Approval Policy gets removed from Reporting Group Page while Leave Application status is Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case41
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Pending state
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case42
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_All_Case43
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Approve Reject "Leave" Application from RIC Date from= "-1" To= "1"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_All_Case44
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case45
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |

  @RIC_All_Case46
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_All_Case47
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All Sequential, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AllSeqApprvlPlc47 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllSeqApprvlPlc47 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case48
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvalPlc48 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc48 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case49
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvalPlc49 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc49 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case50
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AnyOneAprvalPlc50 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc50 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case51
  Scenario: All Approval Policy gets removed in User Configuration page, Reporting Group have All Sequential Approval Policy, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_SequentialAprvalPlc51 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc51 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case52
  Scenario: All Approval Policy gets removed in User Configuration page, Reporting Group have All Sequential Approval Policy, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_SequentialAprvalPlc52 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc52 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case53
  Scenario: All Approval Policy gets removed in User Configuration page, Reporting Group have All Sequential Approval Policy, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_SequentialAprvalPlc53 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc53 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case54
  Scenario: Approval Policy gets changed from All to All Sequential in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc54 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc54 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case55
  Scenario: Approval Policy gets changed from All to Any One in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc55 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy       | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc55 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case56
  Scenario: Approval Policy gets changed from All to All Sequential in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc56 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc56 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case57
  Scenario: Approval Policy gets changed from All to All Sequential in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc57 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy           | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_SequentialAprvalPlc57 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case58
  Scenario: Approval Policy gets changed from All to Any One in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc58 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy       | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc58 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case59
  Scenario: Approval Policy gets changed from All to Any One in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc59 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpAll1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy  | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AllAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy       | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 | UM_AnyOneAprvalPlc59 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case60
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case61
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | UM_U1  |          0 |        0 |
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
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @RIC_All_Case62
  Scenario: Reporting Group gets added in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | ApprovedRequest | SA    | UM_U1  |          0 |        0 |
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
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |

  @RIC_All_Case63
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |

  @RIC_All_Case64
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case65
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case66
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and All Sequential, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | UM_AllAprvlPlc1          | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvalPlc66 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1          | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpSeq66 | UM_SequentialAprvalPlc66 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpSeq66 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case67
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and Any One, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc67 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpAny67 | UM_AnyOneAprvalPlc67 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpAny67 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case68
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and All Sequential, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SeqAprvalPlc68 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpSeq68 | UM_SeqAprvalPlc68    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpSeq68 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case69
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and All Sequential, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1   | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SeqAprvalPlc69 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpSeq69 | UM_SeqAprvalPlc69    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpSeq69 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case70
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and Any One, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc70 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpAny70 | UM_AnyOneAprvalPlc70 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpAny70 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case71
  Scenario: Reporting Group gets changed in User Configuration page, Approval Policy All and Any One, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName           | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1      | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_AnyOneAprvalPlc71 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportngGrpAny71 | UM_AnyOneAprvalPlc71 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportngGrpAny71 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case72
  Scenario: Any RIC gets deleted, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |
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

  @RIC_All_Case73
  Scenario: Final RIC gets deleted, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Delete user via API
      | UserID   |
      | UM_RIC_4 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge             | Status           |
      | UM_RIC_1 - UM_RIC_1  | No Authorization |
      | UM_RIC_2 - UM_RIC_2  | No Authorization |
      | UM_RIC_3 - UM_RIC_3  | No Authorization |
      | UM_RIC_5 - UM_RIC_5  | No Authorization |
      | UM_RIC_4 - Final RIC | Approved         |

  @RIC_All_Case74
  Scenario: Final RIC gets deleted, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Delete user via API
      | UserID   |
      | UM_RIC_4 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge             | Status           |
      | UM_RIC_1 - UM_RIC_1  | No Authorization |
      | UM_RIC_2 - UM_RIC_2  | No Authorization |
      | UM_RIC_3 - UM_RIC_3  | No Authorization |
      | UM_RIC_5 - UM_RIC_5  | No Authorization |
      | UM_RIC_4 - Final RIC | Rejected         |

  @RIC_All_Case75
  Scenario: Any RIC gets deleted, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Delete user via API
      | UserID   |
      | UM_RIC_3 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |

  @RIC_All_Case76
  Scenario: Any RIC gets deleted, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    And Delete user via API
      | UserID   |
      | UM_RIC_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |

  @RIC_All_Case77
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Create user from user configuration
      | userid   | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | UM_RIC_1 | false  | True      | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_All_Case78
  Scenario: Final RIC gets deactivate from User Configuration Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_4 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |

  @RIC_All_Case79
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Approved         |

  @RIC_All_Case80
  Scenario: Final RIC gets deactivate from User Configuration Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_4 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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

  @RIC_All_Case81
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
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
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Rejected         |

  @RIC_All_Case82
  Scenario: Leave Modification Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved         |
    When Apply for leave application "modification" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |            1 | Leave Modification Request Sent |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case83
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case84
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved         |

  @RIC_All_Case85
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Rejected         |

  @RIC_All_Case86
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3,   Then application flow will be based on Approval Policy selected, and Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case87
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved         |

  @RIC_All_Case88
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Rejected         |

  @RIC_All_Case89
  Scenario: General Rules - Mismatch, RIC Configuration = RIC 1, RIC 2, RIC 3, Approval Policy Configuration = In-Charge 1 & In-Charge 4,  Then application flow will be based on Any One Mode, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | false      | true       | false      | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_All_Case90
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 4, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | false      | true       | false      | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_All_Case91
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 4, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | false      | false      | true       | false      | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_All_Case92
  Scenario: General Rules - Mismatch, Reporting Group Configuration = RIC 1, RIC 2, Approval Policy Config = In-Charge 1, In-Charge 2 & In-Charge 3, Then application flow will get updated to Any One Authorization Mode , Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |

  @RIC_All_Case93
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_U1  |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_All_Case94
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc1 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc1      | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_U1    |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_U1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_U1  |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_All_Case95
  Scenario: General Rules - Mismatch with Exception, RG Confi = RIC 1,2,3, AP Config = In-Charge 1, 2,3 and Exceptions = In-Charge 1, 2,3,4, Authorization in Exception= Any One, Then application flow will get updated to Any One Authorization Mode
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc95 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc95"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc95     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        1 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_All_Case96
  Scenario: General Rules - Mismatch with Exception, RG Config = RIC 1,2,3, AP Config = In-Charge 1,2,3 and Exceptions Config= In-Charge 1,2,3,4, Authorization in Exception= All Sequential,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc96 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc96"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc96     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        1 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_All_Case97
  Scenario: General Rules - Mismatch with Exception Examples, Reporting Group Page Configuration = RIC 1,2,3, Approval Policy Page Configuration = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc97 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc97"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc97     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        3 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case98
  Scenario: General Rules - Mismatch with Exception Examples, RG Configuration = RIC 1,2,3, AP Confi = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1, In-Charge 2, In-Charge 3 & In-Charge 4, Authorization Mode in Exception= All Sequential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc98 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc98"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc98     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        3 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case99
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName       | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc99 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc99"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc99     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        1 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_All_Case100
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc100 | All               | true       | true       | true       | false      | false      | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc100"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc100    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_All_Case101
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= Duration, Leave Application Date = 0 to 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc101 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc101"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc101    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        1 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_All_Case102
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc102 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc102"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc102    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_All_Case103
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc103 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc103"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc103    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        0 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_All_Case104
  Scenario: Exception Examples for Normal Application, RG Configuration = RIC 1 to 5, AP Config = In-Charge 1 to 5 and Exceptions Config = In-Charge 1 to In-Charge 5, Exception Authorization Mode= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc104 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc104"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc104    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        3 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |

  @RIC_All_Case105
  Scenario: Exception Examples for Normal Application, RG Configuration = RIC 1 to 5, AP Configuration = In-Charge 1 to 5 and Exceptions Application Configuration = In-Charge 1 to 5, Exception Authorization Mode= All Sequential, Customized Based On= Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_U1    |
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
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllAprvlPlc105 | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_AllAprvlPlc105"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_U1    | UM_U1    |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpAll1 | UM_AllAprvlPlc105    | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_U1  | UM_ReportingGrpAll1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_U1  |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_U1  |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_U1  |                  1 |          0 |        3 | ET         |                     1 | UM_U1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | UM_U1    | admin    | Welcome UM_U1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_4 - UM_RIC_4             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Pending |
