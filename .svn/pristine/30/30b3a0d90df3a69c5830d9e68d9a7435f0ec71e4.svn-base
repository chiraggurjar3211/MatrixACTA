Feature: Title of your feature
  I want to use this template for my feature file

  @CW_1
  Scenario: Approval Stages - Assignment Approval - Direct
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_1   |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_1    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_1 | CWCON_1      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS1            |
    And Delete Contractor via API
      | id      |
      | CWCON_1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_1 | CW_1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_1   |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_1 | CWCON_1 |              10 | CWCON_1        |         888881 | CWCON_1@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name          | Description          | Validation         |
      | CWMInduction1 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS1" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction1      | CW_1                |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_1 | CWWO_1 |             0 |          10 | CWCON_1                  | CWM_AS1           |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_1 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_1  | admin    | Welcome CWCON_1 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_1    |       1 | CWWO_1      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | CW_1     | admin    | Welcome CW_1 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation           |
      | CWWO_1      | CWWrk_1    |          | No Application Found |

  @CW_2
  Scenario: Approval Stages - Assignment Approval = Approval Stage - Approval Scheme = Serial - Reject by Second
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_21  |
      | CW_22  |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_2    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_2 | CWCON_2      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS2            |
    And Delete Contractor via API
      | id      |
      | CWCON_2 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_21 | CW_21 |               1 |         1 |               1 |                  1 |
      | CW_22 | CW_22 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_21  |                          1 | admin        |    1 |
      | CW_22  |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_2 | CWCON_2 |              10 | CWCON_2        |         888882 | CWCON_2@cwm.com |      2000 | lic2        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | CWMInduction21 | Automation By Mayank | Saved Successfully |
      | CWMInduction22 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS2" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction21     | CW_21               |
      | CWMInduction22     | CW_22               |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_2 | CWWO_2 |             0 |          10 | CWCON_2                  | CWM_AS2           |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_2 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_2  | admin    | Welcome CWCON_2 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_2    |       1 | CWWO_2      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_21    | admin    | Welcome CW_21 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_2      | CWWrk_2    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_22    | admin    | Welcome CW_22 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_2      | CWWrk_2    | Reject   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | CWCON_2  | admin    | Welcome CWCON_2 |
    Then Verify Worker Assignment Status in CSS login
      | WorkerName | AssignmentStatus |
      | CWWrk_2    | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |

  @CW_3
  Scenario: Approval Stages - Assignment Approval = Approval Stage - Approval Scheme = Serial - Approve by All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_31  |
      | CW_32  |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_3    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_3 | CWCON_3      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS3            |
    And Delete Contractor via API
      | id      |
      | CWCON_3 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_31 | CW_31 |               1 |         1 |               1 |                  1 |
      | CW_32 | CW_32 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_31  |                          1 | admin        |    1 |
      | CW_32  |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_3 | CWCON_3 |              10 | CWCON_3        |         888883 | CWCON_3@cwm.com |      3000 | lic3        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | CWMInduction31 | Automation By Mayank | Saved Successfully |
      | CWMInduction32 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS3" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction31     | CW_31               |
      | CWMInduction32     | CW_32               |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_3 | CWWO_3 |             0 |          10 | CWCON_3                  | CWM_AS3           |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_3 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_3  | admin    | Welcome CWCON_3 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_3    |       1 | CWWO_3      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_31    | admin    | Welcome CW_31 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_3      | CWWrk_3    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_32    | admin    | Welcome CW_32 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_3      | CWWrk_3    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | CWCON_3  | admin    | Welcome CWCON_3 |
    Then Verify Worker Assignment Status in CSS login
      | WorkerName | AssignmentStatus |
      | CWWrk_3    | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |

  @CW_4
  Scenario: Approval Stages - Assignment Approval = Approval Stage - Approval Scheme = Parallel - Second Approve and First Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_41  |
      | CW_42  |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_4    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_4 | CWCON_4      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS4            |
    And Delete Contractor via API
      | id      |
      | CWCON_4 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_41 | CW_41 |               1 |         1 |               1 |                  1 |
      | CW_42 | CW_42 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_41  |                          1 | admin        |    1 |
      | CW_42  |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Parallel       | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_4 | CWCON_4 |              10 | CWCON_4        |         888884 | CWCON_4@cwm.com |      4000 | lic4        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | CWMInduction41 | Automation By Mayank | Saved Successfully |
      | CWMInduction42 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS4" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction41     | CW_41               |
      | CWMInduction42     | CW_42               |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_4 | CWWO_4 |             0 |          10 | CWCON_4                  | CWM_AS4           |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_4 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_4  | admin    | Welcome CWCON_4 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_4    |       1 | CWWO_4      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_42    | admin    | Welcome CW_42 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_4      | CWWrk_4    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_41    | admin    | Welcome CW_41 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_4      | CWWrk_4    | Reject   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | CWCON_4  | admin    | Welcome CWCON_4 |
    Then Verify Worker Assignment Status in CSS login
      | WorkerName | AssignmentStatus |
      | CWWrk_4    | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |

  @CW_5
  Scenario: Approval Stages - Assignment Approval = Approval Stage - Approval Scheme = Parallel - Second Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_51  |
      | CW_52  |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_5    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_5 | CWCON_5      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS5            |
    And Delete Contractor via API
      | id      |
      | CWCON_5 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_51 | CW_51 |               1 |         1 |               1 |                  1 |
      | CW_52 | CW_52 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_51  |                          1 | admin        |    1 |
      | CW_52  |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Parallel       | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_5 | CWCON_5 |              10 | CWCON_5        |         888885 | CWCON_5@cwm.com |      5000 | lic5        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | CWMInduction51 | Automation By Mayank | Saved Successfully |
      | CWMInduction52 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS5" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction51     | CW_51               |
      | CWMInduction52     | CW_52               |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_5 | CWWO_5 |             0 |          10 | CWCON_5                  | CWM_AS5           |              5 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_5 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_5  | admin    | Welcome CWCON_5 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_5    |       1 | CWWO_5      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_52    | admin    | Welcome CW_52 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_5      | CWWrk_5    | Reject   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | CWCON_5  | admin    | Welcome CWCON_5 |
    Then Verify Worker Assignment Status in CSS login
      | WorkerName | AssignmentStatus |
      | CWWrk_5    | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |

  @CW_6
  Scenario: Approval Stages - Assignment Approval = Approval Stage - Approval Scheme = Parallel - Second Approve then First Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete user via API
      | UserID |
      | CW_61  |
      | CW_62  |
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_6    |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_6 | CWCON_6      |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | CWM_AS6            |
    And Delete Contractor via API
      | id      |
      | CWCON_6 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | CW_61 | CW_61 |               1 |         1 |               1 |                  1 |
      | CW_62 | CW_62 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CW_61  |                          1 | admin        |    1 |
      | CW_62  |                          1 | admin        |    1 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Parallel       | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_6 | CWCON_6 |              10 | CWCON_6        |         888886 | CWCON_6@cwm.com |      6000 | lic6        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | CWMInduction61 | Automation By Mayank | Saved Successfully |
      | CWMInduction62 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "CWM_AS6" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | CWMInduction61     | CW_61               |
      | CWMInduction62     | CW_62               |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | CWWO_6 | CWWO_6 |             0 |          10 | CWCON_6                  | CWM_AS6           |              6 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CWCON_6 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CWCON_6  | admin    | Welcome CWCON_6 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_6    |       1 | CWWO_6      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_62    | admin    | Welcome CW_62 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_6      | CWWrk_6    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | CW_61    | admin    | Welcome CW_61 |
    And Approve Reject Induction Approval from ESS login
      | WorkOrderID | WorkerName | Approval | Validation         |
      | CWWO_6      | CWWrk_6    | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | CWCON_6  | admin    | Welcome CWCON_6 |
    Then Verify Worker Assignment Status in CSS login
      | WorkerName | AssignmentStatus |
      | CWWrk_6    | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |

  @CW_7
  Scenario: Work Orders - Maximum Worker Limit - Check Limit = Disable - Limit not check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_71   |
      | CWWrk_72   |
      | CWWrk_73   |
      | CWWrk_74   |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_7 | CWCON_7      |
    And Delete Contractor via API
      | id      |
      | CWCON_7 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_7 | CWCON_7 |              10 | CWCON_7        |         888887 | CWCON_7@cwm.com |      7000 | lic7        | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_7 | CWWO_7 |             0 |          10 | CWCON_7                  | Approval Stage-1  |              2 | False                        | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_71 | CWWrk_71 | True   | Skill-1   | CWCON_7        | CWWO_7        |                 0 |              10 | Saved Successfully |
      | CWWrk_72 | CWWrk_72 | True   | Skill-1   | CWCON_7        | CWWO_7        |                 0 |              10 | Saved Successfully |
      | CWWrk_73 | CWWrk_73 | True   | Skill-1   | CWCON_7        | CWWO_7        |                 0 |              10 | Saved Successfully |
      | CWWrk_74 | CWWrk_74 | True   | Skill-1   | CWCON_7        | CWWO_7        |                 0 |              10 | Saved Successfully |

  @CW_8
  Scenario: Work Orders - Maximum Worker Limit - Check Limit = Enable - Limit check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_81   |
      | CWWrk_82   |
      | CWWrk_83   |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_8 | CWCON_8      |
    And Delete Contractor via API
      | id      |
      | CWCON_8 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_8 | CWCON_8 |              10 | CWCON_8        |         888888 | CWCON_8@cwm.com |      8000 | lic8        | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_8 | CWWO_8 |             0 |          10 | CWCON_8                  | Approval Stage-1  |              2 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation                    |
      | CWWrk_81 | CWWrk_81 | True   | Skill-1   | CWCON_8        | CWWO_8        |                 0 |              10 | Saved Successfully            |
      | CWWrk_82 | CWWrk_82 | True   | Skill-1   | CWCON_8        | CWWO_8        |                 0 |              10 | Saved Successfully            |
      | CWWrk_83 | CWWrk_83 | True   | Skill-1   | CWCON_8        | CWWO_8        |                 0 |              10 | Maximum Worker limit exceeded |

  @CW_9
  Scenario: Work Orders - Skill-Wise Worker Limit - Check Limit = Disable - Limit not check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_91   |
      | CWWrk_92   |
      | CWWrk_93   |
    And Delete WorkOrder via API
      | id     | contractorID |
      | CWWO_9 | CWCON_9      |
    And Delete Contractor via API
      | id      |
      | CWCON_9 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_9 | CWCON_9 |              10 | CWCON_9        |         888889 | CWCON_9@cwm.com |      9000 | lic9        | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name     | Default |
      | Skill-91 | False   |
      | Skill-92 | False   |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_9 | CWWO_9 |             0 |          10 | CWCON_9                  | Approval Stage-1  |             10 | False                        | Saved Successfully |
    And Set Skill-Wise Worker Limit for WorkOrder "CWWO_9"
      | SkillName | WorkerLimit |
      | Skill-91  |           2 |
      | Skill-92  |           3 |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_91 | CWWrk_91 | True   | Skill-91  | CWCON_9        | CWWO_9        |                 0 |              10 | Saved Successfully |
      | CWWrk_92 | CWWrk_92 | True   | Skill-91  | CWCON_9        | CWWO_9        |                 0 |              10 | Saved Successfully |
      | CWWrk_93 | CWWrk_93 | True   | Skill-91  | CWCON_9        | CWWO_9        |                 0 |              10 | Saved Successfully |

  @CW_10
  Scenario: Work Orders - Skill-Wise Worker Limit - Check Limit = Enable - Limit check - worker in skill1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_101  |
      | CWWrk_102  |
      | CWWrk_103  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_10 | CWCON_10     |
    And Delete Contractor via API
      | id       |
      | CWCON_10 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_10 | CWCON_10 |              10 | CWCON_10       |         888810 | CWCON_10@cwm.com |     10000 | lic10       | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name      | Default |
      | Skill-101 | False   |
      | Skill-102 | False   |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_10 | CWWO_10 |             0 |          10 | CWCON_10                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Set Skill-Wise Worker Limit for WorkOrder "CWWO_10"
      | SkillName | WorkerLimit |
      | Skill-101 |           2 |
      | Skill-102 |           3 |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation                               |
      | CWWrk_101 | CWWrk_101 | True   | Skill-101 | CWCON_10       | CWWO_10       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_102 | CWWrk_102 | True   | Skill-101 | CWCON_10       | CWWO_10       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_103 | CWWrk_103 | True   | Skill-101 | CWCON_10       | CWWO_10       |                 0 |              10 | Maximum Skill-Wise Worker limit exceeded |

  @CW_11
  Scenario: Work Orders - Skill-Wise Worker Limit - Check Limit = Enable - Limit check - 2 worker in skill1 and 4 worker in SKill2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_111  |
      | CWWrk_112  |
      | CWWrk_113  |
      | CWWrk_114  |
      | CWWrk_115  |
      | CWWrk_116  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_11 | CWCON_11     |
    And Delete Contractor via API
      | id       |
      | CWCON_11 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_11 | CWCON_11 |              11 | CWCON_11       |         888811 | CWCON_11@cwm.com |     11000 | lic11       | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name      | Default |
      | Skill-111 | False   |
      | Skill-112 | False   |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_11 | CWWO_11 |             0 |          10 | CWCON_11                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Set Skill-Wise Worker Limit for WorkOrder "CWWO_11"
      | SkillName | WorkerLimit |
      | Skill-111 |           2 |
      | Skill-112 |           3 |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation                               |
      | CWWrk_111 | CWWrk_111 | True   | Skill-111 | CWCON_11       | CWWO_11       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_112 | CWWrk_112 | True   | Skill-111 | CWCON_11       | CWWO_11       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_113 | CWWrk_113 | True   | Skill-112 | CWCON_11       | CWWO_11       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_114 | CWWrk_114 | True   | Skill-112 | CWCON_11       | CWWO_11       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_115 | CWWrk_115 | True   | Skill-112 | CWCON_11       | CWWO_11       |                 0 |              10 | Saved Successfully                       |
      | CWWrk_116 | CWWrk_116 | True   | Skill-112 | CWCON_11       | CWWO_11       |                 0 |              10 | Maximum Skill-Wise Worker limit exceeded |

  @CW_12
  Scenario: Work Orders - Maximum Worker Limit = 2 and Skill-Wise Worker Limit = 2 - Check Limit = Enable - validate Maximum Worker Limit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_121  |
      | CWWrk_122  |
      | CWWrk_123  |
      | CWWrk_124  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_12 | CWCON_12     |
    And Delete Contractor via API
      | id       |
      | CWCON_12 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_12 | CWCON_12 |              10 | CWCON_12       |         888812 | CWCON_12@cwm.com |     12000 | lic12       | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name      | Default |
      | Skill-121 | False   |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_12 | CWWO_12 |             0 |          10 | CWCON_12                 | Approval Stage-1  |              2 | True                         | Saved Successfully |
    And Set Skill-Wise Worker Limit for WorkOrder "CWWO_12"
      | SkillName | WorkerLimit |
      | Skill-121 |           2 |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation                    |
      | CWWrk_121 | CWWrk_121 | True   | Skill-121 | CWCON_12       | CWWO_12       |                 0 |              10 | Saved Successfully            |
      | CWWrk_122 | CWWrk_122 | True   | Skill-121 | CWCON_12       | CWWO_12       |                 0 |              10 | Saved Successfully            |
      | CWWrk_123 | CWWrk_123 | True   | Skill-121 | CWCON_12       | CWWO_12       |                 0 |              10 | Maximum Worker limit exceeded |

  @CW_13
  Scenario: Worker Assignment- Current Assignment from SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_131  |
      | CWWrk_132  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_13 | CWCON_13     |
    And Delete Contractor via API
      | id       |
      | CWCON_13 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_13 | CWCON_13 |              10 | CWCON_13       |         888813 | CWCON_13@cwm.com |     13000 | lic13       | True          | True             | Saved Successfully |
    When Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_13 | CWWO_13 |             0 |          10 | CWCON_13                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | CWWrk_131 | CWWrk_131 | True   | Skill-1   | CWCON_13       | Saved Successfully |
      | CWWrk_132 | CWWrk_132 | True   | Skill-1   | CWCON_13       | Saved Successfully |
    Then Worker Assignment in WorkOrder "CWWO_13" from CWM module
      | StartDate | EndDate | WorkerName |
      |         0 |      10 | CWWrk_131  |
      |         0 |      10 | CWWrk_132  |

  @CW_14
  Scenario: Worker Assignment- Current Assignment from CSS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_141  |
      | CWWrk_142  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_14 | CWCON_14     |
    And Delete Contractor via API
      | id       |
      | CWCON_14 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_14 | CWCON_14 |              10 | CWCON_14       |         888814 | CWCON_14@cwm.com |     14000 | lic14       | True          | True             | Saved Successfully |
    When Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_14 | CWWO_14 |             0 |          10 | CWCON_14                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | Validation         |
      | CWWrk_141 | CWWrk_141 | True   | Skill-1   | CWCON_14       | Saved Successfully |
      | CWWrk_142 | CWWrk_142 | True   | Skill-1   | CWCON_14       | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | CWCON_14 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | CWCON_14 | admin    | Welcome CWCON_14 |
    Then Worker Assignment in WorkOrder "CWWO_14" in CSS login
      | StartDate | EndDate | WorkerName |
      |         0 |      10 | CWWrk_141  |
      |         0 |      10 | CWWrk_142  |

  @CW_15
  Scenario: Worker Assignment- Unregistered Workers verify in SA and CSS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_15   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_15 | CWCON_15     |
    And Delete Contractor via API
      | id       |
      | CWCON_15 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_15 | CWCON_15 |              10 | CWCON_15       |         888815 | CWCON_15@cwm.com |     15000 | lic15       | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_15 | CWWO_15 |             0 |          10 | CWCON_15                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | CWCON_15 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | CWCON_15 | admin    | Welcome CWCON_15 |
    When Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | CWWrk_15   |       1 | CWWO_15     |             0 |          10 | Saved Successfully |
    Then Verify Unregistered Workers from Worker Assignment page in CSS login
      | WorkOrderID | WorkerName |
      | CWWO_15     | CWWrk_15   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | SA       | admin    | Welcome System Admin |
    And Verify Unregistered Workers from Worker Assignment page in CWM module
      | WorkOrderID | WorkerName |
      | CWWO_15     | CWWrk_15   |

  @CW_16
  Scenario Outline: Import Workers
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_161  |
      | CWWrk_162  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_16 | CWCON_16     |
    And Delete Contractor via API
      | id       |
      | CWCON_16 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_16 | CWCON_16 |              10 | CWCON_16       |         888816 | CWCON_16@cwm.com |     16000 | lic16       | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_16 | CWWO_16 |             0 |          10 | CWCON_16                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    When Import Data "Workers"
      | UserID    | UserName  | Full Name | SkillID | ContractorID | WorkOrderID | StartDate | EndDate |
      | CWWrk_161 | CWWrk_161 | CWWrk_161 | Skill-1 | CWCON_16     | CWWO_16     |         0 |      10 |
      | CWWrk_162 | CWWrk_162 | CWWrk_162 | Skill-1 | CWCON_16     | CWWO_16     |         0 |      10 |
    And Import "<File Format>" and check Imported Data for "Workers"
      | ID        | Result  | Description      |
      | CWWrk_161 | Success | New Worker added |
      | CWWrk_162 | Success | New Worker added |
    Then Verify Worker in Worker profile Page
      | WorkerName | Status |
      | CWWrk_161  | Active |
      | CWWrk_162  | Active |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @CW_17
  Scenario: BlackList - Contractor - Add to blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Contractor via API
      | id       |
      | CWCON_17 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_17 | CWCON_17 |              10 | CWCON_17       |         888817 | CWCON_17@cwm.com |     17000 | lic17       | True          | True             | Saved Successfully |
    When Add to blacklist "Contractor" from Blacklist page
      | Name     | Reason            |
      | CWCON_17 | AutomationTesting |
    Then Verify blacklisted "Contractor" in Blacklist page
      | Name     |
      | CWCON_17 |

  @CW_18
  Scenario: BlackList - Contractor - Remove from blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Contractor via API
      | id       |
      | CWCON_18 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_18 | CWCON_18 |              10 | CWCON_18       |         888818 | CWCON_18@cwm.com |     18000 | lic18       | True          | True             | Saved Successfully |
    And Add to blacklist "Contractor" from Blacklist page
      | Name     | Reason            |
      | CWCON_18 | AutomationTesting |
    When Restore from blacklist "Contractor" from Blacklist page
      | Name     |
      | CWCON_18 |
    Then Verify Restored "Contractor" from Blacklist page
      | Name     |
      | CWCON_18 |

  @CW_19
  Scenario: BlackList - Worker - Add to blacklist from Blacklist page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_19   |
    And Delete Contractor via API
      | id       |
      | CWCON_19 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_19 | CWCON_19 |              10 | CWCON_19       |         888819 | CWCON_19@cwm.com |     19000 | lic19       | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | Validation         |
      | CWWrk_19 | CWWrk_19 | True   | Skill-1   | CWCON_19       | Saved Successfully |
    When Add to blacklist "Worker" from Blacklist page
      | Name     | Reason            |
      | CWWrk_19 | AutomationTesting |
    Then Verify blacklisted "Worker" in Blacklist page
      | Name     |
      | CWWrk_19 |
    And Verify Worker in Worker profile Page
      | WorkerName | Status                 |
      | CWWrk_19   | Inactive (Blacklisted) |

  @CW_20
  Scenario: BlackList - Worker - Add to blacklist from worker profile
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_20   |
    And Delete Contractor via API
      | id       |
      | CWCON_20 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_20 | CWCON_20 |              10 | CWCON_20       |         888820 | CWCON_20@cwm.com |     20000 | lic20       | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | Validation         |
      | CWWrk_20 | CWWrk_20 | True   | Skill-1   | CWCON_20       | Saved Successfully |
    When Add to blacklist Worker from Worker profile page
      | Name     | Reason            |
      | CWWrk_20 | AutomationTesting |
    Then Verify blacklisted "Worker" in Blacklist page
      | Name     |
      | CWWrk_20 |
    And Verify Worker in Worker profile Page
      | WorkerName | Status                 |
      | CWWrk_20   | Inactive (Blacklisted) |

  @CW_21
  Scenario: BlackList - Worker - Remove from blacklist from Blacklist page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_21   |
    And Delete Contractor via API
      | id       |
      | CWCON_21 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_21 | CWCON_21 |              10 | CWCON_21       |         888821 | CWCON_21@cwm.com |     21000 | lic21       | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | Validation         |
      | CWWrk_21 | CWWrk_21 | True   | Skill-1   | CWCON_21       | Saved Successfully |
    And Add to blacklist "Worker" from Blacklist page
      | Name     | Reason            |
      | CWWrk_21 | AutomationTesting |
    When Restore from blacklist "Worker" from Blacklist page
      | Name     |
      | CWWrk_21 |
    Then Verify Restored "Worker" from Blacklist page
      | Name     |
      | CWWrk_21 |
    And Verify Worker in Worker profile Page
      | WorkerName | Status   |
      | CWWrk_21   | Inactive |

  @CW_22
  Scenario: BlackList - Worker - Remove from blacklist from worker profile
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_22   |
    And Delete Contractor via API
      | id       |
      | CWCON_22 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_22 | CWCON_22 |              10 | CWCON_22       |         888822 | CWCON_22@cwm.com |     22000 | lic22       | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | Validation         |
      | CWWrk_22 | CWWrk_22 | True   | Skill-1   | CWCON_22       | Saved Successfully |
    And Add to blacklist "Worker" from Blacklist page
      | Name     | Reason            |
      | CWWrk_22 | AutomationTesting |
    When Restore Worker from Worker profile Page
      | Name     |
      | CWWrk_22 |
    Then Verify Restored "Worker" from Blacklist page
      | Name     |
      | CWWrk_22 |
    And Verify Worker in Worker profile Page
      | WorkerName | Status |
      | CWWrk_22   | Active |

  @CW_23
  Scenario: Manage Workers- Same contractor and same work order - date change
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_231  |
      | CWWrk_232  |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_23 | CWCON_23     |
    And Delete Contractor via API
      | id       |
      | CWCON_23 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_23 | CWCON_23 |              10 | CWCON_23       |         888823 | CWCON_23@cwm.com |     23000 | lic23       | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_23 | CWWO_23 |             0 |          10 | CWCON_23                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_231 | CWWrk_231 | True   | Skill-1   | CWCON_23       | CWWO_23       |                 0 |              10 | Saved Successfully |
      | CWWrk_232 | CWWrk_232 | True   | Skill-1   | CWCON_23       | CWWO_23       |                 0 |              10 | Saved Successfully |
    When Manage Workers from CWM module
      | OldContractorID | OldWorkOrderID | WorkerList          | NewContractorID | NewWorkOrderID | NewAssStartDt | NewAssEndDt |
      | CWCON_23        | CWWO_23        | CWWrk_231,CWWrk_232 | CWCON_23        | CWWO_23        |             1 |           5 |
    Then Verify Worker in Worker profile Page
      | WorkerName | ContractorName | WorkOrderName | AssStartDt | AssEndDt |
      | CWWrk_231  | CWCON_23       | CWWO_23       |          1 |        5 |
      | CWWrk_232  | CWCON_23       | CWWO_23       |          1 |        5 |

  @CW_24
  Scenario: Manage Workers- Same contractor - work order change
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_241  |
      | CWWrk_242  |
    And Delete WorkOrder via API
      | id       | contractorID |
      | CWWO_241 | CWCON_24     |
      | CWWO_242 | CWCON_24     |
    And Delete Contractor via API
      | id       |
      | CWCON_24 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_24 | CWCON_24 |              10 | CWCON_24       |         888824 | CWCON_24@cwm.com |     24000 | lic24       | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id       | Name     | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_241 | CWWO_241 |             0 |          10 | CWCON_24                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
      | CWWO_242 | CWWO_242 |             0 |          10 | CWCON_24                 | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_241 | CWWrk_241 | True   | Skill-1   | CWCON_24       | CWWO_241      |                 0 |              10 | Saved Successfully |
      | CWWrk_242 | CWWrk_242 | True   | Skill-1   | CWCON_24       | CWWO_241      |                 0 |              10 | Saved Successfully |
    When Manage Workers from CWM module
      | OldContractorID | OldWorkOrderID | WorkerList          | NewContractorID | NewWorkOrderID | NewAssStartDt | NewAssEndDt |
      | CWCON_24        | CWWO_241       | CWWrk_241,CWWrk_242 | CWCON_24        | CWWO_242       |             0 |          10 |
    Then Verify Worker in Worker profile Page
      | WorkerName | ContractorName | WorkOrderName | AssStartDt | AssEndDt |
      | CWWrk_241  | CWCON_24       | CWWO_242      |          0 |       10 |
      | CWWrk_242  | CWCON_24       | CWWO_242      |          0 |       10 |

  @CW_25
  Scenario: Manage Workers- Contractor  change
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_251  |
      | CWWrk_252  |
    And Delete WorkOrder via API
      | id       | contractorID |
      | CWWO_251 | CWCON_251    |
      | CWWO_252 | CWCON_252    |
    And Delete Contractor via API
      | id        |
      | CWCON_251 |
      | CWCON_252 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1     | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_251 | CWCON_251 |              10 | CWCON_251      |        8888251 | CWCON_251@cwm.com |     25100 | lic251      | True          | True             | Saved Successfully |
      | CWCON_252 | CWCON_252 |              10 | CWCON_252      |        8888252 | CWCON_252@cwm.com |     25200 | lic252      | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id       | Name     | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_251 | CWWO_251 |             0 |          10 | CWCON_251                | Approval Stage-1  |             10 | True                         | Saved Successfully |
      | CWWO_252 | CWWO_252 |             0 |          10 | CWCON_252                | Approval Stage-1  |             10 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId  | name      | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_251 | CWWrk_251 | True   | Skill-1   | CWCON_251      | CWWO_251      |                 0 |              10 | Saved Successfully |
      | CWWrk_252 | CWWrk_252 | True   | Skill-1   | CWCON_251      | CWWO_251      |                 0 |              10 | Saved Successfully |
    When Manage Workers from CWM module
      | OldContractorID | OldWorkOrderID | WorkerList          | NewContractorID | NewWorkOrderID | NewAssStartDt | NewAssEndDt |
      | CWCON_251       | CWWO_251       | CWWrk_251,CWWrk_252 | CWCON_252       | CWWO_252       |             0 |          10 |
    Then Verify Worker in Worker profile Page
      | WorkerName | ContractorName | WorkOrderName | AssStartDt | AssEndDt |
      | CWWrk_251  | CWCON_252      | CWWO_252      |          0 |       10 |
      | CWWrk_252  | CWCON_252      | CWWO_252      |          0 |       10 |

  @CW_26
  Scenario: Work Order Progress
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                | 
    And Delete Worker from CWM module
      | WorkerName |
      | CWWrk_26   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | CWWO_26 | CWCON_26     |
    And Delete Contractor via API
      | id       |
      | CWCON_26 |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Direct             |                | False                              |
    When Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CWCON_26 | CWCON_26 |              10 | CWCON_26       |         888826 | CWCON_26@cwm.com |     26000 | lic26       | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | CWWO_26 | CWWO_26 |             0 |          10 | CWCON_26                 | Approval Stage-1  |              8 | True                         | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | SkillName | ContractorName | WorkOrderName | AssignmentStartDt | AssignmentEndDt | Validation         |
      | CWWrk_26 | CWWrk_26 | True   | Skill-1   | CWCON_26       | CWWO_26       |                 0 |              10 | Saved Successfully |
    Then Verify Work Order Progress from CWM module
      | Contractor | WorkOrder | DefinedStartDate | DefinedEndDate | WorkerLimit | AssignedWorkers | ManDays | ProgressStatus |
      | CWCON_26   | CWWO_26   |                0 |             10 |           8 |               1 |       0 | In Progress    |
