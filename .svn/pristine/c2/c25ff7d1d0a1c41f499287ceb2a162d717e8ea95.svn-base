@tag
Feature: API CWM Mdoule
  I want to use this template for my feature file

  #*********************************************************************************
  # 108 Worker
  #*********************************************************************************
  @API_108worker1
  Scenario: 108-worker General AutoGenerateWorkerID False and Prefix cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW1    |
      | MynkAPICw1 |
    And Delete Contractor via API
      | id       |
      | API_CON1 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDRangePrefix | FromIDRange | ToIDRange |
      | False                | API_CW        |           1 |   9999999 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON1 | API_CON1 |              10 | CWCON_1        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    When Execute scenario start from "scenario 1" to "scenario 14" in API sheet named "worker".
    Then Verify API sheet named "worker" and scenario start from "scenario 1" to "scenario 14" result "Pass".

  @API_108worker2
  Scenario: 108-worker General SA AutoGenerateWorkerID True length limit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | APIWRK1    |
      | APIWRK2    |
      | APIWRK3    |
      | APIWRK4    |
      | APIWRK5    |
      | APIWRK6    |
      | APIWRK7    |
      | APIWRK8    |
      | APIWRK9    |
    And Delete Contractor via API
      | id       |
      | API_CON2 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat       | NumValLength |
      | True                 | APIWRK*NUMVAL* |            1 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON2 | API_CON2 |              10 | CWCON_2        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    When Execute scenario start from "scenario 15" to "scenario 24" in API sheet named "worker".
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |
    Then Verify API sheet named "worker" and scenario start from "scenario 15" to "scenario 24" result "Pass".

  @API_108worker3
  Scenario: 108-worker General SA AutoGenerateWorkerID True length limit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName      |
      | APIWRKAPIWRKAP1 |
      | APIWRKAPIWRKAP2 |
      | APIWRKAPIWRKAP3 |
      | APIWRKAPIWRKAP4 |
      | APIWRKAPIWRKAP5 |
      | APIWRKAPIWRKAP6 |
      | APIWRKAPIWRKAP7 |
      | APIWRKAPIWRKAP8 |
      | APIWRKAPIWRKAP9 |
    And Delete Contractor via API
      | id       |
      | API_CON3 |
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID | IDFormat               | NumValLength |
      | True                 | APIWRKAPIWRKAP*NUMVAL* |            2 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON3 | API_CON3 |              10 | CWCON_3        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    When Execute scenario start from "scenario 25" to "scenario 34" in API sheet named "worker".
    And Set Auto Generate Worker ID configurations in GP
      | AutoGenerateWorkerID |
      | False                |
    Then Verify API sheet named "worker" and scenario start from "scenario 25" to "scenario 34" result "Pass".

  @API_108worker4
  Scenario: 108-worker General
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW4    |
      | API_CW5    |
      | API_CW6    |
      | API_CW7    |
      | API_CW8    |
      | API_CW9    |
      | API_CW10   |
      | API_CW11   |
    And Delete Contractor via API
      | id       |
      | API_CON4 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON4 | API_CON4 |              10 | CWCON_4        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    When Execute scenario start from "scenario 35" to "scenario 732" in API sheet named "worker".
    Then Verify API sheet named "worker" and scenario start from "scenario 35" to "scenario 732" result "Pass".

  @API_108worker5
  Scenario: 108-worker CWM related parameters
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW12   |
      | API_CW13   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | APIWO_5 | API_CON5     |
      | APIWO_6 | API_CON5     |
    And Delete Contractor via API
      | id       |
      | API_CON5 |
      | API_CON6 |
      | API_CON7 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON5 | API_CON5 |              10 | CWCON_5        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
      | API_CON6 | API_CON6 |               0 | CWCON_6        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
      | API_CON7 | API_CON7 |              10 | CWCON_7        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name     | Default |
      | APISkill | False   |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | APIWO_5 | APIWO_5 |             0 |          10 | API_CON5                 | Approval Stage-1  |             10 | False                        | Saved Successfully |
      | APIWO_6 | APIWO_6 |             5 |          10 | API_CON5                 | Approval Stage-1  |             10 | False                        | Saved Successfully |
    When Execute scenario start from "scenario 733" to "scenario 774" in API sheet named "worker".
    Then Verify API sheet named "worker" and scenario start from "scenario 733" to "scenario 774" result "Pass".

  @API_108worker6
  Scenario: 108-worker Worker limit in Work Order
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW14   |
      | API_CW15   |
      | API_CW16   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | APIWO_8 | API_CON8     |
      | APIWO_9 | API_CON8     |
    And Delete Contractor via API
      | id       |
      | API_CON8 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON8 | API_CON8 |              10 | CWCON_8        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    And Create Skill from CWM module
      | Name      | Default |
      | APISkill1 | False   |
      | APISkill2 | False   |
    And Create WorkOrder from CWM module
      | Id      | Name    | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | APIWO_8 | APIWO_8 |             0 |          10 | API_CON8                 | Approval Stage-1  |              1 | True                         | Saved Successfully |
      | APIWO_9 | APIWO_9 |             0 |          10 | API_CON8                 | Approval Stage-1  |              5 | True                         | Saved Successfully |
    And Set Skill-Wise Worker Limit for WorkOrder "APIWO_9"
      | SkillName | WorkerLimit |
      | Skill-1   |           1 |
      | APISkill2 |           2 |
    When Execute scenario start from "scenario 775" to "scenario 778" in API sheet named "worker".
    Then Verify API sheet named "worker" and scenario start from "scenario 775" to "scenario 778" result "Pass".

  @API_108worker7
  Scenario: 108-worker Custom Field
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW17   |
    And Delete Contractor via API
      | id        |
      | API_CON10 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON10 | API_CON10 |              10 | CWCON_8        |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | True   | Adhar     | Textbox | False  | True      |
      | True   | PanCard   | Date    | False  | True      |
    When Execute scenario start from "scenario 779" to "scenario 785" in API sheet named "worker".
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | False  | Adhar     | Textbox | False  | False     |
      | False  | PanCard   | Date    | False  | False     |
    Then Verify API sheet named "worker" and scenario start from "scenario 779" to "scenario 785" result "Pass".

  @API_108worker8
  Scenario: 108-worker GET DELETE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API_CW18   |
    And Delete WorkOrder via API
      | id       | contractorID |
      | APIWO_11 | API_CON11    |
    And Delete Contractor via API
      | id        |
      | API_CON11 |
    And Create Contractor from CWM module
      | Id        | name      | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1 | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | API_CON11 | API_CON11 |        31122035 | CWCON_11       |         888881 | CWCON@cwm.com |      1000 | lic1        | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id       | Name     | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | ChkLimitWhileAssigningWorker | Validation         |
      | APIWO_11 | APIWO_11 |      21122035 |    31122035 | API_CON11                | Approval Stage-1  |             10 | False                        | Saved Successfully |
    When Execute scenario start from "scenario 786" to "scenario 802" in API sheet named "worker".
    Then Verify API sheet named "worker" and scenario start from "scenario 786" to "scenario 802" result "Pass".

  #*********************************************************************************
  # 107 Contractor
  #*********************************************************************************
  @API_107Contractor_1
  Scenario: Contractor API - Get, Set, Delete
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | APIWrk_1   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | APIWO_1 | APICon1      |
    And Delete Contractor via API
      | id      |
      | APICon1 |
      | APICon2 |
      | APICon3 |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type | Upload | Mandatory |
      | False  | Adhar       | Date | false  | false     |
      | False  | PanCard     | Date | false  | false     |
      | False  | VotingCard  | Date | false  | false     |
      | False  | CitizenCard | Date | false  | false     |
      | False  | IDCard      | Date | false  | false     |
      | False  | Field 6     | Date | false  | false     |
      | False  | Field 7     | Date | false  | false     |
      | False  | Field 8     | Date | false  | false     |
      | False  | Field 9     | Date | false  | false     |
      | False  | Field 10    | Date | false  | false     |
    When Execute scenario start from "Scenario 1" to "Scenario 110" in API sheet named "contractor".
    Then Verify API sheet named "contractor" and scenario start from "Scenario 1" to "Scenario 110" result "Pass".

  @API_107Contractor_2
  Scenario: Contractor API- Set, field<no>, Type=Textbox
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | APIWrk_1   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | APIWO_1 | APICon1      |
    And Delete Contractor via API
      | id      |
      | APICon1 |
      | APICon2 |
      | APICon3 |
      | APICon4 |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | True   | Adhar       | Textbox | True   | True      |
      | True   | PanCard     | Textbox | True   | True      |
      | True   | VotingCard  | Textbox | True   | True      |
      | True   | CitizenCard | Textbox | True   | True      |
      | True   | IDCard      | Textbox | True   | True      |
      | True   | Field 6     | Textbox | True   | True      |
      | True   | Field 7     | Textbox | True   | True      |
      | True   | Field 8     | Textbox | True   | True      |
      | True   | Field 9     | Textbox | True   | True      |
      | True   | Field 10    | Textbox | True   | True      |
    When Execute scenario start from "Scenario 111" to "Scenario 160" in API sheet named "contractor".
    Then Verify API sheet named "contractor" and scenario start from "Scenario 111" to "Scenario 160" result "Pass".
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type    | Upload | Mandatory |
      | False  | Adhar       | Textbox | True   | false     |
      | False  | PanCard     | Textbox | True   | false     |
      | False  | VotingCard  | Textbox | True   | false     |
      | False  | CitizenCard | Textbox | True   | false     |
      | False  | IDCard      | Textbox | True   | false     |
      | False  | Field 6     | Textbox | True   | false     |
      | False  | Field 7     | Textbox | True   | false     |
      | False  | Field 8     | Textbox | True   | false     |
      | False  | Field 9     | Textbox | True   | false     |
      | False  | Field 10    | Textbox | True   | false     |

  @API_107Contractor_3
  Scenario: Contractor API - Set, field<no>, Type=Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | APIWrk_1   |
    And Delete WorkOrder via API
      | id      | contractorID |
      | APIWO_1 | APICon1      |
    And Delete Contractor via API
      | id      |
      | APICon1 |
      | APICon2 |
      | APICon3 |
      | APICon4 |
    When Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type | Upload | Mandatory |
      | True   | Adhar       | Date | True   | True      |
      | True   | PanCard     | Date | True   | True      |
      | True   | VotingCard  | Date | True   | True      |
      | True   | CitizenCard | Date | True   | True      |
      | True   | IDCard      | Date | True   | True      |
      | True   | Field 6     | Date | True   | True      |
      | True   | Field 7     | Date | True   | True      |
      | True   | Field 8     | Date | True   | True      |
      | True   | Field 9     | Date | True   | True      |
      | True   | Field 10    | Date | True   | True      |
    When Execute scenario start from "Scenario 161" to "Scenario 170" in API sheet named "contractor".
    Then Verify API sheet named "contractor" and scenario start from "Scenario 161" to "Scenario 170" result "Pass".
    And Set custom fields for "Contractors" in GP
      | Active | FieldName   | Type | Upload | Mandatory |
      | False  | Adhar       | Date | True   | false     |
      | False  | PanCard     | Date | True   | false     |
      | False  | VotingCard  | Date | True   | false     |
      | False  | CitizenCard | Date | True   | false     |
      | False  | IDCard      | Date | True   | false     |
      | False  | Field 6     | Date | True   | false     |
      | False  | Field 7     | Date | True   | false     |
      | False  | Field 8     | Date | True   | false     |
      | False  | Field 9     | Date | True   | false     |
      | False  | Field 10    | Date | True   | false     |

  #*********************************************************************************
  # 109 work-order
  #*********************************************************************************
  @API_109work-order_1
  Scenario: 109-work-order - SET GET Case1 Auto Generate ID
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete WorkOrder via API
      | id              | contractorID |
      | Mayank@_/:.0123 | API109_C1    |
      | API109_WO1      | API109_C1    |
      | API109_WO2      | API109_C1    |
      | API109_WO3      | API109_C1    |
      | API109_WO4      | API109_C1    |
      | API109_WO5      | API109_C1    |
      | API109_WO6      | API109_C1    |
      | API109_WO7      | API109_C1    |
      | API109_WO8      | API109_C1    |
      | API109_WO9      | API109_C1    |
      | API109_WO10     | API109_C1    |
      | API109_WO001    | API109_C1    |
    And Delete Contractor via API
      | id        |
      | API109_C1 |
    When Execute scenario start from "scenario 1" to "scenario 38" in API sheet named "work-order".
    Then Verify API sheet named "work-order" and scenario start from "scenario 1" to "scenario 38" result "Pass".

  @API_109work-order_2
  Scenario: 109-work-order - SET GET Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName  |
      | API109_W13  |
      | API109_W14  |
      | API109_W15  |
      | API109_W181 |
      | API109_W182 |
      | API109_W19  |
      | API109_W20  |
      | API109_W21  |
    And Delete WorkOrder via API
      | id          | contractorID    |
      | API109_WO11 | API109_C2       |
      | API109_WO12 | API109_C2       |
      | API109_WO13 | API109_C2       |
      | API109_WO14 | API109_C2       |
      | API109_WO15 | mayank@_:./1234 |
      | API109_WO16 | API109_C2       |
      | API109_WO17 | API109_C2       |
      | API109_WO18 | API109_C2       |
      | API109_WO19 | API109_C2       |
      | API109_WO20 | API109_C2       |
      | API109_WO21 | API109_C2       |
      | API109_WO22 | API109_C2       |
      | API109_WO23 | API109_C2       |
    And Delete Contractor via API
      | id              |
      | API109_C2       |
      | mayank@_:./1234 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | A109O1 | Deleted Successfully |
      | Branch       | A109B1 | Deleted Successfully |
      | Department   | A109D1 | Deleted Successfully |
    When Execute scenario start from "scenario 39" to "scenario 159" in API sheet named "work-order".
    Then Verify API sheet named "work-order" and scenario start from "scenario 39" to "scenario 159" result "Pass".

  @API_109work-order_3
  Scenario: 109-work-order - DELETE Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Worker from CWM module
      | WorkerName |
      | API109_W24 |
    And Delete WorkOrder via API
      | id          | contractorID |
      | API109_WO24 | API109_C3    |
    And Delete Contractor via API
      | id        |
      | API109_C3 |
    When Execute scenario start from "scenario 160" to "scenario 170" in API sheet named "work-order".
    Then Verify API sheet named "work-order" and scenario start from "scenario 160" to "scenario 170" result "Pass".

     #*********************************************************************************
  # 75 job
  #*********************************************************************************
  @JPCAPI_1
  Scenario: Job - get, set
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Job Costing in GP
      | MergeWithConsecutiveJob |
      | None                    |
    And Delete user via API
      | UserID    |
      | JPCAPIUr1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | APIPrj01    |
    And Delete Phase from Job Processing and Costing
      | PhaseName  |
      | APIPhase01 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCAPI1 |
      | JPCAPI2 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCAPI2 | JPCAPI2 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name       | Description | Validation         |
      | APIPhase01 | JPCAPIAuto  | Saved Successfully |
    And Create Project "APIPrj01" with StartDate "-1" and EndDate "1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase      | StartDate | EndDate |
      | API01             | APIPhase01 |         0 |       0 |
    And Set Job Configuration in Phase "APIPhase01" of Project "APIPrj01" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPCAPI2 |         0 |       0 |
    When Execute scenario start from "Scenario 1" to "Scenario 31" in API sheet named "job".
    Then Verify API sheet named "job" and scenario start from "Scenario 1" to "Scenario 31" result "Pass".

  @JPCAPI_2
  Scenario: Job - get, set
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | JPCAPIUr1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | APIPrj01    |
    And Delete Phase from Job Processing and Costing
      | PhaseName  |
      | APIPhase01 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCAPI1 |
      | JPCAPI2 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCAPI1 | JPCAPI1 |            0 |          0 |        0002400 | Saved Successfully |
      | JPCAPI2 | JPCAPI2 |           -1 |          1 |        0002400 | Saved Successfully |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPCAPIUr1 | JPCAPIUr1 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    When Assign jobs to user="JPCAPIUr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCAPI1 |                 |               |
      | JPCAPI2 |                 |               |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | JPCAPIUr1 |          0 |     090000 |
      | JPCAPIUr1 |          0 |     120000 |
      | JPCAPIUr1 |          0 |     120000 |
      | JPCAPIUr1 |          0 |     160000 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | JPCAPIUr1 |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 32" to "Scenario 32" in API sheet named "job".
    Then Verify API sheet named "job" and scenario start from "Scenario 32" to "Scenario 32" result "Pass".

  #*********************************************************************************
  # 80 timesheet-correction-application & 78 timesheet-correction-authorization
  #*********************************************************************************
  @JPCAPI_3
  Scenario: Timesheet correction Application and Authorization - Get, Set
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | JPCAPIUr1  |
      | JPCAPIUr2  |
      | JPCAPIUr3  |
      | JPCAPIUr4  |
      | JPCAPIUr5  |
      | JPCAPIUr6  |
      | JPCAPIUr7  |
      | JPCAPIRic1 |
      | JPCAPIRic2 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | APIPrj01    |
    And Delete Phase from Job Processing and Costing
      | PhaseName  |
      | APIPhase01 |
      | APIPhase02 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCAPI1 |
      | JPCAPI2 |
    And Delete "BL" shift schedule
    And Delete "_L" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | _L      | 09:00     | 18:00   | 04:00   | 08:00   | 12:00      | 13:00    | true                | Saved Successfully |
    And Create Shift Schedule "BL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | _L      |               7 | true   |
    And Configure Off Day Configuration in Shift Schedule "BL"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPCAPIRic1 | JPCAPIRic1 |               1 |         1 |               1 |                  1 |               |                |                     |
      | JPCAPIRic2 | JPCAPIRic2 |               1 |         1 |               1 |                  1 |               |                |                     |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1       | RIC2       | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportGrp1   | AnyOne         | JPCAPIRic1 |            |      |      |      | Saved Successfully |
      | API_ReportGrp2   | All Sequential | JPCAPIRic1 | JPCAPIRic2 |      |      |      | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCAPI1 | JPCAPI1 |           -6 |          2 |        0002000 | Saved Successfully |
      | JPCAPI2 | JPCAPI2 |            0 |          2 |        0002000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name       | Description      | Validation         |
      | APIPhase01 | JPCAPIAutomation | Saved Successfully |
      | APIPhase02 | JPCAPIAutomation | Saved Successfully |
    And Create Project "APIPrj01" with StartDate "-6" and EndDate "2" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase      | StartDate | EndDate |
      | JPCAPI1           | APIPhase01 |        -6 |       2 |
      | JPCAPI2           | APIPhase02 |         0 |       2 |
    And Set Job Configuration in Phase "APIPhase01" of Project "APIPrj01" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPCAPI1 |        -6 |       2 |
      | JPCAPI2 |         0 |       2 |
    And Create user from user configuration
      | userid    | Active | JoiningDate | ReportingGroup | ShiftSchedule | AtdEnable | JobCosting | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | JPCAPIUr1 | True   |             | API_ReportGrp1 | BL            | True      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr2 | True   |             |                | BL            | True      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr3 | True   |             | API_ReportGrp1 | BL            | true      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr4 | True   |           2 | API_ReportGrp1 | BL            | True      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr5 | True   | 01/01/2014  | API_ReportGrp1 | BL            | True      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr6 | True   |             | API_ReportGrp2 | BL            | true      | Enabled    | True      | True      | True      | True               | Saved Successfully |
      | JPCAPIUr7 | True   |             | API_ReportGrp1 | BL            | true      | Enabled    | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | JPCAPIUr1  |                          1 | admin        |    1 |
      | JPCAPIUr2  |                          1 | admin        |    1 |
      | JPCAPIUr3  |                          1 | admin        |    1 |
      | JPCAPIUr4  |                          1 | admin        |    1 |
      | JPCAPIUr5  |                          1 | admin        |    1 |
      | JPCAPIUr6  |                          1 | admin        |    1 |
      | JPCAPIUr7  |                          1 | admin        |    1 |
      | JPCAPIRic1 |                          1 | admin        |    1 |
      | JPCAPIRic2 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID    |
      | JPCAPIUr1 |
      | JPCAPIUr2 |
      | JPCAPIUr3 |
      | JPCAPIUr4 |
      | JPCAPIUr5 |
      | JPCAPIUr6 |
      | JPCAPIUr7 |
    And Set event via Event Set API
      | Userid    | event-date | event-time | Spfid |
      | JPCAPIUr1 |          0 |     090000 |       |
      | JPCAPIUr1 |          0 |     140000 |       |
      | JPCAPIUr1 |          1 |     090000 |       |
      | JPCAPIUr1 |          1 |     120000 |       |
      | JPCAPIUr1 |         -1 |     090000 |       |
      | JPCAPIUr1 |         -1 |     120000 |       |
      | JPCAPIUr1 |         -2 |     090000 |       |
      | JPCAPIUr1 |         -2 |     120000 |       |
      | JPCAPIUr1 |         -3 |     091500 |       |
      | JPCAPIUr1 |         -3 |     120000 |       |
      | JPCAPIUr1 |         -3 |     130000 |       |
      | JPCAPIUr1 |         -3 |     160000 |       |
      | JPCAPIUr1 |         -4 |     092000 |       |
      | JPCAPIUr1 |         -4 |     160000 |       |
      | JPCAPIUr1 |         -5 |     092000 |       |
      | JPCAPIUr1 |         -5 |     160000 |       |
      | JPCAPIUr1 |         -6 |     092000 |       |
      | JPCAPIUr1 |         -6 |     160000 |       |
      | JPCAPIUr2 |          0 |     090000 |       |
      | JPCAPIUr2 |          0 |     120000 |       |
      | JPCAPIUr3 |          0 |     093000 |       |
      | JPCAPIUr3 |          0 |     160000 |       |
      | JPCAPIUr3 |         -1 |     090000 |       |
      | JPCAPIUr3 |         -1 |     160000 |       |
      | JPCAPIUr3 |         -2 |     090000 |       |
      | JPCAPIUr3 |         -2 |     160000 |       |
      | JPCAPIUr4 |         -1 |     090000 |       |
      | JPCAPIUr4 |         -1 |     120000 |       |
      | JPCAPIUr5 |          0 |     090000 |       |
      | JPCAPIUr5 |          0 |     120000 |       |
      | JPCAPIUr5 |          1 |     090000 |       |
      | JPCAPIUr5 |          1 |     120000 |       |
      | JPCAPIUr6 |          0 |     090000 |       |
      | JPCAPIUr6 |          0 |     120000 |       |
      | JPCAPIUr7 |         -6 |     090000 |       |
      | JPCAPIUr7 |         -6 |     120000 |       |
    And Generate ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | spfid1 | reason-1     | appliedBy |
      | JPCAPIUr3 |               0 |      2 | ByAutomation | JPCAPIUr3 |
    When Execute scenario start from "Scenario 1" to "Scenario 16" in API sheet named "timesheet-correction".
    Then Verify API sheet named "timesheet-correction" and scenario start from "Scenario 1" to "Scenario 16" result "Pass".

    #*********************************************************************************
  # 33 leave-balance
  #*********************************************************************************
  @API_33LvBl1
  Scenario: 33-leave-balance -  33-leave-balance - Leave Credit  Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | MA      | API_MA    | Paid Leave |           0.0 |        99.0 | Single App     |               |           | Saved Successfully |
      | MB      | API_MB    | Paid Leave |           0.0 |        99.0 | Single App     | True          |         2 | Saved Successfully |
      | MC      | API_MC    | Paid Leave |           0.0 |        99.0 | Single App     | True          |         2 | Saved Successfully |
    And Create Leave Group "API_MA" with Pro-rata "False"
      | LeaveID |
      | MA      |
    And Create Leave Group "API_MA2" with Pro-rata "True"
      | LeaveID |
      | MA      |
    And Create Leave Group "API_MBC" with Pro-rata "False"
      | LeaveID |
      | MB      |
      | MC      |
    And Create user from user configuration
      | userid  | Active | JoiningDate | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | 12/01/2023  | API_MA2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | 11/01/2023  | API_MA2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   |             | API_MBC    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   |             | API_MBC    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays          | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May | June | July | August | September | October | November | December | Validation         |
      | API_Cr1     | Monthly      | Fixed       | Days            |               |                  |             |                |          |        |        |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr2     | Monthly      | Calculated  | Days            |             1 | Payable Days     | Presents    |                |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr3     | Monthly      | Calculated  | Days            |             1 | Non-Payable Days |             | Absents        |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr4     | Yearly       | Fixed       | Days            |               |                  |             |                |          |        |        |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr5     | Yearly       | Calculated  | Days            |             1 | Payable Days     | Presents    |                |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr6     | Yearly       | Calculated  | Days            |             1 | Non-Payable Days |             | Absents        |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
    And Add Considered Attendance values in "API_Cr2" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr3" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr5" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr6" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    When Execute scenario start from "scenario 1" to "scenario 26" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 1" to "scenario 26" result "Pass".

  @API_33LvBl2
  Scenario: 33-leave-balance -  Leave Credit  Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | MD      | API_MD    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           |               |          |          | Saved Successfully |
      | ME      | API_ME    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True          |      020 |       00 | Saved Successfully |
      | MF      | API_MF    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True          |      020 |       00 | Saved Successfully |
    And Create Leave Group "API_MD" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create Leave Group "API_MD2" with Pro-rata "True"
      | LeaveID |
      | MD      |
    And Create Leave Group "API_MEF" with Pro-rata "False"
      | LeaveID |
      | ME      |
      | MF      |
    And Create user from user configuration
      | userid  | Active | JoiningDate | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | 12/01/2023  | API_MD2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | 11/01/2023  | API_MD2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   |             | API_MEF    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   |             | API_MEF    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | CrHrs  | PreviMonConsi | AtdDays          | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May   | June  | July  | August | September | October | November | December | Validation         |
      | API_Cr7     | Monthly      | Fixed       | Hours           |        |               |                  |             |                |          |        |        | 10:00   | 10:00    | 10:00 | 10:00 | 10:00 | 10:00 | 10:00 | 10:00  | 10:00     | 10:00   | 10:00    | 10:00    | Saved Successfully |
      | API_Cr8     | Monthly      | Calculated  | Hours           |        |             1 | Payable Days     | Presents    |                |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr9     | Monthly      | Calculated  | Hours           |        |             1 | Non-Payable Days |             | Absents        |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr10    | Yearly       | Fixed       | Hours           | 030:00 |               |                  |             |                |          |        |        |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr11    | Yearly       | Calculated  | Hours           |        |             1 | Payable Days     | Presents    |                |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr12    | Yearly       | Calculated  | Hours           |        |             1 | Non-Payable Days |             | Absents        |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
    And Add Considered Attendance values in "API_Cr8" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr9" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr11" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr12" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    When Execute scenario start from "scenario 30" to "scenario 70" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 30" to "scenario 70" result "Pass".

  @API_33LvBl3
  Scenario: 33-leave-balance -  Leave Debit  Leave Type= Paid Leave & Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MG      | API_MG    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | MH      | API_MH    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "API_MGH" with Pro-rata "False"
      | LeaveID |
      | MG      |
      | MH      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
    When Execute scenario start from "scenario 71" to "scenario 78" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 71" to "scenario 78" result "Pass".

  @API_33LvBl4
  Scenario: 33-leave-balance -  Leave Encashment  Leave Type= Paid Leave & Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | MI      | API_MI    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | True     | Saved Successfully |
      | MJ      | API_MJ    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | Saved Successfully |
    And Create Leave Group "API_MIJ" with Pro-rata "False"
      | LeaveID |
      | MI      |
      | MJ      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
    When Execute scenario start from "scenario 79" to "scenario 102" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 79" to "scenario 102" result "Pass".

  @API_33LvBl5
  Scenario: 33-leave-balance -  C-Off Encashment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MK      | API_MK    | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "API_MK" with Pro-rata "False"
      | LeaveID |
      | MK      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MK     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MK     | True      | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    When Execute scenario start from "scenario 103" to "scenario 103" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 103" to "scenario 103" result "Pass".
    And Manual Overtime/C-OFF Entry for UserID= "API_BL1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "API_BL2" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    When Execute scenario start from "scenario 104" to "scenario 109" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 104" to "scenario 109" result "Pass".

  @API_33LvBl6
  Scenario: 33-leave-balance -  Overflow Management = Discard
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | ML      | API_ML    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MM      | API_MM    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_ML" with Pro-rata "False"
      | LeaveID |
      | ML      |
      | MM      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_ML     | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 110" to "scenario 111" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 110" to "scenario 111" result "Pass".

  @API_33LvBl7
  Scenario: 33-leave-balance -  Overflow Management = Reuse
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | MN      | API_MN    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MO      | API_MO    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_MNO" with Pro-rata "False"
      | LeaveID |
      | MN      |
      | MO      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MNO    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MNO    | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
      | API_BL2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 112" to "scenario 115" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 112" to "scenario 115" result "Pass".

  @API_33LvBl8
  Scenario: 33-leave-balance -  Overflow Management = Encash
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | MP      | API_MP    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MQ      | API_MQ    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_MPQ" with Pro-rata "False"
      | LeaveID |
      | MP      |
      | MQ      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MPQ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MPQ    | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
      | API_BL2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 116" to "scenario 117" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 116" to "scenario 117" result "Pass".

  @API_33LvBl9
  Scenario: 33-leave-balance -  Leave Credit - General case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MR      | API_MR    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | MS      | API_MS    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "API_MRS" with Pro-rata "False"
      | LeaveID |
      | MR      |
      | MS      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MRS    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May   | June  | July  | August | September | October | November | December | Validation         |
      | API_Cr1     | Monthly      | Fixed       | Days            |               |         |             |                |          |        |        |       1 |        1 |     1 |     1 |     1 |     1 |     1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr7     | Monthly      | Fixed       | Hours           |               |         |             |                |          |        |        | 10:00   | 10:00    | 10:00 | 10:00 | 10:00 | 10:00 | 10:00 | 10:00  | 10:00     | 10:00   | 10:00    | 10:00    | Saved Successfully |
    When Execute scenario start from "scenario 118" to "scenario 120" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 118" to "scenario 120" result "Pass".

  #*********************************************************************************
  # 33 leave-application & 34 leave-approval
  #*********************************************************************************
  @LM_API_1
  Scenario: Leave Application and Approval, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIUr1  |
      | APIUr2  |
      | APIUr3  |
      | APIUr4  |
      | APIUr5  |
      | APIUr6  |
      | APIUr7  |
      | APIRic1 |
      | APIRic2 |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ID     | API_Tour_ID |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | HS      | API_HS    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 |          | Saved Successfully |
      | HR      | API_HR    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |          | Saved Successfully |
    And Create Leave Group "API_LvGrp1" with Pro-rata "False"
      | LeaveID |
      | HS      |
      | HR      |
      | ID      |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1 | APIRic1 |               1 |         1 |               1 |                  1 |
      | APIRic2 | APIRic2 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
      | API_ReportingGrp2 | AnyOne     | APIRic2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup    | LeaveGroup | AtdEnable | RestrHalfDayCons | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   | API_ReportingGrp1 | API_LvGrp1 | True      | True             | True      | True      | True      | True               | Saved Successfully |
      | APIUr4 | True   | API_ReportingGrp2 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr5 | True   | API_ReportingGrp2 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr6 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr7 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIUr4  |                          1 | admin        |    1 |
      | APIUr5  |                          1 | admin        |    1 |
      | APIUr6  |                          1 | admin        |    1 |
      | APIUr7  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
      | APIRic2 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
    When Execute scenario start from "scenario 1" to "scenario 44" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 1" to "scenario 44" result "Pass".

  @LM_API_2
  Scenario: Leave Club Rule, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIUr1  |
      | APIUr2  |
      | APIUr3  |
      | APIUr4  |
      | APIUr5  |
      | APIUr6  |
      | APIUr7  |
      | APIRic1 |
      | APIRic2 |
    And Delete "BC" shift schedule
    And Delete "BC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BC      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BC"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | ChkClbAcross        | Validation         |
      | HU      | API_HU    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Week-Offs & PH Only | Saved Successfully |
      | HV      | API_HV    | Lay off           |           0.0 |        99.0 | Single App     |           |                 |                 |                     | Saved Successfully |
      | HY      | API_HY    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Week-Offs & PH Only | Saved Successfully |
      | IE      | API_IE    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |                     | Saved Successfully |
      | HX      | API_HX    | Unpaid            |           0.0 |        99.0 | Single App     |           |                 |                 |                     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "HU"
      | LeaveName | Enable |
      | API_HV    | true   |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "HY"
      | LeaveName | Enable |
      | API_IE    | true   |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | AlwWithAllOthrTour | Validation         |
      | IB     | API_Tour_IB |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
      | IC     | API_Tour_IC |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
    And Configure Tours which cannot be Clubbed for TourID = "IB"
      | TourName    | Enable |
      | API_Tour_IC | true   |
      | API_HX      | true   |
    And Create Leave Group "API_LvGrp2" with Pro-rata "False"
      | LeaveID |
      | HU      |
      | HV      |
      | HY      |
      | HX      |
      | IB      |
      | IC      |
      | IE      |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1 | APIRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup    | LeaveGroup | AtdEnable | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Change Shift via API
      | userid | FromDt | ToDt | shift-id | week-off | public-holiday |
      | APIUr1 |     -2 |   -2 |          |        1 |                |
      | APIUr1 |      1 |    1 |          |        1 |                |
      | APIUr2 |      0 |    0 |          |        1 |                |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |    1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |    1 |          | credit | 060:00 |
    When Execute scenario start from "scenario 45" to "scenario 51" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 45" to "scenario 51" result "Pass".

  @LM_API_3
  Scenario: Leave Application Validation, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | APIUr1   |
      | APIUr2   |
      | APIUr3   |
      | APIUr4   |
      | APIUr5   |
      | APIUr6   |
      | APIUr7   |
      | APIUr999 |
      | APIRic1  |
      | APIRic2  |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | TourDocReq      | MinTrDayForDocCom | Validation         |
      | HZ     | API_Tour_HZ |           0.0 |        99.0 | Single App     | Upload Document |                 1 | Saved Successfully |
      | IC     | API_Tour_IC |           0.0 |        99.0 | Single App     |                 |                   | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | HS      | API_HS    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 |                 |           |          | Saved Successfully |
      | HR      | API_HR    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |                 |           |          | Saved Successfully |
      | HW      | API_HW    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Upload Document |           |          | Saved Successfully |
      | IA      | API_IA    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "API_LvGrp3" with Pro-rata "False"
      | LeaveID |
      | HS      |
      | HR      |
      | HW      |
      | HZ      |
      | IA      |
      | IC      |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1  | APIRic1  |               1 |         1 |               1 |                  1 |
      | APIUr999 | APIUr999 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup    | LeaveGroup | AtdEnable | RestrHalfDayCons | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr4 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr5 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr6 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIUr4  |                          1 | admin        |    1 |
      | APIUr5  |                          1 | admin        |    1 |
      | APIUr6  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |    1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    1 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    1 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 004:00 |
      | APIUr3 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 004:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr1 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 002:00 |
      | APIUr1 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 002:00 |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 040:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 040:00 |
      | APIUr6 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
    When Execute scenario start from "scenario 52" to "scenario 132" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 52" to "scenario 132" result "Pass".

     #*********************************************************************************
  # 40 attendance-correction & 51 attendance-correction-approval
  #*********************************************************************************
  @API_40-51AtdCorAppAppr1
  Scenario: 40-attendance-correction-51-attendance-correction-approval - General Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | API_AtdCor1 |
    And Create User via api
      | Id          | name        |
      | API_AtdCor1 | API_AtdCor1 |
    When Execute scenario start from "scenario 1" to "scenario 3" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 1" to "scenario 3" result "Pass".

  @API_40-51AtdCorAppAppr2
  Scenario: 40-attendance-correction-51-attendance-correction-approval - Attendance Correction Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | API_AtdCor2 |                2 | Attendance Correction    |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | API_AtdCor3 |                2 | Attendance Correction    |                          |                          | True                        | Restrict w.r.t Joining Date     | Days                    |                          2 | Saved Successfully |
      | API_AtdCor4 |                2 | Attendance Correction    |                          |                          | True                        | Restrict till Confirmation Date |                         |                            | Saved Successfully |
    And Create user from user configuration
      | userid      | JoiningDate | ConfirmationDate | AtdEnable | MaxPunchesToBeConsidered | AttendancePlc | ESSEnable | Validation         |
      | API_AtdCor2 |             |                  | True      |                        2 | API_AtdCor2   | True      | Saved Successfully |
      | API_AtdCor3 |          -4 |                  | True      |                        2 | API_AtdCor3   | True      | Saved Successfully |
      | API_AtdCor4 |          -4 |               -1 | True      |                        2 | API_AtdCor4   | True      | Saved Successfully |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | API_AtdCor2 |                          1 | admin        |    1 |
      | API_AtdCor3 |                          1 | admin        |    1 |
      | API_AtdCor4 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID      |
      | API_AtdCor2 |
      | API_AtdCor3 |
      | API_AtdCor4 |
    When Execute scenario start from "scenario 4" to "scenario 23" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 4" to "scenario 23" result "Pass".

  @API_40-51AtdCorAppAppr3
  Scenario: 40-attendance-correction-51-attendance-correction-approval - General Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_AtdCor5    |
      | API_AtdCor6    |
      | API_AtdCor7    |
      | API_AtdCor8    |
      | API_AtdCor9    |
      | API_AtdCor10   |
      | API_AtdCor11   |
      | API_AtdCor12   |
      | API_AtdCor14   |
      | API_AtdCorRIC1 |
      | API_AtdCorRIC3 |
      | API_AtdCorRIC4 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_AtdCor5    | API_AtdCor5    |               1 |         1 |
      | API_AtdCor6    | API_AtdCor6    |               1 |         1 |
      | API_AtdCor7    | API_AtdCor7    |               1 |         1 |
      | API_AtdCor8    | API_AtdCor8    |               1 |         1 |
      | API_AtdCor9    | API_AtdCor9    |               1 |         1 |
      | API_AtdCor10   | API_AtdCor10   |               1 |         1 |
      | API_AtdCor11   | API_AtdCor11   |               1 |         1 |
      | API_AtdCor12   | API_AtdCor12   |               1 |         1 |
      | API_AtdCor14   | API_AtdCor14   |               1 |         1 |
      | API_AtdCorRIC1 | API_AtdCorRIC1 |               1 |         1 |
      | API_AtdCorRIC3 | API_AtdCorRIC3 |               1 |         1 |
      | API_AtdCorRIC4 | API_AtdCorRIC4 |               1 |         1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_AtdCor5    |                          1 | admin        |    1 |
      | API_AtdCor6    |                          1 | admin        |    1 |
      | API_AtdCor7    |                          1 | admin        |    1 |
      | API_AtdCor8    |                          1 | admin        |    1 |
      | API_AtdCor9    |                          1 | admin        |    1 |
      | API_AtdCor10   |                          1 | admin        |    1 |
      | API_AtdCor11   |                          1 | admin        |    1 |
      | API_AtdCor12   |                          1 | admin        |    1 |
      | API_AtdCor14   |                          1 | admin        |    1 |
      | API_AtdCorRIC1 |                          1 | admin        |    1 |
      | API_AtdCorRIC3 |                          1 | admin        |    1 |
      | API_AtdCorRIC4 |                          1 | admin        |    1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | API_AtdCorRIC3 | All Sequential    | true       | true       | False      | False      | False      | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1           | RIC2           | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdCorRIC1   |                | API_AtdCorRIC1 |                |      |      |      | Saved Successfully |
      | API_AtdCorRIC3   | API_AtdCorRIC3 | API_AtdCorRIC3 | API_AtdCorRIC4 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | ReportingGroup | Validation         |
      | API_AtdCor5  |                        2 |                | Saved Successfully |
      | API_AtdCor6  |                        2 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor7  |                        4 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor8  |                        6 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor9  |                        8 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor10 |                       10 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor11 |                       12 | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor12 | N-Punch                  | API_AtdCorRIC1 | Saved Successfully |
      | API_AtdCor14 |                        2 | API_AtdCorRIC3 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor5  |
      | API_AtdCor6  |
      | API_AtdCor7  |
      | API_AtdCor8  |
      | API_AtdCor9  |
      | API_AtdCor10 |
      | API_AtdCor11 |
      | API_AtdCor12 |
      | API_AtdCor14 |
    When Execute scenario start from "scenario 24" to "scenario 127" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 24" to "scenario 127" result "Pass".

  @API_40-51AtdCorAppAppr4
  Scenario: 40-attendance-correction-51-attendance-correction-approval - Break Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | API_AtdCor13 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_AtdCor13   | API_AtdCor13   |               1 |         1 |
      | API_AtdCorRIC2 | API_AtdCorRIC2 |               1 |         1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_AtdCor13   |                          1 | admin        |    1 |
      | API_AtdCorRIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1           | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdCorRIC2   |        1 | API_AtdCorRIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | ReportingGroup | Validation         |
      | API_AtdCor13 |                        4 | API_AtdCorRIC2 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdCor13 |
    When Execute scenario start from "scenario 128" to "scenario 157" in API sheet named "attendance-correction-approval".
    Then Verify API sheet named "attendance-correction-approval" and scenario start from "scenario 128" to "scenario 157" result "Pass".

  #*********************************************************************************
  # 52 short-leave-entry & 53 short-leave-authorization
  #*********************************************************************************
  @API_52-53ShLvOfApp1
  Scenario: 52-short-leave-entry-53-short-leave-authorization - General Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_ShLvOfApp1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_ShLvOfApp1 | API_ShLvOfApp1 |               1 |         1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp1 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp1 |
    When Set event via Event Set API
      | Userid         | event-date | event-time |
      | API_ShLvOfApp1 |          0 |     100000 |
      | API_ShLvOfApp1 |          0 |     180000 |
    When Execute scenario start from "scenario 1" to "scenario 3" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 1" to "scenario 3" result "Pass".

  @API_52-53ShLvOfApp2
  Scenario: 52-short-leave-entry-53-short-leave-authorization - Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo    | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | API_ShLvOfApp2 |                2 | Short Leave/Official In-Out |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | API_ShLvOfApp3 |                2 | Short Leave/Official In-Out |                          |                          | True                        | Restrict w.r.t Joining Date     | Days                    |                          2 | Saved Successfully |
      | API_ShLvOfApp4 |                2 | Short Leave/Official In-Out |                          |                          | True                        | Restrict till Confirmation Date |                         |                            | Saved Successfully |
    And Create user from user configuration
      | userid         | JoiningDate | ConfirmationDate | AtdEnable | MaxPunchesToBeConsidered | AttendancePlc  | ESSEnable | Validation         |
      | API_ShLvOfApp2 |             |                  | True      |                        2 | API_ShLvOfApp2 | True      | Saved Successfully |
      | API_ShLvOfApp3 |          -4 |                  | True      |                        2 | API_ShLvOfApp3 | True      | Saved Successfully |
      | API_ShLvOfApp4 |          -4 |               -1 | True      |                        2 | API_ShLvOfApp4 | True      | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_ShLvOfApp2 |                          1 | admin        |    1 |
      | API_ShLvOfApp3 |                          1 | admin        |    1 |
      | API_ShLvOfApp4 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID         |
      | API_ShLvOfApp2 |
      | API_ShLvOfApp3 |
      | API_ShLvOfApp4 |
    When Set event via Event Set API
      | Userid         | event-date | event-time |
      | API_ShLvOfApp2 |         -1 |     100000 |
      | API_ShLvOfApp2 |         -1 |     180000 |
      | API_ShLvOfApp2 |         -2 |     100000 |
      | API_ShLvOfApp2 |         -2 |     180000 |
      | API_ShLvOfApp2 |         -6 |     100000 |
      | API_ShLvOfApp2 |         -6 |     180000 |
      | API_ShLvOfApp2 |         -5 |     100000 |
      | API_ShLvOfApp2 |         -5 |     180000 |
      | API_ShLvOfApp3 |         -3 |     100000 |
      | API_ShLvOfApp3 |         -3 |     180000 |
      | API_ShLvOfApp3 |         -2 |     100000 |
      | API_ShLvOfApp3 |         -2 |     180000 |
      | API_ShLvOfApp4 |         -2 |     100000 |
      | API_ShLvOfApp4 |         -2 |     180000 |
      | API_ShLvOfApp4 |         -1 |     100000 |
      | API_ShLvOfApp4 |         -1 |     180000 |
      | API_ShLvOfApp4 |          0 |     100000 |
      | API_ShLvOfApp4 |          0 |     180000 |
      | API_ShLvOfApp4 |          1 |     100000 |
      | API_ShLvOfApp4 |          1 |     180000 |
    When Execute scenario start from "scenario 4" to "scenario 22" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 4" to "scenario 22" result "Pass".

  @API_52-53ShLvOfApp3
  Scenario: 52-short-leave-entry-53-short-leave-authorization - General Cases
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
      | API_ShLvOfAppR1 |
      | API_ShLvOfAppR3 |
      | API_ShLvOfAppR4 |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login |
      | API_ShLvOfApp6  | API_ShLvOfApp6  |               1 |         1 |
      | API_ShLvOfApp7  | API_ShLvOfApp7  |               1 |         1 |
      | API_ShLvOfApp8  | API_ShLvOfApp8  |               1 |         1 |
      | API_ShLvOfApp9  | API_ShLvOfApp9  |               1 |         1 |
      | API_ShLvOfApp10 | API_ShLvOfApp10 |               1 |         1 |
      | API_ShLvOfApp11 | API_ShLvOfApp11 |               1 |         1 |
      | API_ShLvOfApp12 | API_ShLvOfApp12 |               1 |         1 |
      | API_ShLvOfApp14 | API_ShLvOfApp14 |               1 |         1 |
      | API_ShLvOfAppR1 | API_ShLvOfAppR1 |               1 |         1 |
      | API_ShLvOfAppR3 | API_ShLvOfAppR3 |               1 |         1 |
      | API_ShLvOfAppR4 | API_ShLvOfAppR4 |               1 |         1 |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | API_ShLvOfApp6  |                          1 | admin        |    1 |
      | API_ShLvOfApp7  |                          1 | admin        |    1 |
      | API_ShLvOfApp8  |                          1 | admin        |    1 |
      | API_ShLvOfApp9  |                          1 | admin        |    1 |
      | API_ShLvOfApp10 |                          1 | admin        |    1 |
      | API_ShLvOfApp11 |                          1 | admin        |    1 |
      | API_ShLvOfApp12 |                          1 | admin        |    1 |
      | API_ShLvOfApp14 |                          1 | admin        |    1 |
      | API_ShLvOfAppR1 |                          1 | admin        |    1 |
      | API_ShLvOfAppR3 |                          1 | admin        |    1 |
      | API_ShLvOfAppR4 |                          1 | admin        |    1 |
    And Create In/Out Reasons
      | Reason | Type | Validation         |
      | API_R1 | IN   | Saved Successfully |
      | API_R2 | OUT  | Saved Successfully |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | API_ShLvOfAppR3 | All Sequential    | true       | true       | False      | False      | False      | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName      | RIC1            | RIC2            | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ShLvOfAppR1  |                 | API_ShLvOfAppR1 |                 |      |      |      | Saved Successfully |
      | API_ShLvOfAppR3  | API_ShLvOfAppR3 | API_ShLvOfAppR3 | API_ShLvOfAppR4 |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | OffiInOutAuthReq | validation         |
      | API_ShLvOfApp |                2 | True          | True             | Saved Successfully |
    And Create user from user configuration
      | userid          | MaxPunchesToBeConsidered | AttendancePlc | ReportingGroup  | Validation         |
      | API_ShLvOfApp6  |                        2 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp7  |                        4 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp8  |                        6 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp9  |                        8 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp10 |                       10 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp11 |                       12 | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp12 | N-Punch                  | API_ShLvOfApp | API_ShLvOfAppR1 | Saved Successfully |
      | API_ShLvOfApp14 |                        2 | API_ShLvOfApp | API_ShLvOfAppR3 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID          |
      | API_ShLvOfApp6  |
      | API_ShLvOfApp7  |
      | API_ShLvOfApp8  |
      | API_ShLvOfApp9  |
      | API_ShLvOfApp10 |
      | API_ShLvOfApp11 |
      | API_ShLvOfApp12 |
      | API_ShLvOfApp14 |
    When Execute scenario start from "scenario 23" to "scenario 269" in API sheet named "short-leave-entry".
    Then Verify API sheet named "short-leave-entry" and scenario start from "scenario 23" to "scenario 269" result "Pass".

  #*********************************************************************************
  # 54 attendance-authorization
  #*********************************************************************************
  @API_54AtdAuth1
  Scenario: 54-attendance-authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | API_AtdAuth1  |
      | API_AtdAuth2  |
      | API_AtdAuth3  |
      | API_AtdAuth4  |
      | API_AtdAuthR1 |
      | API_AtdAuthR2 |
      | API_AtdAuthR3 |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login |
      | API_AtdAuthR1 | API_AtdAuthR1 |               1 |         1 |
      | API_AtdAuthR2 | API_AtdAuthR2 |               1 |         1 |
      | API_AtdAuthR3 | API_AtdAuthR3 |               1 |         1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName    | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | API_AtdAuthR2 | All Sequential    | true       | true       | False      | False      | False      |                | Saved Successfully |
      | API_AtdAuthR3 | All               | true       | true       | False      | False      | False      | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName    | RIC1          | RIC2          | RIC3 | RIC4 | RIC5 | Validation         |
      | API_AtdAuthR1    |               | API_AtdAuthR1 |               |      |      |      | Saved Successfully |
      | API_AtdAuthR2    | API_AtdAuthR2 | API_AtdAuthR2 | API_AtdAuthR3 |      |      |      | Saved Successfully |
      | API_AtdAuthR3    | API_AtdAuthR3 | API_AtdAuthR2 | API_AtdAuthR3 |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DailyAtdAuthReq | validation         |
      | API_AtdAuth1 |                2 | True            | Saved Successfully |
    And Create user from user configuration
      | userid       | MaxPunchesToBeConsidered | AtdEnable | AttendancePlc | ReportingGroup | ESSEnable | Validation         |
      | API_AtdAuth1 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR1  | True      | Saved Successfully |
      | API_AtdAuth2 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR2  | True      | Saved Successfully |
      | API_AtdAuth3 |                        4 | True      | API_AtdAuth1  | API_AtdAuthR3  | True      | Saved Successfully |
      | API_AtdAuth4 |                        4 | True      | API_AtdAuth1  |                | True      | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | API_AtdAuth1  |                          1 | admin        |    1 |
      | API_AtdAuth2  |                          1 | admin        |    1 |
      | API_AtdAuth3  |                          1 | admin        |    1 |
      | API_AtdAuthR1 |                          1 | admin        |    1 |
      | API_AtdAuthR2 |                          1 | admin        |    1 |
      | API_AtdAuthR3 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Monthly Attendance Process via API for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Run Monthly Attendance Process via API for Month = "-1" and Year = "0"
      | UserID       |
      | API_AtdAuth1 |
      | API_AtdAuth2 |
      | API_AtdAuth3 |
      | API_AtdAuth4 |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | API_AtdAuth4 |          0 |     090000 |
      | API_AtdAuth4 |          0 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "0" and Year = "0"
      | UserID       |
      | API_AtdAuth4 |
    When Execute scenario start from "scenario 1" to "scenario 36" in API sheet named "attendance-authorization".
    Then Verify API sheet named "attendance-authorization" and scenario start from "scenario 1" to "scenario 36" result "Pass".

  #*********************************************************************************
  # 55 ot-coff-authorization
  #*********************************************************************************
  @API_55OtCoffAuth1
  Scenario: 55-ot-coff-authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_OtCoAuth1  |
      | API_OtCoAuth2  |
      | API_OtCoAuth3  |
      | API_OtCoAuth4  |
      | API_OtCoAuth5  |
      | API_OtCoAuth6  |
      | API_OtCoAuth7  |
      | API_OtCoAuth8  |
      | API_OtCoAuthR1 |
      | API_OtCoAuthR2 |
      | API_OtCoAuthR3 |
    And Delete Overtime Policy from TnA module
      | Name          |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login |
      | API_OtCoAuthR1 | API_OtCoAuthR1 |               1 |         1 |
      | API_OtCoAuthR2 | API_OtCoAuthR2 |               1 |         1 |
      | API_OtCoAuthR3 | API_OtCoAuthR3 |               1 |         1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName     | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | API_OtCoAuthR2 | All Sequential    | true       | true       | False      | False      | False      |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1           | RIC2           | RIC3 | RIC4 | RIC5 | Validation         |
      | API_OtCoAuthR1   |                | API_OtCoAuthR1 |                |      |      |      | Saved Successfully |
      | API_OtCoAuthR2   | API_OtCoAuthR2 | API_OtCoAuthR2 | API_OtCoAuthR3 |      |      |      | Saved Successfully |
    And Create NetWork Hours Policy "API_OtCoAuth1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | API_OtCoAuth1 | API_OtCoAuth1  | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
      | API_OtCoAuth2 | API_OtCoAuth1  | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
      | API_OtCoAuth3 | API_OtCoAuth1  | True              | True               | True      |         | true           |            |                 | All         | Monthly        | true                 | False               | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "API_OtCoAuth1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN                |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Work Hours Within Shift |      0000 |    1000 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    1000 |      0000 | OT3        |   1.00 | Check All      |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "API_OtCoAuth2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT4        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT5        |   1.00 | Check All      |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "API_OtCoAuth3"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00000 |        99900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid        | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc   | ReportingGroup | ESSEnable | Validation         |
      | API_OtCoAuth1 |                        4 | False     |                   |               | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth2 |                        4 | True      | None              | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth3 |                        4 | True      | Only Overtime     | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth4 |                        4 | True      | Only C-OFF        | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth5 |                        4 | True      | Both              | API_OtCoAuth1 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth6 |                        4 | True      | Both              | API_OtCoAuth1 | API_OtCoAuthR2 | True      | Saved Successfully |
      | API_OtCoAuth7 |                        4 | True      | Both              | API_OtCoAuth2 | API_OtCoAuthR1 | True      | Saved Successfully |
      | API_OtCoAuth8 |                        4 | True      | Both              | API_OtCoAuth3 | API_OtCoAuthR1 | True      | Saved Successfully |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_OtCoAuthR1 |                          1 | admin        |    1 |
      | API_OtCoAuthR2 |                          1 | admin        |    1 |
      | API_OtCoAuthR3 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
      | API_OtCoAuth4 |
      | API_OtCoAuth5 |
      | API_OtCoAuth6 |
      | API_OtCoAuth7 |
      | API_OtCoAuth8 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID        |
      | API_OtCoAuth1 |
      | API_OtCoAuth2 |
      | API_OtCoAuth3 |
      | API_OtCoAuth4 |
      | API_OtCoAuth5 |
      | API_OtCoAuth6 |
      | API_OtCoAuth7 |
      | API_OtCoAuth8 |
    When Execute scenario start from "scenario 1" to "scenario 117" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "scenario 1" to "scenario 117" result "Pass".

  #*********************************************************************************
  # 65 monthly-process
  #*********************************************************************************
  @API_65monthly-process1
  Scenario: 65-monthly-process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_MP1 |
      | API_MP2 |
      | API_MP3 |
      | API_MP4 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | Organization_code |
      | API_MP1 | API_MP1 |               1 |         1 |               1 |                  1 |                   |
      | API_MP2 | API_MP2 |               1 |         1 |               1 |                  1 |                   |
      | API_MP3 | API_MP3 |               1 |         1 |               1 |                  1 |                   |
      | API_MP4 | API_MP4 |               1 |         1 |               1 |                  1 |                   |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | API_MP1 |
      | API_MP2 |
      | API_MP3 |
      | API_MP4 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "0" and Year = "0"
      | UserID  |
      | API_MP3 |
      | API_MP4 |
    When Execute scenario start from "scenario 1" to "scenario 23" in API sheet named "monthly-process".
    Then Verify API sheet named "monthly-process" and scenario start from "scenario 1" to "scenario 23" result "Pass".

  #*********************************************************************************
  # 111 overtime-application & 112 overtime-approval
  #*********************************************************************************
  @112OTAppAuth1
  Scenario: Overtime Application and Approval - Get, Set, Update, Delete
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
      | APIOTRIC1      |
      | APIOTRIC2      |
    And Delete "BH" shift schedule
    And Delete "BH" shift
    And Delete Overtime Policy from TnA module
      | Name      |
      | APIOTPlc1 |
      | APIOTPlc2 |
      | APIOTPlc3 |
      | APIOTPlc4 |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT                     | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | APIOTPlc1 | OverTime Policy-1 | True      | ALL                         | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc2 | OverTime Policy-1 | false     |                             |            |                 |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc3 | OverTime Policy-1 | true      | ALL                         | Daily 1    | true            |                       |            |              |               |                  |               | Saved Successfully |
      | APIOTPlc4 | OverTime Policy-1 | true      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | APIAtdPlc1 |                4 | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | BH      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | BI      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | BL      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "BH" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BH      |               7 |
    And Create Shift Schedule "BI" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BI      |               1 |
      | BL      |               1 |
    And Configure Off Day Configuration in Shift Schedule "BH"
      | OffDay1 |
      | None    |
    And Configure Off Day Configuration in Shift Schedule "BI"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOTRIC1 | APIOTRIC1 |               1 |         1 |               1 |                  1 |
      | APIOTRIC2 | APIOTRIC2 |               1 |         1 |               1 |                  1 |
      | APIOTRIC3 | APIOTRIC3 |               1 |         1 |               1 |                  1 |
      | APIOTRIC4 | APIOTRIC4 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName      | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOTAllAprPlc1 | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName      | RIC1      | RIC2      | RIC3 | RIC4 | RIC5 | Validation         |
      | APIOTRGrp1       | AnyOne          | APIOTRIC1 |           |      |      |      | Saved Successfully |
      | APIOTRGrp2       | AnyOne          | APIOTRIC2 |           |      |      |      | Saved Successfully |
      | APIOTRGrp3       | APIOTAllAprPlc1 | APIOTRIC3 | APIOTRIC4 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid         | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ShiftSchedule | StartShift | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_OTAppAppr1 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr2 | True   | APIOTRGrp2     | false     |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr3 | True   | APIOTRGrp1     | True      |                        4 | Only C-OFF        | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr4 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc2   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr5 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc3   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr6 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc4   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr7 | True   | APIOTRGrp1     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BI            | BI         | True      | True      | True               | Saved Successfully |
      | API_OTAppAppr8 | True   | APIOTRGrp3     | True      |                        4 | Only Overtime     | APIAtdPlc1    |             | APIOTPlc1   |           |             |         | True      | BH            | BH         | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID         |
      | API_OTAppAppr1 |
      | API_OTAppAppr2 |
      | API_OTAppAppr3 |
      | API_OTAppAppr4 |
      | API_OTAppAppr5 |
      | API_OTAppAppr6 |
      | API_OTAppAppr7 |
      | API_OTAppAppr8 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | API_OTAppAppr1 |                          1 | admin        |    1 |
      | API_OTAppAppr2 |                          1 | admin        |    1 |
      | API_OTAppAppr3 |                          1 | admin        |    1 |
      | API_OTAppAppr4 |                          1 | admin        |    1 |
      | API_OTAppAppr5 |                          1 | admin        |    1 |
      | API_OTAppAppr6 |                          1 | admin        |    1 |
      | API_OTAppAppr7 |                          1 | admin        |    1 |
      | API_OTAppAppr8 |                          1 | admin        |    1 |
      | APIOTRIC1      |                          1 | admin        |    1 |
      | APIOTRIC2      |                          1 | admin        |    1 |
      | APIOTRIC3      |                          1 | admin        |    1 |
      | APIOTRIC4      |                          1 | admin        |    1 |
    And Change Shift via API
      | userid         | FromDt | ToDt | shift-id | week-off | public-holiday |
      | API_OTAppAppr6 |      1 |    1 |          |          |              1 |
      | API_OTAppAppr6 |      2 |    2 |          |        1 |                |
    When Execute scenario start from "scenario 1" to "scenario 96" in API sheet named "overtime-application".
    Then Verify API sheet named "overtime-application" and scenario start from "scenario 1" to "scenario 96" result "Pass".

  #*********************************************************************************
  # 106 event-authorization
  #*********************************************************************************
  @106APIEventAuth1
  Scenario: Event Authorization - get, set
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | APIEAUr1  |
      | APIEAUr2  |
      | APIEAUr3  |
      | APIEAUr4  |
      | APIEARic1 |
      | APIEARic2 |
      | APIEARic3 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | HK      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "HK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | HK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "HK"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | APIEAAtdPlc1 |                4 | true         | false                             | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIEARic1 | APIEARic1 |               1 |         1 |               1 |                  1 |
      | APIEARic2 | APIEARic2 |               1 |         1 |               1 |                  1 |
      | APIEARic3 | APIEARic3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName    | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIAllAprPlc1 | All               | true       | true       |            |            |            | In-Charge 2    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName    | RIC1      | RIC2      | RIC3 | RIC4 | RIC5 | Validation         |
      | APIEA_RGrp1      | AnyOne        | APIEARic1 |           |      |      |      | Saved Successfully |
      | APIEA_RGrp2      | APIAllAprPlc1 | APIEARic2 | APIEARic3 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | APIEAUr1 | True   | APIEA_RGrp1    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr2 | True   |                | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr3 | True   | APIEA_RGrp2    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | APIEAUr4 | True   | APIEA_RGrp1    | true      | APIEAAtdPlc1  |             | HK            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | APIEAUr1 |
      | APIEAUr2 |
      | APIEAUr3 |
      | APIEAUr4 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | APIEAUr1  |                          1 | admin        |    1 |
      | APIEAUr2  |                          1 | admin        |    1 |
      | APIEAUr3  |                          1 | admin        |    1 |
      | APIEAUr4  |                          1 | admin        |    1 |
      | APIEARic1 |                          1 | admin        |    1 |
      | APIEARic2 |                          1 | admin        |    1 |
      | APIEARic3 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid   | event-date | event-time | In-out |
      | APIEAUr1 |         -1 |     090000 |      0 |
      | APIEAUr1 |         -2 |     090000 |      0 |
      | APIEAUr3 |         -1 |     090000 |      0 |
      | APIEAUr4 |         -1 |     090000 |      0 |
    When Execute scenario start from "Scenario 1" to "Scenario 33" in API sheet named "event-authorization".
    Then Verify API sheet named "event-authorization" and scenario start from "Scenario 1" to "Scenario 33" result "Pass".

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
