@tag
Feature: 55-ot-coff-authorization - 5 Level RIC
  I want to use this template for my feature file

  @API_OtCoffAuth_AnyOne_1
  Scenario: API_OtCoffAuth_AnyOne Auth Mode behaviour of Any One Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 118" to "scenario 476" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 118" to "Scenario 476" result "Pass".

  @API_OtCoffAuth_AnyOne_2
  Scenario: API_OtCoffAuth_AnyOne RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 477" to "scenario 571" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 477" to "Scenario 571" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 572" to "scenario 642" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 572" to "Scenario 642" result "Pass".

  @API_OtCoffAuth_AnyOne_3
  Scenario: API_OtCoffAuth_AnyOne RIC selection changed in Approval Policy page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 643" to "scenario 738" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 643" to "Scenario 738" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 739" to "scenario 761" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 739" to "Scenario 761" result "Pass".

  @API_OtCoffAuth_AnyOne_4
  Scenario: API_OtCoffAuth_AnyOne Authorization Mode gets changed from Any One to All in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 762" to "scenario 878" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 762" to "Scenario 878" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 3    | Saved Successfully |
    When Execute scenario start from "scenario 879" to "scenario 901" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 879" to "Scenario 901" result "Pass".

  @API_OtCoffAuth_AnyOne_5
  Scenario: API_OtCoffAuth_AnyOne Authorization Mode gets changed from Any One to All Sequencial in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 902" to "scenario 1018" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 902" to "Scenario 1018" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    When Execute scenario start from "scenario 1019" to "scenario 1045" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1019" to "Scenario 1045" result "Pass".

  @API_OtCoffAuth_AnyOne_6
  Scenario: API_OtCoffAuth Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       |               |               |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1046" to "scenario 1116" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1046" to "Scenario 1116" result "Pass".

  @API_OtCoffAuth_AnyOne_7
  Scenario: API_OtCoffAuth Authorization Mode All Sequencial in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       |            |            |                | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1117" to "scenario 1143" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1117" to "Scenario 1143" result "Pass".

  @API_OtCoffAuth_AnyOne_8
  Scenario: API_OtCoffAuth Authorization Mode All in Approval Policy page Reporting Group RIC < Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       |               |               |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1144" to "scenario 1214" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1144" to "Scenario 1214" result "Pass".

  @API_OtCoffAuth_AnyOne_9
  Scenario: API_OtCoffAuth Authorization Mode All in Approval Policy page Reporting Group RIC > Approval RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       |            |            | In-Charge 3    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1215" to "scenario 1285" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1215" to "Scenario 1285" result "Pass".

  @API_OtCoffAuth_All_10
  Scenario: API_OtCoffAuth_All Auth Mode behaviour of All Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1286" to "scenario 1644" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1286" to "Scenario 1644" result "Pass".

  @API_OtCoffAuth_All_11
  Scenario: API_OtCoffAuth_All RIC selection changed in Approval Policy page, status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1645" to "scenario 1739" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1645" to "Scenario 1739" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 1740" to "scenario 1810" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1740" to "Scenario 1810" result "Pass".

  @API_OtCoffAuth_All_12
  Scenario: API_OtCoffAuth_All RIC selection changed in Approval Policy page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | false      | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1811" to "scenario 1906" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1811" to "Scenario 1906" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | false      | true       | true       | true       | false      | In-Charge 4    | Saved Successfully |
    When Execute scenario start from "scenario 1907" to "scenario 1998" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1907" to "Scenario 1998" result "Pass".

  @API_OtCoffAuth_All_13
  Scenario: API_OtCoffAuth_All Authorization Mode gets changed from All to All Sequencial in Approval Policy page, Leave Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 1    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 1999" to "scenario 2115" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 1999" to "Scenario 2115" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    When Execute scenario start from "scenario 2116" to "scenario 2142" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 2116" to "Scenario 2142" result "Pass".

  @API_OtCoffAuth_All_14
  Scenario: API_OtCoffAuth_All Auth Mode behaviour of All Approval Policy with 5 RIC- Verify  in all rics
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 2143" to "scenario 2839" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 2143" to "Scenario 2839" result "Pass".

  @API_OtCoffAuth_AllSequential_15
  Scenario: API_OtCoffAuth_AllSequential Auth Mode behaviour of All Approval Policy with 5 RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 2840" to "scenario 3316" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 2840" to "Scenario 3316" result "Pass".

  @API_OtCoffAuth_AllSequential_16
  Scenario: API_OtCoffAuth_AllSequential RIC selection changed in Approval Policy page, status= Pending 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3317" to "scenario 3345" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3317" to "Scenario 3345" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 3346" to "scenario 3372" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3346" to "Scenario 3372" result "Pass".

  @API_OtCoffAuth_AllSequential_17
  Scenario: API_OtCoffAuth_AllSequential RIC selection changed in Approval Policy page, status= Pending 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3373" to "scenario 3402" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3373" to "Scenario 3402" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 3403" to "scenario 3429" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3403" to "Scenario 3429" result "Pass".

  @API_OtCoffAuth_AllSequential_18
  Scenario: API_OtCoffAuth_AllSequential RIC selection changed in Approval Policy page, status= Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | false      | true       | true       | true       | Saved Successfully |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3430" to "scenario 3462" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3430" to "Scenario 3462" result "Pass".
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | false      | true       | true       | true       | false      | Saved Successfully |
    When Execute scenario start from "scenario 3463" to "scenario 3555" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3463" to "Scenario 3555" result "Pass".

  @API_OtCoffAuth_AllSequential_19
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Overtime/Coff   | NA               | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3556" to "scenario 3628" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3556" to "Scenario 3628" result "Pass".

  @API_OtCoffAuth_AllSequential_20
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3629" to "scenario 3701" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3629" to "Scenario 3701" result "Pass".

  @API_OtCoffAuth_AllSequential_21
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | Any One           | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3702" to "scenario 3730" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3702" to "Scenario 3730" result "Pass".

  @API_OtCoffAuth_AllSequential_22
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3731" to "scenario 3803" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3731" to "Scenario 3803" result "Pass".

  @API_OtCoffAuth_AllSequential_23
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 5
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Overtime/Coff   | NA               | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3804" to "scenario 3876" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3804" to "Scenario 3876" result "Pass".

  @API_OtCoffAuth_AllSequential_24
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 6
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | APIOC1     | All               | true       | true       | true       | true       | true       | In-Charge 5    | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3877" to "scenario 3905" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3877" to "Scenario 3905" result "Pass".

  @API_OtCoffAuth_AllSequential_25
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 7
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | Any One           | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3906" to "scenario 3978" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3906" to "Scenario 3978" result "Pass".

  @API_OtCoffAuth_AllSequential_26
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 8
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  | FinalIn-Charge |
      | Overtime/Coff   | NA               | All               | In-Charge 1,In-Charge 2,In-Charge 3 | In-Charge 2    |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 3979" to "scenario 4051" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 3979" to "Scenario 4051" result "Pass".

  @API_OtCoffAuth_AllSequential_27
  Scenario: API_OtCoffAuth_AllSequential All policy Exception Case 9
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIOC1  |
      | APIOCR1 |
      | APIOCR2 |
      | APIOCR3 |
      | APIOCR4 |
      | APIOCR5 |
    And Delete Reporting Group via API
      | GroupName |
      | APIOC1    |
    And Delete Approval policy from user module
      | Name   |
      | APIOC1 |
    And Delete Overtime Policy from TnA module
      | Name   |
      | APIOC1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | APIOC1     | All Sequential    | true       | true       | true       | true       | true       | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "APIOC1"
      | ApplicationType | CustomizeBasedOn | AuthorizationMode | ReportingIn-Charge                  |
      | Overtime/Coff   | NA               | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3 |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIOCR1 | APIOCR1 |               1 |         1 |               1 |                  1 |
      | APIOCR2 | APIOCR2 |               1 |         1 |               1 |                  1 |
      | APIOCR3 | APIOCR3 |               1 |         1 |               1 |                  1 |
      | APIOCR4 | APIOCR4 |               1 |         1 |               1 |                  1 |
      | APIOCR5 | APIOCR5 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group via API
      | rg_name | approval-policy-name | rg_incharge_1 | rg_incharge_2 | rg_incharge_3 | rg_incharge_4 | rg_incharge_5 |
      | APIOC1  | APIOC1               | APIOCR1       | APIOCR2       | APIOCR3       | APIOCR4       | APIOCR5       |
    And Create NetWork Hours Policy "APIOC1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOT | WklyMthlyOTCal | ConsWorkDoneonWOPHPL | WklyMthlyAutoAuthOT | validation         |
      | APIOC1  | APIOC1         | True              | True               | True      | All     | true           | Daily 1    | False           |             |                |                      |                     | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "APIOC1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    1000 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | MaxPunchesToBeConsidered | AtdEnable | OtCoffEligibility | OvertimePlc | ReportingGroup | ApprovalPolicy | ESSEnable | Validation         |
      | APIOC1 |                        2 | True      | Both              | APIOC1      | APIOC1         | APIOC1         | True      | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIOC1  |                          1 | admin        |    1 |
      | APIOCR1 |                          1 | admin        |    1 |
      | APIOCR2 |                          1 | admin        |    1 |
      | APIOCR3 |                          1 | admin        |    1 |
      | APIOCR4 |                          1 | admin        |    1 |
      | APIOCR5 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    And Run Monthly Attendance Process via API for Month = "January" and Year = "2024"
      | UserID |
      | APIOC1 |
    When Execute scenario start from "scenario 4052" to "scenario 4080" in API sheet named "ot-coff-authorization".
    Then Verify API sheet named "ot-coff-authorization" and scenario start from "Scenario 4052" to "Scenario 4080" result "Pass".
