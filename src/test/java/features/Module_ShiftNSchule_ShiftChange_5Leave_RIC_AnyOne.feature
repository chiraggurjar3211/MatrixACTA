@ShiftAndSchedules
Feature: 5 Level RIC - Any One Approval Policy - Shift Change Application and Approval
  I want to use this template for my feature file

  @SC_RICAnyOneCase1
  Scenario: Auth Mode behaviour of Any One Approval Policy with 5 RIC - Application approved by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase2
  Scenario: Behaviour of Any One Approval Policy with 5 RIC - Application Rejected by any one RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Rejected |

  @SC_RICAnyOneCase5
  Scenario: RIC selection changed in Approval Policy page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase6
  Scenario: RIC selection changed in Approval Policy page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase7
  Scenario: RIC selection changed in Approval Policy page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase8
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase9
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase10
  Scenario: Authorization Mode gets changed from Any One to All in Approval Policy, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase11
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web

  @SC_RICAnyOneCase12
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase13
  Scenario: Authorization Mode gets changed from Any One to All Sequential in Approval Policy, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase14
  Scenario: Any RIC gets removed from Reporting Group Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1 | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    |               | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase15
  Scenario: Any RIC gets removed from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2 | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 |               | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase16
  Scenario: Any RIC gets removed from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2 | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 |               | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase17
  Scenario: RIC (Which approved application) gets removed from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1 | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    |               | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase18
  Scenario: RIC (Which rejected application) gets removed from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4 | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 |               | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase19
  Scenario: Any RIC gets changed from Reporting Group, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_CIR1 | SC_AnyOne_CIR1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_CIR1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_CIR1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_CIR1 - SC_AnyOne_CIR1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_CIR1 | admin    | Welcome SC_AnyOne_CIR1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase20
  Scenario: Any RIC gets changed from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_CIR1 | SC_AnyOne_CIR1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_CIR1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_CIR1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_CIR1 | admin    | Welcome SC_AnyOne_CIR1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase21
  Scenario: Any RIC gets changed from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_CIR1 | SC_AnyOne_CIR1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_CIR1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_CIR1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_CIR1 | admin    | Welcome SC_AnyOne_CIR1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase22
  Scenario: Any RIC gets added from Reporting Group Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_CIR1 | SC_AnyOne_CIR1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1 | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    |               | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_CIR1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase23
  Scenario: Any RIC gets added from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_CIR1 | SC_AnyOne_CIR1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1 | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    |               | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase24
  Scenario: Any RIC gets changed from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1 | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    |               | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase25
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase26
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase27
  Scenario: Approval Policy gets changed from Any One to All in Reporting Group, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase28
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web

  @SC_RICAnyOneCase29
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase30
  Scenario: Approval Policy gets changed from Any One to All Sequential in Reporting Group, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase31
  Scenario: Approval Policy gets removed from Reporting Group Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase32
  Scenario: Approval Policy gets removed from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase33
  Scenario: Approval Policy gets removed from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase34
  Scenario: Approval Policy gets added from Reporting Group Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase35
  Scenario: Approval Policy gets added from Reporting Group Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase36
  Scenario: Approval Policy gets added from Reporting Group Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase37
  Scenario: Approval Policy gets added in User Configuration page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase38
  Scenario: Approval Policy gets added in User Configuration page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Approved |

  @SC_RICAnyOneCase39
  Scenario: Approval Policy gets added in User Configuration page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase40
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase41
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | No Authorization |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Approved         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | No Authorization |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Approved         |

  @SC_RICAnyOneCase42
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | No Authorization |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Rejected         |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | No Authorization |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Rejected         |

  @SC_RICAnyOneCase43
  Scenario: Approval Policy gets added in User Configuration page, Reporting Group Approval Policy= All Sequential, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy    | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase44
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase45
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy   | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AllAprvalPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Approved |

  @SC_RICAnyOneCase46
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy   | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AllAprvalPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Rejected |

  @SC_RICAnyOneCase47
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |

  @SC_RICAnyOneCase48
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase49
  Scenario: Approval Policy gets removed in User Configuration page, Reporting Group Approval Policy= All Sequential, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase50
  Scenario: Approval Policy gets changed from Any One to All in User Configuration, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase51
  Scenario: Approval Policy gets changed from Any One to All in User Configuration, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase52
  Scenario: Approval Policy gets changed from Any One to All in User Configuration, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy   | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase53
  Scenario: Approval Policy gets changed from Any One to All in User Configuration, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy      | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllSeqAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |

  @SC_RICAnyOneCase54
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy      | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllSeqAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase55
  Scenario: Approval Policy gets changed from Any One to All Sequential in User Configuration, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | PolicyName | RIC1           | RIC2           | RIC3           | RIC4           | RIC5           | Validation         |
      | SCAnyOneRGrp1    |          |            | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy    | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  | SC_AnyOneApprPlc1 | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy      | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  | SC_AllSeqAprvalPlc1 |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    Then Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    And Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase56
  Scenario: Reporting Group gets added in User Configuration page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   |                |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase57
  Scenario: Reporting Group gets added in User Configuration page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   |                |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Shift change approval via API
      | userid        | date-range | approved | remark        | ricID |
      | SC_AnyOne_Ur1 |          0 |        1 | approvedShift | sa    |
    Then Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    Then Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @SC_RICAnyOneCase58
  Scenario: Reporting Group gets added in User Configuration page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   |                |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Shift change approval via API
      | userid        | date-range | approved | remark        | ricID |
      | SC_AnyOne_Ur1 |          0 |        2 | rejectedShift | sa    |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp1  |                |            |              | Saved Successfully |
    Then Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |

  @SC_RICAnyOneCase60
  Scenario: Reporting Group gets removed in User Configuration page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 |                |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase61
  Scenario: Reporting Group gets removed in User Configuration page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 |                |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase62
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase63
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase64
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllAprvalPlc1  | All               | true       | true       | true       | true       | true       | In-Charge 4    | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllAprvalPlc1     | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase65
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All Sequential, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |

  @SC_RICAnyOneCase66
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All Sequential, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase67
  Scenario: Reporting Group gets changed in User Configuration, Reporting Groups Approval Policy- 1st= Any One and 2nd= All Sequential, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Assign groups to user from user configuration
      | UserID        | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SC_AnyOne_Ur1 | SCAnyOneRGrp2  |                |            |              | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase68
  Scenario: Any RIC gets deleted from User Configuration Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ric1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase69
  Scenario: Any RIC gets deleted from User Configuration Page, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ric1 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase70
  Scenario: Any RIC gets deleted from User Configuration Page, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ric1 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase71
  Scenario: RIC (Which Approved Application) gets deleted from User Configuration, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ric4 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge       | Status   |
      | SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase72
  Scenario: RIC (Which Rejected Application) gets deleted from User Configuration, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ric4 |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge       | Status   |
      | SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase73
  Scenario: Any RIC gets deactivate from User Configuration Page, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid         | Active | Validation         |
      | SC_AnyOne_Ric1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase74
  Scenario: RIC (Which approved application) gets deactivate from User Configuration, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid         | Active | Validation         |
      | SC_AnyOne_Ric4 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase75
  Scenario: RIC (Which Rejected Application) gets deactivate from User Configuration, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid         | Active | Validation         |
      | SC_AnyOne_Ric4 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase76
  Scenario: Any RIC gets deactivate from User Configuration, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid         | Active | Validation         |
      | SC_AnyOne_Ric1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Approved |

  @SC_RICAnyOneCase77
  Scenario: Any RIC gets deactivate from User Configuration, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName          | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1   | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
      | SC_AllSeqAprvalPlc1 | All Sequential    | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
      | SCAnyOneRGrp2 | SC_AllSeqAprvalPlc1  | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Create user from user configuration
      | userid         | Active | Validation         |
      | SC_AnyOne_Ric1 | false  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 | Rejected |

  @SC_RICAnyOneCase78
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2 | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 |               | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase79
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2 | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 |               | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase80
  Scenario: General Rules - Match, Reporting Group Page Configuration = RIC 1 & RIC 3 and Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2 | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 |               | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    Then Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    And Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Rejected |

  @SC_RICAnyOneCase81
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Then application flow will be based on Approval Policy selected, Application status= Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |

  @SC_RICAnyOneCase82
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3 Application status= Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      |                | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       | true    |        | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Approved  | SC_AnyOne_Ur1 |      0 |    0 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Approved |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Approved |

  @SC_RICAnyOneCase83
  Scenario: General Rules - Mismatch, Reporting Group Page Configuration = RIC 1, RIC 2 & RIC 3, Approval Policy Page Configuration = In-Charge 1 & In-Charge 3, Application status= Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | false      | true       | false      | false      | Saved Successfully |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4 | rg_incharge_5 |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 |               |               |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    When Approve Reject "Shift Change Approval" Application from RIC Date from= "-1" To= "1"
      | UserID        | FromDate | ToDate | NewShift | Approve | Reject | Validation         |
      | SC_AnyOne_Ur1 |        0 |      0 | BS       |         | true   | Saved Successfully |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "0"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status   |
      | Rejected  | SC_AnyOne_Ur1 |      0 |    0 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status   |
      |        0 |      0 | Rejected |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                        | Status   |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1 | Rejected |

  @SC_RICAnyOneCase84
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All Sequential, Customize Based On= NA, Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_CIR1 |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "SC_AnyOneApprPlc1"
      | ApplicationType          | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Shift Change Application |             |                  |           |         | All Sequential    | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 |                |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status           |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending          |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | No Authorization |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | No Authorization |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4             | No Authorization |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5 - Final RIC | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status           |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | No Authorization |

  @SC_RICAnyOneCase85
  Scenario: General Rules - Match with Exception Examples, Authorization Mode in Exception= All, Customize Based On= NA, Application Date = 0 to 0
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | SC_AnyOne_Ur1  |
      | SC_AnyOne_Ric1 |
      | SC_AnyOne_Ric2 |
      | SC_AnyOne_Ric3 |
      | SC_AnyOne_Ric4 |
      | SC_AnyOne_Ric5 |
    And Delete "BR" shift schedule
    And Delete "BR" shift
    And Delete "BS" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | BR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
      | BS      | 07:00     | 16:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "BR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BR"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SC_AnyOne_Ric1 | SC_AnyOne_Ric1 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric2 | SC_AnyOne_Ric2 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric3 | SC_AnyOne_Ric3 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric4 | SC_AnyOne_Ric4 |               1 |         1 |               1 |                  1 |
      | SC_AnyOne_Ric5 | SC_AnyOne_Ric5 |               1 |         1 |               1 |                  1 |
    And Create Approval Policy from Approval Policy page
      | PolicyName        | AuthorizationMode | In-Charge1 | In-Charge2 | In-Charge3 | In-Charge4 | In-Charge5 | FinalIn-Charge | Validation         |
      | SC_AnyOneApprPlc1 | Any One           | true       | true       | true       | true       | true       |                | Saved Successfully |
    And Add Exceptions in Approval Policy for PolicyName= "SC_AnyOneApprPlc1"
      | ApplicationType          | LeaveIdName | CustomizeBasedOn | FromRange | ToRange | AuthorizationMode | ReportingIn-Charge                                           | FinalIn-Charge |
      | Shift Change Application |             |                  |           |         | All               | In-Charge 1,In-Charge 2,In-Charge 3, In-Charge 4,In-Charge 5 | In-Charge 4    |
    And Create Reporting Group via API
      | rg_name       | approval-policy-name | rg_incharge_1  | rg_incharge_2  | rg_incharge_3  | rg_incharge_4  | rg_incharge_5  |
      | SCAnyOneRGrp1 | SC_AnyOneApprPlc1    | SC_AnyOne_Ric1 | SC_AnyOne_Ric2 | SC_AnyOne_Ric3 | SC_AnyOne_Ric4 | SC_AnyOne_Ric5 |
    And Create user from user configuration
      | userid        | Active | ReportingGroup | ApprovalPolicy | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | SC_AnyOne_Ur1 | True   | SCAnyOneRGrp1  |                | True      |                        4 |                   |             | BR            | BR         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID        |
      | SC_AnyOne_Ur1 |
    And Set Password via API
      | Userid         | user-verified-for-password | new-password | type |
      | SC_AnyOne_Ur1  |                          1 | admin        |    1 |
      | SC_AnyOne_Ric1 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric2 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric3 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric4 |                          1 | admin        |    1 |
      | SC_AnyOne_Ric5 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | SC_AnyOne_Ur1 | admin    | Welcome SC_AnyOne_Ur1 |
    When Apply Shift Change Application from ESS
      | FromDate | ToDate | ShiftID | Validation                         |
      |        0 |      0 | BS      | Application Submitted Successfully |
    Then Verify Shift Change Application Status from ESS
      | FromDate | ToDate | Status  |
      |        0 |      0 | Pending |
    And Validate Shift Change Approval Details from ESS date From= "0" To= "0"
      | Incharge                                    | Status  |
      | SC_AnyOne_Ric1 - SC_AnyOne_Ric1             | Pending |
      | SC_AnyOne_Ric2 - SC_AnyOne_Ric2             | Pending |
      | SC_AnyOne_Ric3 - SC_AnyOne_Ric3             | Pending |
      | SC_AnyOne_Ric5 - SC_AnyOne_Ric5             | Pending |
      | SC_AnyOne_Ric4 - SC_AnyOne_Ric4 - Final RIC | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric1 | admin    | Welcome SC_AnyOne_Ric1 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric2 | admin    | Welcome SC_AnyOne_Ric2 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric3 | admin    | Welcome SC_AnyOne_Ric3 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric4 | admin    | Welcome SC_AnyOne_Ric4 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username       | password | Validation             |
      | SC_AnyOne_Ric5 | admin    | Welcome SC_AnyOne_Ric5 |
    And Validate "Shift Change Approval" Application from RIC date From= "0" To= "1"
      | PanelName | UserID        | FromDt | ToDt | Status  |
      | Pending   | SC_AnyOne_Ur1 |      0 |    0 | Pending |
