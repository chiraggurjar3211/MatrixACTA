@JPC
Feature: Default

  @JPC1
  Scenario: Apply Time sheet correction from SA Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC01  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj01    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase01   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J1      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC01 | JPC01 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J1   | J1   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description   | Validation         |
      | Phase01 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj01" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCM01            | Phase01 |         0 |       0 |
    And Set Job Configuration in Phase "Phase01" of Project "JPCPrj01" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J1      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC01  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC01  |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC01  |          0 |     090000 |
      | JPC01  |          0 |     120000 |
    Then Apply Timesheet Correction Application from SA login
      | userid | attendance-date | job-code | Validation         |
      | JPC01  |               0 | J1       | Saved Successfully |

  @JPC3
  Scenario: Apply Time sheet correction Via ESS Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC3   |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj3    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase3    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J3      |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC3 | JPC3 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J3   | J3   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase3 | JPCAutomation | Saved Successfully |
    And Create Project "JPCProj3" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM3             | Phase3 |         0 |       0 |
    And Set Job Configuration in Phase "Phase3" of Project "JPCProj3" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J3      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC3   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC3   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC3   |          0 |     090000 |
      | JPC3   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC3   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC3     | admin    | Welcome JPC3 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J3       | TimesheetApplied | Saved Successfully |

  @JPC4
  Scenario: Reject Time sheet correction Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC4   |
      | RIC1   |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj4    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase4    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J4      |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC4 | JPC4 |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1 | RIC1 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC4   | RG1            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J4   | J4   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase4 | JPCAutomation | Saved Successfully |
    And Create Project "JPCProj4" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM4             | Phase4 |         0 |       0 |
    And Set Job Configuration in Phase "Phase4" of Project "JPCProj4" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J4      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC4   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC4   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC4   |          0 |     090000 |
      | JPC4   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC4   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC4     | admin    | Welcome JPC4 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | validation         |
      |               0 | 09:00     | J4       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    When Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC4     |              0 | Individual | Reject   | Saved Successfully |
    Then Verify In "Rejected" Tab in Timesheet Correction Application Page from RIC Login
      | UserName | AttendanceDate | FilterUser |
      | JPC4     |              0 | Individual |

  @JPC5
  Scenario: Approve Time sheet correction Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC5   |
      | RIC1   |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj5    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase5    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J5      |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC5 | JPC5 |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1 | RIC1 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1 | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC5   | RG1            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J5   | J5   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase5 | JPCAutomation | Saved Successfully |
    And Create Project "JPCProj5" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM5             | Phase5 |         0 |       0 |
    And Set Job Configuration in Phase "Phase5" of Project "JPCProj5" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J5      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC5   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC5   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC5   |          0 |     090000 |
      | JPC5   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC5   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC5     | admin    | Welcome JPC5 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J5       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    When Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC5     |              0 | Individual | Approve  | Saved Successfully |
    Then Verify In "Approved" Tab in Timesheet Correction Application Page from RIC Login
      | UserName | AttendanceDate | FilterUser |
      | JPC5     |              0 | Individual |

  @JPC6
  Scenario: Award Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC6   |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj6     |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase6    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J6      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC6  | JPC6  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC6   | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J6   | J6   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase6 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj6" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM6             | Phase6 |         0 |       0 |
    And Set Job Configuration in Phase "Phase6" of Project "JPCPrj6" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J6      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC6   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC6   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC6   |          0 |     090000 |
      | JPC6   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC6   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC6     | admin    | Welcome JPC6 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J6       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC6     |              0 | Individual | Approve  | Saved Successfully |
    Then Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | JPC6   |    0 | Award          |  0030 | AwardGranted | GreatWork | Saved Successfully |

  @JPC7
  Scenario: Penalty Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC7   |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj7     |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase7    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J7      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC7  | JPC7  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC7   | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J7   | J7   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase7 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj7" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM7             | Phase7 |         0 |       0 |
    And Set Job Configuration in Phase "Phase7" of Project "JPCPrj7" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J7      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC7   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC7   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC7   |          0 |     090000 |
      | JPC7   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC7   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC7     | admin    | Welcome JPC7 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J7       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC7     |              0 | Individual | Approve  | Saved Successfully |
    Then Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark        | Reason | Validation         |
      | JPC7   |    0 | Penalty        |  0030 | Penalty Apply | ABC    | Saved Successfully |

  @JPC8
  Scenario: Reject Award Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC8   |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj8     |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase8    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J8      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC8  | JPC8  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC8   | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J8   | J8   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase8 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj8" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM8             | Phase8 |         0 |       0 |
    And Set Job Configuration in Phase "Phase8" of Project "JPCPrj8" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J8      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC8   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC8   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC8   |          0 |     090000 |
      | JPC8   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC8   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC8     | admin    | Welcome JPC8 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J8       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC8     |              0 | Individual | Approve  | Saved Successfully |
    Then Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | JPC8   |    0 | Award          |  0030 | AwardGranted | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | RIC11    | admin    | Welcome RIC11 |
    When Authorize Award Penalty application from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | RIC1    | JPC8     |              0 | Individual | Reject   | Saved Successfully |
    Then Verify In "Rejected" Tab in Award Penalty Authorization Page from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser |
      | RIC1    | JPC8     |              0 | Individual |

  @JPC9
  Scenario: Approve Award Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC9   |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj9     |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase9    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J9      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC9  | JPC9  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC9   | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J9   | J9   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase9 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj9" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | JPCM9             | Phase9 |         0 |       0 |
    And Set Job Configuration in Phase "Phase9" of Project "JPCPrj9" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J9      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC9   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC9   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC9   |          0 |     090000 |
      | JPC9   |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC9   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | JPC9     | admin    | Welcome JPC9 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J9       | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC9     |              0 | Individual | Approve  | Saved Successfully |
    And Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | JPC9   |    0 | Award          |  0030 | AwardGranted | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | RIC11    | admin    | Welcome RIC11 |
    When Authorize Award Penalty application from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | RIC1    | JPC9     |              0 | Individual | Approve  | Saved Successfully |
    Then Verify In "Approved" Tab in Award Penalty Authorization Page from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser |
      | RIC1    | JPC9     |              0 | Individual |

  @JPC10
  Scenario: Reject Penalty Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC10  |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj10    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase10   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J10     |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC10 | JPC10 |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC10  | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J10  | J10  |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description   | Validation         |
      | Phase10 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj10" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCM10            | Phase10 |         0 |       0 |
    And Set Job Configuration in Phase "Phase10" of Project "JPCPrj10" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J10     |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC10  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC10  |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC10  |          0 |     090000 |
      | JPC10  |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC10  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | JPC10    | admin    | Welcome JPC10 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J10      | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC10    |              0 | Individual | Approve  | Saved Successfully |
    And Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark        | Reason | Validation         |
      | JPC10  |    0 | Penalty        |  0030 | Penalty Apply | ABC    | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | RIC11    | admin    | Welcome RIC11 |
    When Authorize Award Penalty application from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | RIC1    | JPC10    |              0 | Individual | Reject   | Saved Successfully |
    Then Verify In "Rejected" Tab in Award Penalty Authorization Page from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser |
      | RIC1    | JPC10    |              0 | Individual |

  @JPC11
  Scenario: Approve Penalty Application from RIC Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC11  |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj11    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase11   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J11     |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC11 | JPC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC11  | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J11  | J11  |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description   | Validation         |
      | Phase11 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj11" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCM11            | Phase11 |         0 |       0 |
    And Set Job Configuration in Phase "Phase11" of Project "JPCPrj11" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J11     |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC11  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC11  |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC11  |          0 |     090000 |
      | JPC11  |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | JPC11    | admin    | Welcome JPC11 |
    Then Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J11      | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC11    |              0 | Individual | Approve  | Saved Successfully |
    And Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark      | Reason    | Validation         |
      | JPC11  |    0 | Award          |  0030 | Award Apply | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | RIC11    | admin    | Welcome RIC11 |
    When Authorize Award Penalty application from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | RIC1    | JPC11    |              0 | Individual | Approve  | Saved Successfully |
    Then Verify In "Approved" Tab in Award Penalty Authorization Page from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser |
      | RIC1    | JPC11    |              0 | Individual |

  @JPC12
  Scenario: Export Data - Daily Timesheet
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC12  |
      | RIC1   |
      | RIC11  |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCPrj12    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase12   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J12     |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPC12 | JPC12 |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC1  | RIC1  |               1 |         1 |               1 |                  1 |               |                |                   1 |
      | RIC11 | RIC11 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1  | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | RG1              |        1 | RIC1  |      |      |      |      | Saved Successfully |
      | RG2              |        1 | RIC11 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | JPC12  | RG1            |                |            |              | Saved Successfully |
      | RIC1   | RG2            |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J12  | J12  |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description   | Validation         |
      | Phase12 | JPCAutomation | Saved Successfully |
    And Create Project "JPCPrj12" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCM12            | Phase12 |         0 |       0 |
    And Set Job Configuration in Phase "Phase12" of Project "JPCPrj12" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J12     |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | JPC12  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | JPC12  |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | JPC12  |          0 |     090000 |
      | JPC12  |          0 |     120000 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | JPC12  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | JPC12    | admin    | Welcome JPC12 |
    When Apply Timesheet Correction Application via ESS
      | attendance-date | StartTime | job-code | reason           | Validation         |
      |               0 | 09:00     | J12      | TimesheetApplied | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC1   |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation   |
      | RIC1     | admin    | Welcome RIC1 |
    Then Authorize time sheet corrrection application from RIC Login
      | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | JPC12    |              0 | Individual | Approve  | Saved Successfully |
    And Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark      | Reason    | Validation         |
      | JPC12  |    0 | Award          |  0030 | Award Apply | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | RIC11  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | RIC11    | admin    | Welcome RIC11 |
    When Authorize Award Penalty application from RIC Login
      | RicName | UserName | AttendanceDate | FilterUser | Approval | Validation         |
      | RIC1    | JPC12    |              0 | Individual | Approve  | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Export Daily Timesheet from JPC Module
      | Date | FileName     | SelectUser | UserId |
      |    0 | JPCTimesheet | User Wise  | JPC12  |

  ################################# V20R7 - CSR-3385 Starts ##############################
  #CSR_4011
  @CSR3385_1
  Scenario: Create and Update Job Via API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | APIJob1 |
    When Create Job via API
      | job-code | job-name | start-date | end-date | cost-centre-id |
      | APIJob1  | APIJob1  |          1 |       10 |              1 |
    Then Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | APIJob1 |         1 |      10 |
    When Create Job via API
      | job-code | job-name | start-date | end-date | cost-centre-id |
      | APIJob1  | APIJob1  |        -10 |       11 |              1 |
    Then Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | APIJob1 |       -10 |      11 |

  #CSR_4008
  @CSR3385_2
  Scenario Outline: Create and Update Job using Import Data from JPC Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | ImpJob1 |
      | ImpJob2 |
      | ImpJob3 |
    And Create Job via API
      | job-code | job-name | start-date | end-date | cost-centre-id |
      | ImpJob1  | ImpJob1  |          1 |       10 |              1 |
    And Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | ImpJob1 |         1 |      10 |
    When Import Data "Job"
      | Code    | Name    | Start Date | End Date | Cost Centre ID | Estimated Hours |
      | ImpJob1 | ImpJob1 |        -10 |       10 |              1 | 100:00          |
      | ImpJob2 | ImpJob2 |          1 |       20 |              1 | 55:00           |
      | ImpJob3 | ImpJob3 |        -10 |       -2 |              1 |                 |
    And Import "<File Format>" and check Imported Data for "Job"
      | Code    | Result  |
      | ImpJob1 | Success |
      | ImpJob2 | Success |
      | ImpJob3 | Success |
    Then Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | ImpJob1 |       -10 |      10 |
      | ImpJob2 |         1 |      20 |
      | ImpJob3 |       -10 |      -2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  #CSR_4010
  @CSR3385_3
  Scenario Outline: Create and Update Job using Import Data from Admin Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | ImpJob1 |
      | ImpJob2 |
      | ImpJob3 |
    And Create Job via API
      | job-code | job-name | start-date | end-date | cost-centre-id |
      | ImpJob1  | ImpJob1  |          1 |       10 |              1 |
    And Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | ImpJob1 |         1 |      10 |
    When Import Data "Job"
      | Code    | Name    | Start Date | End Date | Cost Centre ID | Estimated Hours |
      | ImpJob1 | ImpJob1 |        -10 |       10 |              1 | 100:00          |
      | ImpJob2 | ImpJob2 |          1 |       20 |              1 | 55:00           |
      | ImpJob3 | ImpJob3 |        -10 |       -2 |              1 |                 |
    Then Import "<File Format>" from Admin Module and check Imported Data for "Job"
      | CODE    | Result  |
      | ImpJob1 | Success |
      | ImpJob2 | Success |
      | ImpJob3 | Success |
    And Verify Job from Job Processing and Costing Module
      | JobCode | StartDate | EndDate |
      | ImpJob1 |       -10 |      10 |
      | ImpJob2 |         1 |      20 |
      | ImpJob3 |       -10 |      -2 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  #CSR-4012
  @CSR3385_1
  Scenario Outline: Set Launch Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPCSA1" from System Accounts page
    And Create New System Account User
      | SAUser | Role                 | Module   | Menu   | ValidationMessage  |
      | JPCSA1 | System Administrator | <Module> | <Menu> | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | JPCSA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation     |
      | JPCSA1   | admin    | Welcome JPCSA1 |
    Then Verify Launch Page should be "<Menu>"

    Examples: 
      | Module                     | Menu        |
      | Job Processing and Costing | Import Data |

  #CSR-4012
  @CSR3385_2
  Scenario Outline: Roles&Rights - for View Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPCSA1" from System Accounts page
    And Delete Role and Right "JPCRl1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Menu   | View | Add | Edit  | Delete | Validation         |
      | JPCRl1   | <Module> | <Menu> | true |     | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser | Role   | ValidationMessage  |
      | JPCSA1 | JPCRl1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | JPCSA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation     |
      | JPCSA1   | admin    | Welcome JPCSA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add | Edit  | Delete |
      | <Menu> | true |     | false | false  |

    Examples: 
      | Module                     | Menu        |
      | Job Processing and Costing | Import Data |

  #CSR-4012
  @CSR2670_7
  Scenario Outline: Roles&Rights - Default rights check SE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Make "SE" user Active= "true"
    And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | se   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | se       | admin    | Welcome System Engineer |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

    Examples: 
      | Module                     | Menu        |
      | Job Processing and Costing | Import Data |

  #CSR-4012
  @CSR2670_8
  Scenario Outline: Roles&Rights - Default rights check SO
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Make "SO" user Active= "true"
    And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | so   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | so       | admin    | Welcome System Operator |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

    Examples: 
      | Module                     | Menu        |
      | Job Processing and Costing | Import Data |

  #CSR-4012
  @CSR3385_9
  Scenario Outline: Roles&Rights - Module rights - Hide module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPCSA1" from System Accounts page
    And Delete Role and Right "JPCRl1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Hide | Validation         |
      | JPCRl1   | <Module> | true | Saved Successfully |
    And Verify Role rights for RoleName= "JPCRl1" "<Module>"
      | Menu                            | View  | Add | Edit  | Delete | Validation         |
      | Multi-Language Settings         | false |     | false |        | Saved Successfully |
      | System Default Data Translation | false |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser | Role   | ValidationMessage  |
      | JPCSA1 | JPCRl1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | JPCSA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation     |
      | JPCSA1   | admin    | Welcome JPCSA1 |
    Then Verify "<Module>" Module is displayed or Not - "false"

    Examples: 
      | Module |
      | Admin  |

  #CSR-5156
  @CSR3385_10
  Scenario Outline: Roles&Rights - Module rights - View
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPCSA1" from System Accounts page
    And Delete Role and Right "JPCRl1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName | Module   | Hide  | View | Validation         |
      | JPCRl1   | <Module> | false | true | Saved Successfully |
    And Verify Role rights for RoleName= "JPCRl1" "<Module>"
      | Menu   | View | Add | Edit  | Delete | Validation         |
      | <Menu> | true |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser | Role   | ValidationMessage  |
      | JPCSA1 | JPCRl1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | JPCSA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation     |
      | JPCSA1   | admin    | Welcome JPCSA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add | Edit  | Delete |
      | <Menu> | true |     | false | false  |

    Examples: 
      | Module                     | Menu        |
      | Job Processing and Costing | Import Data |

  ################################# V20R7 - CSR-3385 End ##############################
  ################################# V20R8 - CSR-3385 Starts ###########################
  #CSR_3387
  @CSR3385_1
  Scenario: Field name - 'From Date', System allows to change past or backdated dates before assigning job to user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    When Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            4 |         10 |        0004800 | Saved Successfully |
      | JPCJob1 | JPCJob1 |            5 |            |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |            0 |            |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |           -6 |            |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |           -3 |            |                | Saved Successfully |

  #CSR_3387
  @CSR3385_2
  Scenario: Field name - 'From Date', System allows to change past or backdated dates when job assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            4 |         10 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    When Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob1 |                 |               |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation                                                      |
      | JPCJob1 | JPCJob1 |            5 |            |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |            0 |            |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |           -6 |            |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |           -3 |            |                | Job Date-Range cannot be changed for statically assigned Job... |

  #CSR_3387
  @CSR3385_3
  Scenario: Field name - 'To Date', the system should only permit users to set it as a current date or future date from the current date.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    When Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |           -4 |         30 |        0004800 | Saved Successfully |
      | JPCJob1 | JPCJob1 |              |         31 |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |              |         15 |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |              |          0 |                | Saved Successfully |
      | JPCJob1 | JPCJob1 |              |         -3 |                | Saved Successfully |

  #CSR_3387
  @CSR3385_4
  Scenario: For field name - 'To Date', the system should only permit users to set it as a current date or future date from the current date, When Job assigned to user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |           -4 |         30 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    When Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob1 |                 |               |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation                                                      |
      | JPCJob1 | JPCJob1 |              |         31 |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |              |         15 |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |              |          0 |                | Saved Successfully                                              |
      | JPCJob1 | JPCJob1 |              |         -3 |                | Job Date-Range cannot be changed for statically assigned Job... |

  #CSR_3387
  @CSR3385_5
  Scenario: Job date later than Phase or project date then validation is displyed or not
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            4 |         10 |        0004800 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | JPCPhase1 | JPCAutomation | Saved Successfully |
    When Create Project "JPCProj1" with StartDate "3" and EndDate "11" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | JPCPh1            | JPCPhase1 |         4 |      10 |
    And Set Job Configuration in Phase "JPCPhase1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPCJob1 |         4 |      10 |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation                                       |
      | JPCJob1 | JPCJob1 |              |         11 |                | Job Date-Range should be within Phase Date-Range |
      | JPCJob1 | JPCJob1 |            2 |            |                | Job Date-Range should be within Phase Date-Range |

  #CSR_3387
  @CSR3385_6
  Scenario: If any transactions are made by users in COSEC and user tries to narrow the job dates, in that case System should displayed the error Message
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |           -2 |         10 |        0004800 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | JPCPhase1 | JPCAutomation | Saved Successfully |
    And Create Project "JPCProj1" with StartDate "-3" and EndDate "12" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | JPCPh1            | JPCPhase1 |        -2 |      12 |
    And Set Job Configuration in Phase "JPCPhase1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPCJob1 |        -2 |      10 |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob1 |                 |               |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | JPCUsr1 |         -2 |     090000 |
      | JPCUsr1 |         -2 |     120000 |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation                                                      |
      | JPCJob1 | JPCJob1 |            0 |         11 |                | Job Date-Range cannot be changed for statically assigned Job... |

  #CSR_3387
  @CSR3385_7
  Scenario: Current Behavior Scenario - Project>Phase>Job Configuration page - Job dates earlier than Phase or project date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    When Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |           -1 |         10 |        0004900 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | JPCPhase1 | JPCAutomation | Saved Successfully |
    Then Create Project "JPCProj1" with StartDate "0" and EndDate "12" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | JPCPh1            | JPCPhase1 |         0 |      12 |
    And Set Job Configuration in Phase "JPCPhase1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate | Validation                                       |
      | JPCJob1 |        -1 |      10 | Job Date-Range should be within Phase Date-Range |

  #CSR_3387
  @CSR3385_8
  Scenario: Current Behavior Scenario - for successfully Project > Phase > Job Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    When Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            0 |         10 |        0004900 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | JPCPhase1 | JPCAutomation | Saved Successfully |
    Then Create Project "JPCProj1" with StartDate "0" and EndDate "12" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | JPCPh1            | JPCPhase1 |         0 |      11 |
    And Set Job Configuration in Phase "JPCPhase1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate | Validation |
      | JPCJob1 |         0 |      10 |            |

  #CSR_3387
  @CSR3385_9
  Scenario: Current Behavior Scenario - Project>Phase>Job Configuration page - Job dates later than Phase or project date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    When Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            1 |         13 |        0004900 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | JPCPhase1 | JPCAutomation | Saved Successfully |
    Then Create Project "JPCProj1" with StartDate "0" and EndDate "12" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | JPCPh1            | JPCPhase1 |         0 |      12 |
    And Set Job Configuration in Phase "JPCPhase1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate | Validation                                       |
      | JPCJob1 |         1 |      13 | Job Date-Range should be within Phase Date-Range |

  #CSR_3387
  @CSR3385_10
  Scenario: User should create the new Job with past date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    When Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    Then Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |           -5 |         -1 |        0004900 | Saved Successfully |
      | JPCJob2 | JPCJob2 |           -2 |          3 |        0004900 | Saved Successfully |
      | JPCJob3 | JPCJob3 |           -3 |          0 |        0004900 | Saved Successfully |

  #CSR_3386
  @CSR3385_11
  Scenario: Case - 1 : Prioritize Job from User Configuration scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            1 |         10 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |            9 |         15 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |           17 |         25 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |           25 |         31 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob2 | up            |
      | JPCJob3 | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |

  #CSR_3386
  @CSR3385_12
  Scenario: Case - 1 : Prioritize Job from user configuration and punch marking scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |          -10 |         -1 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |          -15 |         -9 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |          -25 |        -17 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |          -31 |        -25 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob2 | up            |
      | JPCJob3 | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | JPCUsr1 |        -28 |     090000 |
      | JPCUsr1 |        -28 |     120000 |
      | JPCUsr1 |        -25 |     090000 |
      | JPCUsr1 |        -25 |     120000 |
      | JPCUsr1 |        -21 |     090000 |
      | JPCUsr1 |        -21 |     120000 |
      | JPCUsr1 |        -15 |     090000 |
      | JPCUsr1 |        -15 |     120000 |
      | JPCUsr1 |         -9 |     090000 |
      | JPCUsr1 |         -9 |     120000 |
      | JPCUsr1 |         -8 |     090000 |
      | JPCUsr1 |         -8 |     120000 |
      | JPCUsr1 |         -7 |     090000 |
      | JPCUsr1 |         -7 |     120000 |
      | JPCUsr1 |         -6 |     090000 |
      | JPCUsr1 |         -6 |     120000 |
      | JPCUsr1 |         -5 |     090000 |
      | JPCUsr1 |         -5 |     120000 |
      | JPCUsr1 |         -4 |     090000 |
      | JPCUsr1 |         -4 |     120000 |
      | JPCUsr1 |         -3 |     090000 |
      | JPCUsr1 |         -3 |     120000 |
      | JPCUsr1 |         -2 |     090000 |
      | JPCUsr1 |         -2 |     120000 |
      | JPCUsr1 |         -1 |     090000 |
      | JPCUsr1 |         -1 |     120000 |
    Then Verify Job according to user punches from Timesheet Correction page
      | UserId  | Date | JobCode | PhaseCode | ProjectCode | StartDate | StartTime | EndDate | EndTime | TransactionType | Hours | JobCount |
      | JPCUsr1 |   -1 | JPCJob1 |           |             |        -1 | 09:00     |      -1 | 12:00   |                 |       |          |
      | JPCUsr1 |   -2 | JPCJob1 |           |             |        -2 | 09:00     |      -2 | 12:00   |                 |       |          |
      | JPCUsr1 |   -3 | JPCJob1 |           |             |        -3 | 09:00     |      -3 | 12:00   |                 |       |          |
      | JPCUsr1 |   -4 | JPCJob1 |           |             |        -4 | 09:00     |      -4 | 12:00   |                 |       |          |
      | JPCUsr1 |   -5 | JPCJob1 |           |             |        -5 | 09:00     |      -5 | 12:00   |                 |       |          |
      | JPCUsr1 |   -6 | JPCJob1 |           |             |        -6 | 09:00     |      -6 | 12:00   |                 |       |          |
      | JPCUsr1 |   -7 | JPCJob1 |           |             |        -7 | 09:00     |      -7 | 12:00   |                 |       |          |
      | JPCUsr1 |   -8 | JPCJob1 |           |             |        -8 | 09:00     |      -8 | 12:00   |                 |       |          |
      | JPCUsr1 |   -9 | JPCJob2 |           |             |        -9 | 09:00     |      -9 | 12:00   |                 |       |          |
      | JPCUsr1 |  -15 | JPCJob2 |           |             |       -15 | 09:00     |     -15 | 12:00   |                 |       |          |
      | JPCUsr1 |  -21 | JPCJob3 |           |             |       -21 | 09:00     |     -21 | 12:00   |                 |       |          |
      | JPCUsr1 |  -25 | JPCJob4 |           |             |       -25 | 09:00     |     -25 | 12:00   |                 |       |          |
      | JPCUsr1 |  -28 | JPCJob4 |           |             |       -28 | 09:00     |     -28 | 12:00   |                 |       |          |

  #CSR_3386
  @CSR3385_13
  Scenario: Case - 2 : Prioritize Job from User Configuration Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            1 |         10 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |            8 |         20 |        0006000 | Saved Successfully |
      | JPCJob3 | JPCJob3 |           21 |         30 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |            1 |         31 |        0010000 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob2 | up            |
      | JPCJob3 | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |

  #CSR_3386
  @CSR3385_14
  Scenario: Case - 2 : Prioritize Job from user configuration and punch marking scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |          -10 |         -1 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |          -20 |         -8 |        0006000 | Saved Successfully |
      | JPCJob3 | JPCJob3 |          -30 |        -21 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |          -31 |         -1 |        0010000 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob2 | up            |
      | JPCJob3 | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | JPCUsr1 |        -31 |     090000 |
      | JPCUsr1 |        -31 |     120000 |
      | JPCUsr1 |        -30 |     090000 |
      | JPCUsr1 |        -30 |     120000 |
      | JPCUsr1 |        -21 |     090000 |
      | JPCUsr1 |        -21 |     120000 |
      | JPCUsr1 |        -15 |     090000 |
      | JPCUsr1 |        -15 |     120000 |
      | JPCUsr1 |         -8 |     090000 |
      | JPCUsr1 |         -8 |     120000 |
      | JPCUsr1 |         -7 |     090000 |
      | JPCUsr1 |         -7 |     120000 |
    Then Verify Job according to user punches from Timesheet Correction page
      | UserId  | Date | JobCode | PhaseCode | ProjectCode | StartDate | StartTime | EndDate | EndTime | TransactionType | Hours | JobCount |
      | JPCUsr1 |   -7 | JPCJob1 |           |             |        -7 | 09:00     |      -7 | 12:00   |                 |       |          |
      | JPCUsr1 |   -8 | JPCJob2 |           |             |        -8 | 09:00     |      -8 | 12:00   |                 |       |          |
      | JPCUsr1 |  -15 | JPCJob2 |           |             |       -15 | 09:00     |     -15 | 12:00   |                 |       |          |
      | JPCUsr1 |  -21 | JPCJob4 |           |             |       -21 | 09:00     |     -21 | 12:00   |                 |       |          |
      | JPCUsr1 |  -30 | JPCJob4 |           |             |       -30 | 09:00     |     -30 | 12:00   |                 |       |          |
      | JPCUsr1 |  -31 | JPCJob4 |           |             |       -31 | 09:00     |     -31 | 12:00   |                 |       |          |

  #CSR_3386
  @CSR3385_15
  Scenario: Case - 3 : Prioritize Job from user configuration scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            1 |         10 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |            9 |         15 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |           17 |         25 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |           25 |         31 |        0004800 | Saved Successfully |
      | JPCJob5 | JPCJob5 |           -9 |         -1 |        0004800 | Saved Successfully |
      | JPCJob6 | JPCJob6 |          -18 |         -5 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    And Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob6 |             -18 |            -5 |
      | JPCJob5 |              -9 |            -1 |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                                         |
      | JPCJob5,JPCJob6,JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob6 | up            |
      | JPCJob1 | down          |
      | JPCJob4 | up            |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                                         |
      | JPCJob6,JPCJob5,JPCJob2,JPCJob1,JPCJob4,JPCJob3 |

  #CSR_3386
  @CSR3385_16
  Scenario: Case - 3 : Prioritize Job from user configuration and punch marking scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |          -10 |         -1 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |          -15 |         -9 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |          -25 |        -17 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |          -30 |        -25 |        0004800 | Saved Successfully |
      | JPCJob5 | JPCJob5 |          -39 |        -31 |        0004800 | Saved Successfully |
      | JPCJob6 | JPCJob6 |          -45 |        -40 |        0004800 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    And Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                         |
      | JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Assign jobs to user="JPCUsr1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob6 |             -45 |           -40 |
      | JPCJob5 |             -39 |           -31 |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                                         |
      | JPCJob5,JPCJob6,JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Prioritize Job from user configuration for UserID= "JPCUsr1"
      | JobCode | PrioritizeJob |
      | JPCJob6 | up            |
      | JPCJob1 | down          |
      | JPCJob4 | up            |
    Then Verify Job Priority from User configuration for UserID= "JPCUsr1"
      | JobCode                                         |
      | JPCJob6,JPCJob5,JPCJob2,JPCJob1,JPCJob4,JPCJob3 |
    And Run Shift Process for Month = "-2" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-2" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | JPCUsr1 |        -45 |     090000 |
      | JPCUsr1 |        -45 |     120000 |
      | JPCUsr1 |        -34 |     090000 |
      | JPCUsr1 |        -34 |     120000 |
      | JPCUsr1 |        -33 |     090000 |
      | JPCUsr1 |        -33 |     120000 |
      | JPCUsr1 |        -32 |     090000 |
      | JPCUsr1 |        -32 |     120000 |
      | JPCUsr1 |        -31 |     090000 |
      | JPCUsr1 |        -31 |     120000 |
      | JPCUsr1 |        -28 |     090000 |
      | JPCUsr1 |        -28 |     120000 |
      | JPCUsr1 |        -25 |     090000 |
      | JPCUsr1 |        -25 |     120000 |
      | JPCUsr1 |        -21 |     090000 |
      | JPCUsr1 |        -21 |     120000 |
      | JPCUsr1 |        -15 |     090000 |
      | JPCUsr1 |        -15 |     120000 |
      | JPCUsr1 |         -9 |     090000 |
      | JPCUsr1 |         -9 |     120000 |
      | JPCUsr1 |         -8 |     090000 |
      | JPCUsr1 |         -8 |     120000 |
      | JPCUsr1 |         -7 |     090000 |
      | JPCUsr1 |         -7 |     120000 |
      | JPCUsr1 |         -6 |     090000 |
      | JPCUsr1 |         -6 |     120000 |
      | JPCUsr1 |         -5 |     090000 |
      | JPCUsr1 |         -5 |     120000 |
      | JPCUsr1 |         -4 |     090000 |
      | JPCUsr1 |         -4 |     120000 |
      | JPCUsr1 |         -3 |     090000 |
      | JPCUsr1 |         -3 |     120000 |
      | JPCUsr1 |         -2 |     090000 |
      | JPCUsr1 |         -2 |     120000 |
      | JPCUsr1 |         -1 |     090000 |
      | JPCUsr1 |         -1 |     120000 |
    Then Verify Job according to user punches from Timesheet Correction page
      | UserId  | Date | JobCode | PhaseCode | ProjectCode | StartDate | StartTime | EndDate | EndTime | TransactionType | Hours | JobCount |
      | JPCUsr1 |   -1 | JPCJob1 |           |             |        -1 | 09:00     |      -1 | 12:00   |                 |       |          |
      | JPCUsr1 |   -2 | JPCJob1 |           |             |        -2 | 09:00     |      -2 | 12:00   |                 |       |          |
      | JPCUsr1 |   -3 | JPCJob1 |           |             |        -3 | 09:00     |      -3 | 12:00   |                 |       |          |
      | JPCUsr1 |   -4 | JPCJob1 |           |             |        -4 | 09:00     |      -4 | 12:00   |                 |       |          |
      | JPCUsr1 |   -5 | JPCJob1 |           |             |        -5 | 09:00     |      -5 | 12:00   |                 |       |          |
      | JPCUsr1 |   -6 | JPCJob1 |           |             |        -6 | 09:00     |      -6 | 12:00   |                 |       |          |
      | JPCUsr1 |   -7 | JPCJob1 |           |             |        -7 | 09:00     |      -7 | 12:00   |                 |       |          |
      | JPCUsr1 |   -8 | JPCJob1 |           |             |        -8 | 09:00     |      -8 | 12:00   |                 |       |          |
      | JPCUsr1 |   -9 | JPCJob2 |           |             |        -9 | 09:00     |      -9 | 12:00   |                 |       |          |
      | JPCUsr1 |  -15 | JPCJob2 |           |             |       -15 | 09:00     |     -15 | 12:00   |                 |       |          |
      | JPCUsr1 |  -21 | JPCJob3 |           |             |       -21 | 09:00     |     -21 | 12:00   |                 |       |          |
      | JPCUsr1 |  -25 | JPCJob4 |           |             |       -25 | 09:00     |     -25 | 12:00   |                 |       |          |
      | JPCUsr1 |  -28 | JPCJob4 |           |             |       -28 | 09:00     |     -28 | 12:00   |                 |       |          |
      | JPCUsr1 |  -31 | JPCJob5 |           |             |       -31 | 09:00     |     -31 | 12:00   |                 |       |          |
      | JPCUsr1 |  -32 | JPCJob5 |           |             |       -32 | 09:00     |     -32 | 12:00   |                 |       |          |
      | JPCUsr1 |  -33 | JPCJob5 |           |             |       -33 | 09:00     |     -33 | 12:00   |                 |       |          |
      | JPCUsr1 |  -34 | JPCJob5 |           |             |       -34 | 09:00     |     -34 | 12:00   |                 |       |          |
      | JPCUsr1 |  -45 | JPCJob6 |           |             |       -45 | 09:00     |     -45 | 12:00   |                 |       |          |

  #CSR_4327
  @CSR3385_17
  Scenario: Case - 1 : Prioritize Job from Enterprise Structure Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |            1 |         10 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |            9 |         15 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |           17 |         25 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |           25 |         31 |        0004800 | Saved Successfully |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JPCORG | JPCORG | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | JobCosting | ConfirmationPopup | validation         |
      | Organization | JPCORG | Enabled    | Yes               | Saved Successfully |
    When Assign jobs to "Organization" = "JPCORG" from Enterprise Structure Module
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    Then Verify Job Priority from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode                         |
      | JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Prioritize Job from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode | PrioritizeJob | Validation         |
      | JPCJob1 | down          | Saved Successfully |
      | JPCJob4 | up            | Saved Successfully |
    Then Verify Job Priority from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |

  #CSR_4327
  @CSR3385_18
  Scenario: Case - 1 : Prioritize Job from Enterprise Structure and punch marking scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | JPCUsr1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JPCORG | Deleted Successfully |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhase1 |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPCJob1 |
      | JPCJob2 |
      | JPCJob3 |
      | JPCJob4 |
      | JPCJob5 |
      | JPCJob6 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPCJob1 | JPCJob1 |          -10 |         -1 |        0004800 | Saved Successfully |
      | JPCJob2 | JPCJob2 |          -15 |         -9 |        0004800 | Saved Successfully |
      | JPCJob3 | JPCJob3 |          -25 |        -17 |        0004800 | Saved Successfully |
      | JPCJob4 | JPCJob4 |          -31 |        -25 |        0004800 | Saved Successfully |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JPCORG | JPCORG | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | JobCosting | ConfirmationPopup | validation         |
      | Organization | JPCORG | Enabled    | Yes               | Saved Successfully |
    When Assign jobs to "Organization" = "JPCORG" from Enterprise Structure Module
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPCJob4 |                 |               |
      | JPCJob3 |                 |               |
      | JPCJob2 |                 |               |
      | JPCJob1 |                 |               |
    Then Verify Job Priority from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode                         |
      | JPCJob1,JPCJob2,JPCJob3,JPCJob4 |
    When Prioritize Job from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode | PrioritizeJob | Validation         |
      | JPCJob1 | down          | Saved Successfully |
      | JPCJob4 | up            | Saved Successfully |
    Then Verify Job Priority from Enterprise Structure for "Organization" = "JPCORG"
      | JobCode                         |
      | JPCJob2,JPCJob1,JPCJob4,JPCJob3 |
    And Create user from user configuration
      | userid  | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUsr1 | True   | JPCORG       | True      |                        2 | Enabled    | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | JPCUsr1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | JPCUsr1 |        -28 |     090000 |
      | JPCUsr1 |        -28 |     120000 |
      | JPCUsr1 |        -25 |     090000 |
      | JPCUsr1 |        -25 |     120000 |
      | JPCUsr1 |        -21 |     090000 |
      | JPCUsr1 |        -21 |     120000 |
      | JPCUsr1 |        -15 |     090000 |
      | JPCUsr1 |        -15 |     120000 |
      | JPCUsr1 |         -9 |     090000 |
      | JPCUsr1 |         -9 |     120000 |
      | JPCUsr1 |         -8 |     090000 |
      | JPCUsr1 |         -8 |     120000 |
      | JPCUsr1 |         -7 |     090000 |
      | JPCUsr1 |         -7 |     120000 |
      | JPCUsr1 |         -6 |     090000 |
      | JPCUsr1 |         -6 |     120000 |
      | JPCUsr1 |         -5 |     090000 |
      | JPCUsr1 |         -5 |     120000 |
      | JPCUsr1 |         -4 |     090000 |
      | JPCUsr1 |         -4 |     120000 |
      | JPCUsr1 |         -3 |     090000 |
      | JPCUsr1 |         -3 |     120000 |
      | JPCUsr1 |         -2 |     090000 |
      | JPCUsr1 |         -2 |     120000 |
      | JPCUsr1 |         -1 |     090000 |
      | JPCUsr1 |         -1 |     120000 |
    Then Verify Job according to user punches from Timesheet Correction page
      | UserId  | Date | JobCode | PhaseCode | ProjectCode | StartDate | StartTime | EndDate | EndTime | TransactionType | Hours | JobCount |
      | JPCUsr1 |   -1 | JPCJob1 |           |             |        -1 | 09:00     |      -1 | 12:00   |                 |       |          |
      | JPCUsr1 |   -2 | JPCJob1 |           |             |        -2 | 09:00     |      -2 | 12:00   |                 |       |          |
      | JPCUsr1 |   -3 | JPCJob1 |           |             |        -3 | 09:00     |      -3 | 12:00   |                 |       |          |
      | JPCUsr1 |   -4 | JPCJob1 |           |             |        -4 | 09:00     |      -4 | 12:00   |                 |       |          |
      | JPCUsr1 |   -5 | JPCJob1 |           |             |        -5 | 09:00     |      -5 | 12:00   |                 |       |          |
      | JPCUsr1 |   -6 | JPCJob1 |           |             |        -6 | 09:00     |      -6 | 12:00   |                 |       |          |
      | JPCUsr1 |   -7 | JPCJob1 |           |             |        -7 | 09:00     |      -7 | 12:00   |                 |       |          |
      | JPCUsr1 |   -8 | JPCJob1 |           |             |        -8 | 09:00     |      -8 | 12:00   |                 |       |          |
      | JPCUsr1 |   -9 | JPCJob2 |           |             |        -9 | 09:00     |      -9 | 12:00   |                 |       |          |
      | JPCUsr1 |  -15 | JPCJob2 |           |             |       -15 | 09:00     |     -15 | 12:00   |                 |       |          |
      | JPCUsr1 |  -21 | JPCJob3 |           |             |       -21 | 09:00     |     -21 | 12:00   |                 |       |          |
      | JPCUsr1 |  -25 | JPCJob4 |           |             |       -25 | 09:00     |     -25 | 12:00   |                 |       |          |
      | JPCUsr1 |  -28 | JPCJob4 |           |             |       -28 | 09:00     |     -28 | 12:00   |                 |       |          |

  #CSR_5454
  @CSR3385_1
  Scenario: Project Creation with Backdate, Post Date and Overlapping Current Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC_U1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
      | JPCProj2    |
      | JPCProj3    |
      | JPCProj4    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhs1   |
      | JPCPhs2   |
      | JPCPhs3   |
      | JPCPhs4   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_Jb1 |
      | JPC_Jb2 |
      | JPC_Jb3 |
      | JPC_Jb4 |
      | JPC_Jb5 |
      | JPC_Jb6 |
      | JPC_Jb7 |
    And Create Phase from Job Processing and Costing
      | Name    | Description    | Validation         |
      | JPCPhs1 | JPCAutomation1 | Saved Successfully |
    And Create Project "JPCProj1" with StartDate "-100" and EndDate "-2" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs01          | JPCPhs1 |       -10 |      -2 |
    And Create Project "JPCProj2" with StartDate "0" and EndDate "31" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs02          | JPCPhs1 |         0 |       2 |
    And Create Project "JPCProj3" with StartDate "1" and EndDate "31" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs03          | JPCPhs1 |         1 |       2 |
    And Create Project "JPCProj4" with StartDate "-30" and EndDate "40" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs04          | JPCPhs1 |       -10 |       2 |

  #CSR_5454
  @CSR3385_2
  Scenario: Backdated phase and job configuration in backdated project
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC_U1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
      | JPCProj2    |
      | JPCProj3    |
      | JPCProj4    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhs1   |
      | JPCPhs2   |
      | JPCPhs3   |
      | JPCPhs4   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_Jb1 |
      | JPC_Jb2 |
      | JPC_Jb3 |
      | JPC_Jb4 |
      | JPC_Jb5 |
      | JPC_Jb6 |
      | JPC_Jb7 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPC_Jb1 | JPC_Jb1 |           -5 |         -1 |        0004800 | Saved Successfully |
      | JPC_Jb2 | JPC_Jb2 |          -10 |         -6 |        0004800 | Saved Successfully |
      | JPC_Jb3 | JPC_Jb3 |          -15 |        -11 |                | Saved Successfully |
      | JPC_Jb4 | JPC_Jb4 |          -20 |        -16 |                | Saved Successfully |
      | JPC_Jb5 | JPC_Jb5 |          -23 |        -21 |                | Saved Successfully |
      | JPC_Jb6 | JPC_Jb6 |          -26 |        -23 |                | Saved Successfully |
      | JPC_Jb7 | JPC_Jb7 |          -31 |        -27 |                | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description    | Validation         |
      | JPCPhs1 | JPCAutomation1 | Saved Successfully |
      | JPCPhs2 | JPCAutomation2 | Saved Successfully |
      | JPCPhs3 | JPCAutomation3 | Saved Successfully |
    When Create Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs01          | JPCPhs1 |       -10 |      -1 |
      | JPCPhs02          | JPCPhs2 |       -20 |     -11 |
      | JPCPhs03          | JPCPhs3 |       -31 |     -21 |
    And Set Job Configuration in Phase "JPCPhs1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPC_Jb1 |        -5 |      -1 |
      | JPC_Jb2 |       -10 |      -6 |
    And Set Job Configuration in Phase "JPCPhs2" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPC_Jb3 |       -15 |     -11 |
      | JPC_Jb4 |       -20 |     -16 |
    And Set Job Configuration in Phase "JPCPhs3" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPC_Jb5 |       -23 |     -21 |
      | JPC_Jb6 |       -26 |     -23 |
      | JPC_Jb7 |       -31 |     -27 |

  #CSR_5454
  @CSR3385_3
  Scenario: Update project date Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC_U1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
      | JPCProj2    |
      | JPCProj3    |
      | JPCProj4    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhs1   |
      | JPCPhs2   |
      | JPCPhs3   |
      | JPCPhs4   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_Jb1 |
      | JPC_Jb2 |
      | JPC_Jb3 |
      | JPC_Jb4 |
      | JPC_Jb5 |
      | JPC_Jb6 |
      | JPC_Jb7 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPC_Jb1 | JPC_Jb1 |          -10 |         -7 |        0004800 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description    | Validation         |
      | JPCPhs1 | JPCAutomation1 | Saved Successfully |
    When Create Project "JPCProj1" with StartDate "-31" and EndDate "-3" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs01          | JPCPhs1 |       -10 |      -5 |
    And Set Job Configuration in Phase "JPCPhs1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | JPC_Jb1 |       -10 |      -7 |
    Then Update Project "JPCProj1" with StartDate "-9" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase | StartDate | EndDate | Validation                                           |
      |                   |       |           |         | Phase Date-Range should be within Project Date-Range |
    And Update Project "JPCProj1" with StartDate "-9" and EndDate "-6" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase | StartDate | EndDate | Validation                                           |
      |                   |       |           |         | Phase Date-Range should be within Project Date-Range |
    And Update Project "JPCProj1" with StartDate "0" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase | StartDate | EndDate | Validation                                           |
      |                   |       |           |         | Phase Date-Range should be within Project Date-Range |
    And Update Project "JPCProj1" with StartDate "-3" and EndDate "15" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase | StartDate | EndDate | Validation                                           |
      |                   |       |           |         | Phase Date-Range should be within Project Date-Range |

  #CSR_5454
  @CSR3385_4
  Scenario: Update phase date Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | JPC_U1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | JPCProj1    |
      | JPCProj2    |
      | JPCProj3    |
      | JPCProj4    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | JPCPhs1   |
      | JPCPhs2   |
      | JPCPhs3   |
      | JPCPhs4   |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_Jb1 |
      | JPC_Jb2 |
      | JPC_Jb3 |
      | JPC_Jb4 |
      | JPC_Jb5 |
      | JPC_Jb6 |
      | JPC_Jb7 |
    And Create Job from Job Processing and Costing
      | Code    | Name    | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | JPC_Jb1 | JPC_Jb1 |           -5 |         -1 |        0004800 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name    | Description    | Validation         |
      | JPCPhs1 | JPCAutomation1 | Saved Successfully |
    When Create Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs01          | JPCPhs1 |       -10 |      -5 |
    Then Set Job Configuration in Phase "JPCPhs1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate | Validation                                       |
      | JPC_Jb1 |        -5 |      -1 | Job Date-Range should be within Phase Date-Range |
    When Create Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate |
      | JPCPhs01          | JPCPhs1 |        -8 |      -1 |
    Then Set Job Configuration in Phase "JPCPhs1" of Project "JPCProj1" from Job Processing and Costing
      | JobCode | StartDate | EndDate | Validation |
      | JPC_Jb1 |        -5 |      -1 |            |
    And Update Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate | Validation                                       |
      | JPCPhs01          | JPCPhs1 |        -7 |      -2 | Job Date-Range should be within Phase Date-Range |
    And Update Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate | Validation         |
      | JPCPhs01          | JPCPhs1 |       -15 |      -1 | Saved Successfully |
    And Update Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate | Validation                                           |
      | JPCPhs01          | JPCPhs1 |       -41 |      -1 | Phase Date-Range should be within Project Date-Range |
    And Update Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate | Validation                                           |
      | JPCPhs01          | JPCPhs1 |        -5 |       5 | Phase Date-Range should be within Project Date-Range |
    And Update Project "JPCProj1" with StartDate "-31" and EndDate "-1" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase   | StartDate | EndDate | Validation                                           |
      | JPCPhs01          | JPCPhs1 |       -41 |       5 | Phase Date-Range should be within Project Date-Range |
      ################################# V20R8 - CSR-3385 End ##############################
