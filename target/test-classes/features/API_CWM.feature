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
