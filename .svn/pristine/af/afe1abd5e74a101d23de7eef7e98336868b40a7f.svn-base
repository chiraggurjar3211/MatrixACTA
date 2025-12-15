@UsersModule
Feature: All Sequential Approval Policy
  I want to use this template for my feature file

  @RIC_AllSeq_Case1
  Scenario: Behaviour of All Sequential Approval Policy with 5 RIC - Application Approved by multilevel RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | Pending          |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | Approved         |
      | UM_RIC_4 - UM_RIC_4             | Pending          |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Pending  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |

  @RIC_AllSeq_Case2
  Scenario: Behaviour of All Sequential Approval Policy with 5 RIC - Application Rejected by First RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |

  @RIC_AllSeq_Case3
  Scenario: Behaviour of All Sequential Approval Policy with 5 RIC - Application Approved by Multiple RICs but Rejected by one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | Pending          |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Rejected         |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Approved  | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status           |
      | Pending   | UM_1   |      0 |    0 | No Authorization |
      | Rejected  | UM_1   |      0 |    0 | No Authorization |

  @RIC_AllSeq_Case4
  Scenario: RIC selection changed in Approval Policy page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_2 - UM_RIC_2             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | No Authorization |

  @RIC_AllSeq_Case5
  Scenario: RIC selection changed in Approval Policy page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-1" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case6
  Scenario: RIC selection changed in Approval Policy page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case7
  Scenario: Authorization Mode gets changed from All Sequential to Any One in Approval Policy page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case8
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case9
  Scenario: Authorization Mode gets changed from All Sequential to Any One in Approval Policy page, , Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case10
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "0"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case11
  Scenario: Authorization Mode gets changed from All Sequential to Any One in Approval Policy page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case12
  Scenario: Authorization Mode gets changed from All Sequential to All in Approval Policy page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case13
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AllSeq_Case14
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case15
  Scenario: Final RIC gets removed from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      |               |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case16
  Scenario: Any RIC gets removed from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case17
  Scenario: RIC (Which rejected leave application) gets removed from Reporting Group Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 |               | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case18
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1       | UM_1       |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1.1 - UM_RIC_1.1         | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AllSeq_Case19
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1       | UM_1       |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case20
  Scenario: Any RIC gets changed from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1       | UM_1       |               1 |         1 |               1 |                  1 |
      | UM_RIC_1   | UM_RIC_1   |               1 |         1 |               1 |                  1 |
      | UM_RIC_2   | UM_RIC_2   |               1 |         1 |               1 |                  1 |
      | UM_RIC_3   | UM_RIC_3   |               1 |         1 |               1 |                  1 |
      | UM_RIC_4   | UM_RIC_4   |               1 |         1 |               1 |                  1 |
      | UM_RIC_5   | UM_RIC_5   |               1 |         1 |               1 |                  1 |
      | UM_RIC_1.1 | UM_RIC_1.1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1.1    | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case21
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case22
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AllSeq_Case23
  Scenario: Any RIC gets added from Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AllSeq_Case24
  Scenario: Approval Policy gets changed from All Sequential to Any One in Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneApprvalPlc24  | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name  | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc24 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case25
  Scenario: Approval Policy gets changed from All Sequential to All in Reporting Group Page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc25     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc25   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case26
  Scenario: Approval Policy gets changed from All Sequential to Any One in Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneApprvalPlc26  | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name  | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc26 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case27
  Scenario: Approval Policy gets changed from All Sequential to Any One in Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
      | UM_AnyOneApprvalPlc27  | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name  | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc27 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case28
  Scenario: Approval Policy gets changed from All Sequential to All in Reporting Group Page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc28     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc28   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case29
  Scenario: Approval Policy gets changed from All Sequential to All in Reporting Group Page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc29     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc29   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case30
  Scenario: Approval Policy gets removed from Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case31
  Scenario: Approval Policy gets removed from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case32
  Scenario: Approval Policy gets removed Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case33
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case34
  Scenario: Approval Policy gets added from Reporting Group Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Approved |

  @RIC_AllSeq_Case35
  Scenario: Approval Policy gets added Reporting Group Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_2 - UM_RIC_2 | Rejected |

  @RIC_AllSeq_Case36
  Scenario: Approval Policy gets added in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case37
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllAprPlc37         | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllAprPlc37       | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case38
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Approved |

  @RIC_AllSeq_Case39
  Scenario: Approval Policy gets added in User Configuration page, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_4 - UM_RIC_4 | Rejected |

  @RIC_AllSeq_Case40
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case41
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case42
  Scenario: Approval Policy gets removed in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case43
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvalPlc43     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc43   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case44
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvalPlc44     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc44   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case45
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_AllApprvalPlc45     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_AllApprvalPlc45   | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case46
  Scenario: Approval Policy gets changed from All Sequential to All in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc46     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UM_1   | UM_ReportingGrpSeq1 | UM_AllApprvalPlc46 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case47
  Scenario: Approval Policy gets changed from All Sequential to Any One in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc47  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup      | ApprovalPolicy        | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc47 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case48
  Scenario: Approval Policy gets changed from All Sequential to All in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc48     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_AllApprvalPlc48 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case49
  Scenario: Approval Policy gets changed from All Sequential to All in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc49     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy     | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_AllApprvalPlc49 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case50
  Scenario: Approval Policy gets changed from All Sequential to Any One in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc50  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy        | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc50 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case51
  Scenario: Approval Policy gets changed from All Sequential to Any One in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc51  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId    | PolicyId | PolicyName | RIC1     | RIC2     | RIC3     | RIC4     | RIC5     | Validation         |
      | UM_ReportingGrpSeq1 |          |            | UM_RIC_1 | UM_RIC_2 | UM_RIC_3 | UM_RIC_4 | UM_RIC_5 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy         | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy        | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 | UM_AnyOneApprvalPlc51 | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case52
  Scenario: Reporting Group gets added in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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

  @RIC_AllSeq_Case53
  Scenario: Reporting Group gets added in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | UM_1   |          0 |        0 |
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
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @RIC_AllSeq_Case54
  Scenario: Reporting Group gets added in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | ApprovedRequest | SA    | UM_1   |          0 |        0 |
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
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |

  @RIC_AllSeq_Case55
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |

  @RIC_AllSeq_Case56
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case57
  Scenario: Reporting Group gets removed in User Configuration page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   |                |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case58
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd All, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc58     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAll58 | UM_AllApprvalPlc58     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    When Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAll58 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AllSeq_Case59
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd Any One, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc59  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAny59 | UM_AnyOneApprvalPlc59  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    When Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAny59 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    Then Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AllSeq_Case60
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd Any One, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc60  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAny60 | UM_AnyOneApprvalPlc60  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAny60 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case61
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd Any One, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AnyOneApprvalPlc61  | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAny61 | UM_AnyOneApprvalPlc61  | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAny61 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case62
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd All, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc62     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAll62 | UM_AllApprvalPlc62     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAll62 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case63
  Scenario: Reporting Group gets changed in User Configuration page, 1st Reporting Group Approval Policy= All Sequential and 2nd All, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
      | UM_AllApprvalPlc63     | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name                | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1    | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
      | UM_ReportingGroupAll63 | UM_AllApprvalPlc63     | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup         | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGroupAll63 |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case64
  Scenario: Any RIC of Reporting Group Page gets deleted, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
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

  @RIC_AllSeq_Case65
  Scenario: Any RIC of Reporting Group Page gets deleted, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Delete user via API
      | UserID   |
      | UM_RIC_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case66
  Scenario: Final RIC of Reporting Group Page gets deleted, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Delete user via API
      | UserID   |
      | UM_RIC_5 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge             | Status   |
      | UM_RIC_1 - UM_RIC_1  | Approved |
      | UM_RIC_2 - UM_RIC_2  | Approved |
      | UM_RIC_3 - UM_RIC_3  | Approved |
      | UM_RIC_4 - UM_RIC_4  | Approved |
      | UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case67
  Scenario: Final RIC of Reporting Group Page gets deleted, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Delete user via API
      | UserID   |
      | UM_RIC_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge             | Status   |
      | UM_RIC_1 - Final RIC | Rejected |

  @RIC_AllSeq_Case68
  Scenario: Any RIC of Reporting Group Page gets deleted, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Delete user via API
      | UserID   |
      | UM_RIC_4 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case69
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AllSeq_Case70
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case71
  Scenario: Final RIC gets deactivate from User Configuration Page, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_5 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |

  @RIC_AllSeq_Case72
  Scenario: Final RIC gets deactivate from User Configuration Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case73
  Scenario: Any RIC gets deactivate from User Configuration Page, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid   | Active | Validation         |
      | UM_RIC_2 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |

  @RIC_AllSeq_Case74
  Scenario: Leave Modification Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
      | UM_RIC_4 |                          1 | admin        |    1 |
      | UM_RIC_5 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_4 | admin    | Welcome UM_RIC_4 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_5 | admin    | Welcome UM_RIC_5 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_2 - UM_RIC_2             | Approved |
      | UM_RIC_3 - UM_RIC_3             | Approved |
      | UM_RIC_4 - UM_RIC_4             | Approved |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | Approved |
    When Apply for leave application "modification" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |            1 | Leave Modification Request Sent |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AllSeq_Case75
  Scenario: Auto Forward Leave Application, Leave Application status gets changed to Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc75 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "UM_SequentialAprvlPlc75"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action  |
      | In-Charge 1        | true        |                    1 | Approve |
      | In-Charge 2        | false       |                      |         |
      | In-Charge 3        | false       |                      |         |
      | In-Charge 4        | false       |                      |         |
      | In-Charge 5        | false       |                      |         |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc75 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And change system date from current date to "2".
    And Open Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |     -2 |   -2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |     -2 |   -2 | Pending |
    And change system date from current date to "-2".

  @RIC_AllSeq_Case76
  Scenario: Auto Forward Leave Application, Leave Application status gets changed to Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc76 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "UM_SequentialAprvlPlc76"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action |
      | In-Charge 1        | true        |                    1 | Reject |
      | In-Charge 2        | false       |                      |        |
      | In-Charge 3        | false       |                      |        |
      | In-Charge 4        | false       |                      |        |
      | In-Charge 5        | false       |                      |        |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc76 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And change system date from current date to "2".
    And Open Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    When Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5             | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    Then Validate "Leave" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |     -2 |   -2 | Rejected |
    And change system date from current date to "-2".

  @RIC_AllSeq_Case77
  Scenario: Auto Forward Leave Application, Leave Application status gets changed to Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc77 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Configure Auto Forward Application for PolicyName= "UM_SequentialAprvlPlc77"
      | ReportingIn-Charge | AutoForward | AutoForwardAfterDays | Action  |
      | In-Charge 1        | true        |                    1 | Approve |
      | In-Charge 2        | true        |                    1 | Approve |
      | In-Charge 3        | false       |                      |         |
      | In-Charge 4        | false       |                      |         |
      | In-Charge 5        | false       |                      |         |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc77 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_2 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And change system date from current date to "2".
    And Open Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "-2" To= "-2"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Pending          |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Validate "Leave" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |     -2 |   -2 | Approved |
    And change system date from current date to "2".
    And Open Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "-4" To= "-4"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Approved         |
      | UM_RIC_2 - UM_RIC_2             | Approved         |
      | UM_RIC_3 - UM_RIC_3             | Pending          |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_2 | admin    | Welcome UM_RIC_2 |
    And Validate "Leave" Application from RIC date From= "-4" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |     -4 |   -4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Validate "Leave" Application from RIC date From= "-4" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status  |
      | Pending   | UM_1   |     -4 |   -4 | Pending |
    And change system date from current date to "-4".

  @RIC_AllSeq_Case78
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |

  @RIC_AllSeq_Case79
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved |

  @RIC_AllSeq_Case80
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      |               | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |

  @RIC_AllSeq_Case81
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, and Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |

  @RIC_AllSeq_Case82
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
      | UM_RIC_1 |
      | UM_RIC_2 |
      | UM_RIC_3 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | ET      | UM_ET_MltLvlRIC | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_MltiLvlRIC1" with Pro-rata "False"
      | LeaveID |
      | ET      |
    And Create Approval Policy from Approval Policy page
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
      | UM_RIC_3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_3 | admin    | Welcome UM_RIC_3 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | UM_RIC_1 - UM_RIC_1             | Approved |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | Approved |

  @RIC_AllSeq_Case83
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 and Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | true       | false      | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1 - Final RIC | Rejected         |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |

  @RIC_AllSeq_Case84
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1,2,3, AP Configuration = In-Charge 1 & 4,  Then application flow for all applications will be based on Any One Authorization Mode , Leave Application Status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | false      | true       | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AllSeq_Case85
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1,2,3, AP Configuration = In-Charge 1 & In-Charge 4, Leave Application Status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | false      | true       | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AllSeq_Case86
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1,2,3, AP Configuration = In-Charge 1 & In-Charge 4, Leave Application Status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | false      | false      | true       | false      | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
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
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AllSeq_Case87
  Scenario: General Rules - Mismatch, RG Configuration = RIC 1, 2, AP Configuration = In-Charge 1, 2,3, Then application flow for all applications will get updated to Any One Authorization Mode, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |

  @RIC_AllSeq_Case88
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, Leave Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 | true    |        | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Approved  | UM_1   |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Approved |

  @RIC_AllSeq_Case89
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2, Approval Policy Page Configuration = In-Charge 1, In-Charge 2 & In-Charge 3, Leave Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName             | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc1 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name   | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc1 | UM_RIC_1      | UM_RIC_2      |               |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | UM_1     |                          1 | admin        |    1 |
      | UM_RIC_1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | UM_RIC_1 | admin    | Welcome UM_RIC_1 |
    When Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User | FromDate | ToDate | Approve | Reject | Validation         |
      | UM_1 |        0 |      0 |         | true   | Saved Successfully |
    And Validate "Leave" Application from RIC date From= "0" To= "0"
      | PanelName | UserID | FromDt | ToDt | Status   |
      | Rejected  | UM_1   |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status   |
      | UM_RIC_1 - UM_RIC_1 | Rejected |

  @RIC_AllSeq_Case90
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc90 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc90"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc90 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AllSeq_Case91
  Scenario: General Rules - Mismatch with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc91 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc91"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc91 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AllSeq_Case92
  Scenario: General Rules - Mismatch with Exception, RG config = RIC 1, 2,3, AP config = In-Charge 1, 2,3 and Exceptions Application config = In-Charge 1, 2,3,4, Authorization Mode in Exception= Any One,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc92 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc92"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc92 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        1 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AllSeq_Case93
  Scenario: General Rules2 - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc93 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc93"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc93 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        3 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |

  @RIC_AllSeq_Case94
  Scenario: General Rules - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Config = In-Charge 1, 2,3, 4, Authorization Mode in Exception= All,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc94 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc94"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc94 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        1 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |

  @RIC_AllSeq_Case95
  Scenario: General Rules2 - Mismatch with Exception, RG = RIC 1,2,3, AP = In-Charge 1,2,3 and Exceptions Application Configuration = In-Charge 1,2,3,4, Authorization Mode in Exception= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc95 | All Sequential    | true       | true       | true       | false      | false      |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc95"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                               | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc95 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      |               |               |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        3 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3 - Final RIC | No Authorization |

  @RIC_AllSeq_Case96
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc96 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc96"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc96 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AllSeq_Case97
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA, Leave Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc97 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc97"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | NA               |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc97 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        0 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AllSeq_Case98
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= Duration, Leave Application Date = 0 to 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc98 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc98"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc98 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        1 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge                        | Status  |
      | UM_RIC_1 - UM_RIC_1             | Pending |
      | UM_RIC_2 - UM_RIC_2             | Pending |
      | UM_RIC_3 - UM_RIC_3             | Pending |
      | UM_RIC_5 - UM_RIC_5             | Pending |
      | UM_RIC_4 - UM_RIC_4 - Final RIC | Pending |

  @RIC_AllSeq_Case99
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to 5 and Exceptions Application Configuration = In-Charge 1 to 5, Exception Authorization Mode= All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | PolicyName              | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | UM_SequentialAprvlPlc99 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc99"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 | In-Charge 4    |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name    | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc99 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        3 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |

  @RIC_AllSeq_Case100
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= Any One, Customize Based On= Duration, Leave Application Date = 0 to 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | UM_SequentialAprvlPlc100 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc100"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc100 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        1 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "1"
      | Incharge            | Status  |
      | UM_RIC_1 - UM_RIC_1 | Pending |
      | UM_RIC_2 - UM_RIC_2 | Pending |
      | UM_RIC_3 - UM_RIC_3 | Pending |
      | UM_RIC_4 - UM_RIC_4 | Pending |
      | UM_RIC_5 - UM_RIC_5 | Pending |

  @RIC_AllSeq_Case101
  Scenario: Exception Examples for Normal Application, RG = RIC 1 to 5, AP = In-Charge 1 to P5 and Exceptions = In-Charge 1 to 5, Exception Authorization Mode= Any One
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | UM_1     |
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
      | UM_SequentialAprvlPlc101 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "UM_SequentialAprvlPlc101"
      | ApplicationType | LeaveIdName        | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                            | FinalIn-Charge |
      | Paid Leave      | ET UM_ET_MltLvlRIC | Duration         |         1 |       2 | Any One           | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4, In-Charge 5 |                |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | UM_1     | UM_1     |               1 |         1 |               1 |                  1 |
      | UM_RIC_1 | UM_RIC_1 |               1 |         1 |               1 |                  1 |
      | UM_RIC_2 | UM_RIC_2 |               1 |         1 |               1 |                  1 |
      | UM_RIC_3 | UM_RIC_3 |               1 |         1 |               1 |                  1 |
      | UM_RIC_4 | UM_RIC_4 |               1 |         1 |               1 |                  1 |
      | UM_RIC_5 | UM_RIC_5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name             | approval-policy-name     | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | UM_ReportingGrpSeq1 | UM_SequentialAprvlPlc101 | UM_RIC_1      | UM_RIC_2      | UM_RIC_3      | UM_RIC_4      | UM_RIC_5      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup      | ApprovalPolicy | LeaveGroup              | WeekOffGroup | Validation         |
      | UM_1   | UM_ReportingGrpSeq1 |                | LM_LeaveGrp_MltiLvlRIC1 |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | UM_1   |          0 |           0 |                 |                 |    5 |          |                | ET         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | UM_1   |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | UM_1   |                  1 |          0 |        3 | ET         |                     1 | UM_1      |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | UM_1     | admin    | Welcome UM_1 |
    And Validate Leave Approval Details in ESS date From= "0" To= "3"
      | Incharge                        | Status           |
      | UM_RIC_1 - UM_RIC_1             | Pending          |
      | UM_RIC_2 - UM_RIC_2             | No Authorization |
      | UM_RIC_3 - UM_RIC_3             | No Authorization |
      | UM_RIC_4 - UM_RIC_4             | No Authorization |
      | UM_RIC_5 - UM_RIC_5 - Final RIC | No Authorization |
