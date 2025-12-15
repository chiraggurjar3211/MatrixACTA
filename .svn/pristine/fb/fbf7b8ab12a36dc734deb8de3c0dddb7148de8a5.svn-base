@JPC
Feature: Job Processing and Costing Module API
  I want to use this template for my feature file

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
