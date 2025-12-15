@SystemAccount_OnBehalf
Feature: System Account OnBehalf Applications
  I want to use this template for my feature file

  @SA_OnBehalf_1
  Scenario: SA_OnBehalf - Attendance Correction - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Create Contractor from CWM module
      | Id         | name       | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1     | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | OnBehalfC1 | OnBehalfC1 |              20 | OnBehalf1      |         788881 | OnBehalf1@cwm.com |      1200 | lic1        | True          | True             | Saved Successfully |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift            | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | OnBehalf_U1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Attendance Correction from SA Date From= "0" To= "0"
      | UserID      | AttendanceDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |              0 | true    |        | Saved Successfully |

  @SA_OnBehalf_2
  Scenario: SA_OnBehalf - Attendance Correction - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift            | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | OnBehalf_U1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Attendance Correction from SA Date From= "0" To= "0"
      | UserID      | AttendanceDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |              0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |              0 |         | true   | Saved Successfully |

  @SA_OnBehalf_3
  Scenario: SA_OnBehalf - Attendance Correction - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift            | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | OnBehalf_U1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Attendance Correction" Application from RIC Date from= "0" To= "0"
      | User        | AttendanceDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |              0 | true    |        | Saved Successfully |

  @SA_OnBehalf_4
  Scenario: SA_OnBehalf - Attendance Correction - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift            | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | OnBehalf_U1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W1 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Attendance Correction" Application from RIC Date from= "0" To= "0"
      | User        | AttendanceDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |              0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |              0 |         | true   | Saved Successfully |

  @SA_OnBehalf_5
  Scenario: SA_OnBehalf - Advance Overtime Application - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Overtime Policy from TnA module
      | Name      |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                         | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Advance Overtime Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | OnBehalf1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | OvertimePlc | OtCoffEligibility | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | True      | OnBehalf1   | Both              | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | OvertimePlc | OtCoffEligibility | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | True      | True      | True               | True      | OnBehalf1   | Both              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Create Advance Overtime Application from SA
      | User        | AttendanceDate | OTHours | Reason   | Validation                                     |
      | OnBehalf_U1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
      | OnBehalf_W1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Advance Overtime Application from SA Date from= "1" To= "1"
      | User        | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | OnBehalf_U1 |      1 | 03:00   | 03:00         | true    |        | Saved Successfully |
      | OnBehalf_W1 |      1 | 03:00   | 03:00         | true    |        | Saved Successfully |

  @SA_OnBehalf_6
  Scenario: SA_OnBehalf - Advance Overtime Application - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Overtime Policy from TnA module
      | Name      |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                         | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Advance Overtime Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | OnBehalf1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | AtdEnable | OvertimePlc | OtCoffEligibility | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | True      | OnBehalf1   | Both              | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | OvertimePlc | OtCoffEligibility | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | True      | True      | True               | True      | OnBehalf1   | Both              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Create Advance Overtime Application from SA
      | User        | AttendanceDate | OTHours | Reason   | Validation                                     |
      | OnBehalf_U1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
      | OnBehalf_W1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Advance Overtime Application from SA Date from= "1" To= "1"
      | User        | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | OnBehalf_U1 |      1 | 03:00   | 03:00         |         | true   | Saved Successfully |
      | OnBehalf_W1 |      1 | 03:00   | 03:00         |         | true   | Saved Successfully |

  @SA_OnBehalf_7
  Scenario: SA_OnBehalf - Advance Overtime Application - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Overtime Policy from TnA module
      | Name      |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                         | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Advance Overtime Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | OnBehalf1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | OvertimePlc | OtCoffEligibility | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | OnBehalf1   | Both              | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | OvertimePlc | OtCoffEligibility | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | OnBehalf1   | Both              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Create Advance Overtime Application from SA
      | User        | AttendanceDate | OTHours | Reason   | Validation                                     |
      | OnBehalf_U1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
      | OnBehalf_W1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Advance Overtime Approval" Application from RIC Date from= "1" To= "1"
      | User        | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | OnBehalf_U1 |      1 | 03:00   | 03:00         | true    |        | Saved Successfully |
      | OnBehalf_W1 |      1 | 03:00   | 03:00         | true    |        | Saved Successfully |

  @SA_OnBehalf_8
  Scenario: SA_OnBehalf - Advance Overtime Application - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Overtime Policy from TnA module
      | Name      |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                         | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Advance Overtime Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | OnBehalf1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | OvertimePlc | OtCoffEligibility | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | OnBehalf1   | Both              | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | OvertimePlc | OtCoffEligibility | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | OnBehalf1   | Both              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Create Advance Overtime Application from SA
      | User        | AttendanceDate | OTHours | Reason   | Validation                                     |
      | OnBehalf_U1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
      | OnBehalf_W1 |              1 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Advance Overtime Approval" Application from RIC Date from= "1" To= "1"
      | User        | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | OnBehalf_U1 |      1 | 03:00   | 03:00         |         | true   | Saved Successfully |
      | OnBehalf_W1 |      1 | 03:00   | 03:00         |         | true   | Saved Successfully |

  @SA_OnBehalf_9
  Scenario: SA_OnBehalf - Leave application - Paid - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MC      | MC        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MC      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | OnBehalf_U1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
      | OnBehalf_W1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
      | OnBehalf_W1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Leave Application from SA Date From= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_10
  Scenario: SA_OnBehalf - Leave application - Paid - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MC      | MC        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MC      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | OnBehalf_U1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
      | OnBehalf_W1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
      | OnBehalf_W1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Leave Application from SA Date From= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_11
  Scenario: SA_OnBehalf - Leave application - Paid - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MC      | MC        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MC      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | OnBehalf_U1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
      | OnBehalf_W1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
      | OnBehalf_W1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Leave" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_12
  Scenario: SA_OnBehalf - Leave application - Paid - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MC      | MC        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MC      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | days | leave-code | period | month | year | pro-rata | remark |
      | OnBehalf_U1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
      | OnBehalf_W1 |          0 |           0 |   10 | MC         |        |       |      |          | credit |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
      | OnBehalf_W1 | Both           |        0 |      0 | MC - MC | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Leave" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_13
  Scenario: SA_OnBehalf - Leave application - Hourly Paid - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MD      | MD        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | OnBehalf_U1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
      | OnBehalf_W1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                   |
      | OnBehalf_U1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
      | OnBehalf_W1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Leave Application from SA Date From= "0" To= "0"
       | User        | FromDate | ToDate | Approve | Reject | Validation         |
       | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
       | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_14
  Scenario: SA_OnBehalf - Leave application - Hourly Paid - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MD      | MD        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | OnBehalf_U1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
      | OnBehalf_W1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                   |
      | OnBehalf_U1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
      | OnBehalf_W1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Leave Application from SA Date From= "0" To= "0"
       | User        | FromDate | ToDate | Approve | Reject | Validation         |
       | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
       | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_15
  Scenario: SA_OnBehalf - Leave application - Hourly Paid - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MD      | MD        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | OnBehalf_U1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
      | OnBehalf_W1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                   |
      | OnBehalf_U1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
      | OnBehalf_W1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Leave" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_16
  Scenario: SA_OnBehalf - Leave application - Hourly Paid - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Leave Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | MD      | MD        | Hourly Paid Leave | Single App     | 00:00     | 23:59           | 23:59           | True            | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | OnBehalf_U1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
      | OnBehalf_W1 |          0 |           0 |                 |                 |      | 140720230200 |              1 | MD         |        |       |      |          | credit | 100:00 |
    And Apply Leave Application from leave module
      | userid      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                   |
      | OnBehalf_U1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
      | OnBehalf_W1 | Hourly         |       0 |        0 |      0 | 09:00    | 10:00  | MD - MD | Leave Approval is pending |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Leave" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_17
  Scenario: SA_OnBehalf - Tour application - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Tour Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ME     | ME       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | ME      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply Tour Application from leave module
      | userid      | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 |        0 |      0 | ME - ME | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | ME - ME | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Tour Application from SA Date From= "0" To= "0"
       | User        | FromDate | ToDate | Approve | Reject | Validation         |
       | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
       | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_18
  Scenario: SA_OnBehalf - Tour application - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Tour Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ME     | ME       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | ME      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply Tour Application from leave module
      | userid      | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 |        0 |      0 | ME - ME | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | ME - ME | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Tour Application from SA Date From= "0" To= "0"
       | User        | FromDate | ToDate | Approve | Reject | Validation         |
       | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
       | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_19
  Scenario: SA_OnBehalf - Tour application - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Tour Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ME     | ME       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | ME      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply Tour Application from leave module
      | userid      | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 |        0 |      0 | ME - ME | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | ME - ME | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Tour" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_20
  Scenario: SA_OnBehalf - Tour application - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | Tour Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ME     | ME       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | ME      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply Tour Application from leave module
      | userid      | FromDate | ToDate | Leave   | Validation                   |
      | OnBehalf_U1 |        0 |      0 | ME - ME | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | ME - ME | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "Tour" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_21
  Scenario: SA_OnBehalf - Coff application - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | C-OFF Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MF      | MF        | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MF      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_U1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_W1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply COff Application from SA
      | UserID      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Validation                   |
      | OnBehalf_U1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Coff Application from SA Date From= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_22
  Scenario: SA_OnBehalf - Coff application - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | C-OFF Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MF      | MF        | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MF      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_U1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_W1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Apply COff Application from SA
      | UserID      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Validation                   |
      | OnBehalf_U1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Coff Application from SA Date From= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_23
  Scenario: SA_OnBehalf - Coff application - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | C-OFF Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MF      | MF        | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MF      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_U1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_W1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Apply COff Application from SA
      | UserID      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Validation                   |
      | OnBehalf_U1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "C-OFF" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 | true    |        | Saved Successfully |

  @SA_OnBehalf_24
  Scenario: SA_OnBehalf - Coff application - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module           | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Leave Management | C-OFF Application | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MF      | MF        | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "Leave Group-1" with Pro-rata "False"
      | LeaveID |
      | MF      |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OnBehalf_U1 | True   | OnBehalf_R1    | True      | True      | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_U1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    When Manual Overtime/C-OFF Entry for UserID= "OnBehalf_W1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Apply COff Application from SA
      | UserID      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Validation                   |
      | OnBehalf_U1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
      | OnBehalf_W1 |        0 |      0 | MF - MF |       0 | 08:00         | No more absent records exist |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Approve Reject "C-OFF" Application from RIC Date from= "0" To= "0"
      | User        | FromDate | ToDate | Approve | Reject | Validation         |
      | OnBehalf_U1 |        0 |      0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |        0 |      0 |         | true   | Saved Successfully |

  @SA_OnBehalf_25
  Scenario: SA_OnBehalf - Manual Correction - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Device from Device Configuration
      | DeviceName |
      | OnBehalf1  |
    And Delete Menu from CMM module
      | Name      |
      | OnBehalf1 |
    And Delete Item from CMM module
      | Name      |
      | OnBehalf1 |
    And Add Device from device module
      | DeviceType | DeviceName | MACAddress        | IPAddress | Application |
      | ARGO FACE  | OnBehalf1  | AA:AA:AB:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name      | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | OnBehalf1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name      | Activate | ContainsDefaultItem | ItemList  |
      | OnBehalf1 | True     | True                | OnBehalf1 |
    And POS Devices Configuration from CMM module for Device "OnBehalf1" and Menu names "OnBehalf1"
      | Menu      | StartTime | EndTime | ScheduleDays |
      | OnBehalf1 | 00:00     | 23:59   | Check All    |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module               | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Cafeteria Management | Manual Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create user from user configuration
      | userid      | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         | AllowedUsagePerMonth |
      | OnBehalf_U1 | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |                      |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device    | id                      |
      | ARGO FACE  | OnBehalf1 | OnBehalf_U1,OnBehalf_W1 |
    And Cafeteria Recharge of user from CMM module
      | UserId      | Process  | RechargeAmount | Validation            |
      | OnBehalf_U1 | Recharge |           1000 | Recharge Successfully |
      | OnBehalf_W1 | Recharge |           1000 | Recharge Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Manual Correction from CMM module
      | UserId      | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | OnBehalf_U1 |       0 | 10:00   | OnBehalf1  | OnBehalf1 | OnBehalf1 |           1 | Saved Successfully |
      | OnBehalf_W1 |       0 | 10:00   | OnBehalf1  | OnBehalf1 | OnBehalf1 |           1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Correction Approval from CMM module
      | TrnDate | UserId      | Approval | Validation         |
      |       0 | OnBehalf_U1 | Approve  | Saved Successfully |
      |       0 | OnBehalf_W1 | Approve  | Saved Successfully |

  @SA_OnBehalf_26
  Scenario: SA_OnBehalf - Manual Correction - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Device from Device Configuration
      | DeviceName |
      | OnBehalf1  |
    And Delete Menu from CMM module
      | Name      |
      | OnBehalf1 |
    And Delete Item from CMM module
      | Name      |
      | OnBehalf1 |
    And Add Device from device module
      | DeviceType | DeviceName | MACAddress        | IPAddress | Application |
      | ARGO FACE  | OnBehalf1  | AA:AA:AB:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name      | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | OnBehalf1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name      | Activate | ContainsDefaultItem | ItemList  |
      | OnBehalf1 | True     | True                | OnBehalf1 |
    And POS Devices Configuration from CMM module for Device "OnBehalf1" and Menu names "OnBehalf1"
      | Menu      | StartTime | EndTime | ScheduleDays |
      | OnBehalf1 | 00:00     | 23:59   | Check All    |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module               | Menu              | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Cafeteria Management | Manual Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create user from user configuration
      | userid      | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         | AllowedUsagePerMonth |
      | OnBehalf_U1 | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |                      |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device    | id                      |
      | ARGO FACE  | OnBehalf1 | OnBehalf_U1,OnBehalf_W1 |
    And Cafeteria Recharge of user from CMM module
      | UserId      | Process  | RechargeAmount | Validation            |
      | OnBehalf_U1 | Recharge |           1000 | Recharge Successfully |
      | OnBehalf_W1 | Recharge |           1000 | Recharge Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    And Manual Correction from CMM module
      | UserId      | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | OnBehalf_U1 |       0 | 10:00   | OnBehalf1  | OnBehalf1 | OnBehalf1 |           1 | Saved Successfully |
      | OnBehalf_W1 |       0 | 10:00   | OnBehalf1  | OnBehalf1 | OnBehalf1 |           1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Correction Approval from CMM module
      | TrnDate | UserId      | Approval | Validation         |
      |       0 | OnBehalf_U1 | Reject   | Saved Successfully |
      |       0 | OnBehalf_W1 | Reject   | Saved Successfully |

  @SA_OnBehalf_29
  Scenario: SA_OnBehalf - Field Visit Correction - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                 | Menu                   | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Field Visit Management | Field Visit Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | FVM-enable |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |          1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L2   | L2   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | L6       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "OnBehalf_U1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Create Field Visit Schedule for User "OnBehalf_W1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Field Visit Correction from SA login
      | UserID      | Date | Time | Location | Comment       | Validation         |
      | OnBehalf_U1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
      | OnBehalf_W1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName    | AttendanceDate | Approve | Reject | Validaton          |
      | OnBehalf_U1 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |              0 | true    |        | Saved Successfully |

  @SA_OnBehalf_30
  Scenario: SA_OnBehalf - Field Visit Correction - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                 | Menu                   | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Field Visit Management | Field Visit Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | FVM-enable |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |          1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | True      |Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L2   | L2   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | L6       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "OnBehalf_U1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Create Field Visit Schedule for User "OnBehalf_W1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Field Visit Correction from SA login
      | UserID      | Date | Time | Location | Comment       | Validation         |
      | OnBehalf_U1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
      | OnBehalf_W1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Authorize Field visit corretion from Field Visit Correction Authorization Page from SA Login
      | UserName    | AttendanceDate | Approve | Reject | Validaton          |
      | OnBehalf_U1 |              0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |              0 |         | true   | Saved Successfully |

  @SA_OnBehalf_31
  Scenario: SA_OnBehalf - Field Visit Correction - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                 | Menu                   | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Field Visit Management | Field Visit Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | True      | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L2   | L2   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | L6       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "OnBehalf_U1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Create Field Visit Schedule for User "OnBehalf_W1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Field Visit Correction from SA login
      | UserID      | Date | Time | Location | Comment       | Validation         |
      | OnBehalf_U1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
      | OnBehalf_W1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    Then Authorize Field visit corretion from RIC FromDate="0" ToDate= "0"
      | UserName    | AttendanceDate | Approve | Reject | Validaton          |
      | OnBehalf_U1 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W1 |              0 | true    |        | Saved Successfully |

  @SA_OnBehalf_32
  Scenario: SA_OnBehalf - Field Visit Correction - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                 | Menu                   | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Field Visit Management | Field Visit Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | True      | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | EnableFVM | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | L2   | L2   | Wi-Fi |         |         |          |           |                      | 00:00:00:00:01:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | L6       | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "OnBehalf_U1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Create Field Visit Schedule for User "OnBehalf_W1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark   |
      |                 0 |              0900 |               0 |            1000 | L6       | L2       | Schedule |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Field Visit Correction from SA login
      | UserID      | Date | Time | Location | Comment       | Validation         |
      | OnBehalf_U1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
      | OnBehalf_W1 |    0 | 0900 | L2       | FVS Corrected | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    Then Authorize Field visit corretion from RIC FromDate="0" ToDate= "0"
      | UserName    | AttendanceDate | Approve | Reject | Validaton          |
      | OnBehalf_U1 |              0 |         | true   | Saved Successfully |
      | OnBehalf_W1 |              0 |         | true   | Saved Successfully |

  @SA_OnBehalf_33
  Scenario: SA_OnBehalf - Timesheet Correction - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | OnBehalf1   |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | OnBehalf1 |
    And Delete Job from Job Processing and Costing
      | JobCode   |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                     | Menu                 | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Job Processing and Costing | Timesheet Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | job-assignment-type |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |                   1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code      | Name      | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | OnBehalf1 | OnBehalf1 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | OnBehalf1 | JPCAutomation | Saved Successfully |
    And Create Project "OnBehalf1" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | OnBehalf1         | OnBehalf1 |         0 |       0 |
    And Set Job Configuration in Phase "OnBehalf1" of Project "OnBehalf1" from Job Processing and Costing
      | JobCode   | StartDate | EndDate |
      | OnBehalf1 |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     090000 |
      | OnBehalf_U1 |          0 |     120000 |
      | OnBehalf_W1 |          0 |     090000 |
      | OnBehalf_W1 |          0 |     120000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Timesheet Correction Application from SA login
      | userid      | attendance-date | job-code  | Validation         |
      | OnBehalf_U1 |               0 | OnBehalf1 | Saved Successfully |
      | OnBehalf_W1 |               0 | OnBehalf1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Authorize time sheet corrrection application from JPC module
      | UserName    | AttendanceDate | FilterUser | Approval | Validation         |
      | OnBehalf_U1 |              0 | Individual | Approve  | Saved Successfully |
      | OnBehalf_W1 |              0 | Individual | Approve  | Saved Successfully |

  @SA_OnBehalf_34
  Scenario: SA_OnBehalf - Timesheet Correction - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | OnBehalf1   |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | OnBehalf1 |
    And Delete Job from Job Processing and Costing
      | JobCode   |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                     | Menu                 | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Job Processing and Costing | Timesheet Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | job-assignment-type |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |                   1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code      | Name      | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | OnBehalf1 | OnBehalf1 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | OnBehalf1 | JPCAutomation | Saved Successfully |
    And Create Project "OnBehalf1" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | OnBehalf1         | OnBehalf1 |         0 |       0 |
    And Set Job Configuration in Phase "OnBehalf1" of Project "OnBehalf1" from Job Processing and Costing
      | JobCode   | StartDate | EndDate |
      | OnBehalf1 |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     090000 |
      | OnBehalf_U1 |          0 |     120000 |
      | OnBehalf_W1 |          0 |     090000 |
      | OnBehalf_W1 |          0 |     120000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Timesheet Correction Application from SA login
      | userid      | attendance-date | job-code  | Validation         |
      | OnBehalf_U1 |               0 | OnBehalf1 | Saved Successfully |
      | OnBehalf_W1 |               0 | OnBehalf1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Authorize time sheet corrrection application from JPC module
      | UserName    | AttendanceDate | FilterUser | Approval | Validation         |
      | OnBehalf_U1 |              0 | Individual | Reject   | Saved Successfully |
      | OnBehalf_W1 |              0 | Individual | Reject   | Saved Successfully |

  @SA_OnBehalf_35
  Scenario: SA_OnBehalf - Timesheet Correction - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | OnBehalf1   |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | OnBehalf1 |
    And Delete Job from Job Processing and Costing
      | JobCode   |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                     | Menu                 | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Job Processing and Costing | Timesheet Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | Enabled    | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Enabled       | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code      | Name      | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | OnBehalf1 | OnBehalf1 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | OnBehalf1 | JPCAutomation | Saved Successfully |
    And Create Project "OnBehalf1" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | OnBehalf1         | OnBehalf1 |         0 |       0 |
    And Set Job Configuration in Phase "OnBehalf1" of Project "OnBehalf1" from Job Processing and Costing
      | JobCode   | StartDate | EndDate |
      | OnBehalf1 |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     090000 |
      | OnBehalf_U1 |          0 |     120000 |
      | OnBehalf_W1 |          0 |     090000 |
      | OnBehalf_W1 |          0 |     120000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Timesheet Correction Application from SA login
      | userid      | attendance-date | job-code  | Validation         |
      | OnBehalf_U1 |               0 | OnBehalf1 | Saved Successfully |
      | OnBehalf_W1 |               0 | OnBehalf1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName    | AttendanceDate | FilterUser | Approval | Validation         |
      | OnBehalf_U1 |              0 | Individual | Approve  | Saved Successfully |
      | OnBehalf_W1 |              0 | Individual | Approve  | Saved Successfully |

  @SA_OnBehalf_36
  Scenario: SA_OnBehalf - Timesheet Correction - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | OnBehalf1   |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | OnBehalf1 |
    And Delete Job from Job Processing and Costing
      | JobCode   |
      | OnBehalf1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module                     | Menu                 | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Job Processing and Costing | Timesheet Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | Enabled       | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | JobCosting | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Enabled       | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code      | Name      | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | OnBehalf1 | OnBehalf1 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name      | Description   | Validation         |
      | OnBehalf1 | JPCAutomation | Saved Successfully |
    And Create Project "OnBehalf1" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase     | StartDate | EndDate |
      | OnBehalf1         | OnBehalf1 |         0 |       0 |
    And Set Job Configuration in Phase "OnBehalf1" of Project "OnBehalf1" from Job Processing and Costing
      | JobCode   | StartDate | EndDate |
      | OnBehalf1 |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     090000 |
      | OnBehalf_U1 |          0 |     120000 |
      | OnBehalf_W1 |          0 |     090000 |
      | OnBehalf_W1 |          0 |     120000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Apply Timesheet Correction Application from SA login
      | userid      | attendance-date | job-code  | Validation         |
      | OnBehalf_U1 |               0 | OnBehalf1 | Saved Successfully |
      | OnBehalf_W1 |               0 | OnBehalf1 | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    And Authorize time sheet corrrection application from RIC Login
      | UserName    | AttendanceDate | FilterUser | Approval | Validation         |
      | OnBehalf_U1 |              0 | Individual | Reject   | Saved Successfully |
      | OnBehalf_W1 |              0 | Individual | Reject   | Saved Successfully |

  @SA_OnBehalf_37
  Scenario: SA_OnBehalf - Pre-Registration - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete visitor via API
      | mobilenumber |
      |        45671 |
      |        45672 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module             | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Visitor Management | Pre-Registration | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | True      | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Visitor Preregistration from VMS module
      | HostUser    | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | OnBehalf_U1 | OnBehalf1 |   45671 | OnBehalf1@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
      | OnBehalf_W1 | OnBehalf2 |   45672 | OnBehalf2@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approval of RIC from Visit Registration Approval page in VMS module
      | FromDate | ToDate | HostID      | Approval |
      |        0 |      0 | OnBehalf_U1 | Approve  |
      |        0 |      0 | OnBehalf_W1 | Approve  |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @SA_OnBehalf_38
  Scenario: SA_OnBehalf - Pre-Registration - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete visitor via API
      | mobilenumber |
      |        45671 |
      |        45672 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module             | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Visitor Management | Pre-Registration | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | True      | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Visitor Preregistration from VMS module
      | HostUser    | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | OnBehalf_U1 | OnBehalf1 |   45671 | OnBehalf1@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
      | OnBehalf_W1 | OnBehalf2 |   45672 | OnBehalf2@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approval of RIC from Visit Registration Approval page in VMS module
      | FromDate | ToDate | HostID      | Approval |
      |        0 |      0 | OnBehalf_U1 | Reject   |
      |        0 |      0 | OnBehalf_W1 | Reject   |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @SA_OnBehalf_39
  Scenario: SA_OnBehalf - Pre-Registration - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete visitor via API
      | mobilenumber |
      |        45671 |
      |        45672 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module             | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Visitor Management | Pre-Registration | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | True               | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Visitor Preregistration from VMS module
      | HostUser    | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | OnBehalf_U1 | OnBehalf1 |   45671 | OnBehalf1@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
      | OnBehalf_W1 | OnBehalf2 |   45672 | OnBehalf2@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID      | Approval |
      |        0 |      0 | OnBehalf_U1 | Approve  |
      |        0 |      0 | OnBehalf_W1 | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @SA_OnBehalf_40
  Scenario: SA_OnBehalf - Pre-Registration - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete visitor via API
      | mobilenumber |
      |        45671 |
      |        45672 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module             | Menu             | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Visitor Management | Pre-Registration | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | True               | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | AuthorizedHostUser | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | True               | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Visitor Preregistration from VMS module
      | HostUser    | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | OnBehalf_U1 | OnBehalf1 |   45671 | OnBehalf1@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
      | OnBehalf_W1 | OnBehalf2 |   45672 | OnBehalf2@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID      | Approval |
      |        0 |      0 | OnBehalf_U1 | Reject   |
      |        0 |      0 | OnBehalf_W1 | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @SA_OnBehalf_41
  Scenario: SA_OnBehalf - Short Leave/ Official IN-OUT Entry - SA - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     100000 |
      | OnBehalf_U1 |          0 |     180000 |
      | OnBehalf_W1 |          0 |     100000 |
      | OnBehalf_W1 |          0 |     180000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Short leave Official InOut entry from TnA module
      | UserID      | AttendanceDate | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | Validation         |
      | OnBehalf_U1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
      | OnBehalf_W1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "0" To= "0"
      | UserID      | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | OnBehalf_U1 |    0 | Official        | 09:00 | 10:00 | true    |        | Saved Successfully |
      | OnBehalf_W1 |    0 | Official        | 09:00 | 10:00 | true    |        | Saved Successfully |

  @SA_OnBehalf_42
  Scenario: SA_OnBehalf - Short Leave/ Official IN-OUT Entry - SA - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_U1 | OnBehalf_U1 |               1 |         1 |               1 |                  1 |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1     | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     100000 |
      | OnBehalf_U1 |          0 |     180000 |
      | OnBehalf_W1 |          0 |     100000 |
      | OnBehalf_W1 |          0 |     180000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Short leave Official InOut entry from TnA module
      | UserID      | AttendanceDate | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | Validation         |
      | OnBehalf_U1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
      | OnBehalf_W1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Approve Reject Short Leave/Official IN-OUT Application from SA Date from= "0" To= "0"
      | UserID      | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | OnBehalf_U1 |    0 | Official        | 09:00 | 10:00 |         | true   | Saved Successfully |
      | OnBehalf_W1 |    0 | Official        | 09:00 | 10:00 |         | true   | Saved Successfully |

  @SA_OnBehalf_43
  Scenario: SA_OnBehalf - Short Leave/ Official IN-OUT Entry - RIC - Approve - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     100000 |
      | OnBehalf_U1 |          0 |     180000 |
      | OnBehalf_W1 |          0 |     100000 |
      | OnBehalf_W1 |          0 |     180000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Short leave Official InOut entry from TnA module
      | UserID      | AttendanceDate | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | Validation         |
      | OnBehalf_U1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
      | OnBehalf_W1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "0" To= "0"
      | UserID      | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | OnBehalf_U1 |    0 | Official        | 09:00 | 10:00 | true    |        | Saved Successfully |
      | OnBehalf_W1 |    0 | Official        | 09:00 | 10:00 | true    |        | Saved Successfully |

  @SA_OnBehalf_44
  Scenario: SA_OnBehalf - Short Leave/ Official IN-OUT Entry - RIC - Reject - User - Worker
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U1 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W1 |
    And Delete System Account User "OnBehalf1" from System Accounts page
    And Delete Role and Right "OnBehalf1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf1 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add  | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf1 | Time and Attendance | Attendance Correction | true | true | true | true   | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf1 | OnBehalf1 | True      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | OnBehalf_R1 | OnBehalf_R1 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OnBehalf_R1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | OnBehalf_R1      |        1 | OnBehalf_R1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_U1 | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
      | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalfC1      | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U1 |
      | OnBehalf_W1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | OnBehalf_U1 |          0 |     100000 |
      | OnBehalf_U1 |          0 |     180000 |
      | OnBehalf_W1 |          0 |     100000 |
      | OnBehalf_W1 |          0 |     180000 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf1 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf1 | admin    | Welcome OnBehalf1 |
    When Short leave Official InOut entry from TnA module
      | UserID      | AttendanceDate | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | Validation         |
      | OnBehalf_U1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
      | OnBehalf_W1 |              0 | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username    | password | Validation          |
      | OnBehalf_R1 | admin    | Welcome OnBehalf_R1 |
    Then Approve Reject "Short Leave/Official IN-OUT" Application from RIC Date from= "0" To= "0"
      | UserID      | Date | SpecialFunction | Start | End   | Approve | Reject | Validation         |
      | OnBehalf_U1 |    0 | Official        | 09:00 | 10:00 |         | true   | Saved Successfully |
      | OnBehalf_W1 |    0 | Official        | 09:00 | 10:00 |         | true   | Saved Successfully |

      @SA_OnBehalf_45
  Scenario: SA_OnBehalf - Attendance Correction - Group Wise Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OnBehalf_U2 |
      | OnBehalf_U3 |
      | OnBehalf_U4 |
      | OnBehalf_U5 |
    And Delete Worker via API
      | WorkerID    |
      | OnBehalf_W2 |
      | OnBehalf_W3 |
      | OnBehalf_W4 |
      | OnBehalf_W5 |
    And Delete System Account User "OnBehalf2" from System Accounts page
    And Delete Role and Right "OnBehalf2" from Roles and Rights Configuration page
    And Delete Enterprise group from Enterprise module
      | Group        | Name      | Validation           |
      | Organization | OnBehalf1 | Deleted Successfully |
     And Create Enterprise group from Enterprise module
      | Group        | Name      | Code  | Validation         |
      | Organization | OnBehalf1 | OBLF1 | Saved Successfully |
    And Create Contractor from CWM module
      | Id         | name        | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1     | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | OnBehalfC2 | OnBehalfC2 |              20 | OnBehalf2      |         788882 | OnBehalf2@cwm.com |      1200 | lic1        | True          | True             | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | CopyRightAsPer       | Validation         |
      | OnBehalf2 | System Administrator | Saved Successfully |
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module              | Menu                  | View | Add | Edit | Delete | Auto Approve | Validation         |
      | OnBehalf2 | Time and Attendance | Attendance Correction | true |     | true |        | False        | Saved Successfully |
    And Create New System Account User
      | SAUser    | Role      | APIAccess | ValidationMessage  |
      | OnBehalf2 | OnBehalf2 | True      | Saved Successfully |
    And Assign "Group Wise" rights to system account "OnBehalf2"
      | Group        | GroupName | Validation         |
      | Organization | OnBehalf1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | Organization_code |
      | OnBehalf_U2 | OnBehalf_U2 |               1 |         1 |               1 |                  1 | OBLF1             |
      | OnBehalf_U3 | OnBehalf_U3 |               1 |         1 |               1 |                  1 | OBLF1             |
      | OnBehalf_U4 | OnBehalf_U4 |               1 |         1 |               1 |                  1 |                   |
      | OnBehalf_U5 | OnBehalf_U5 |               1 |         1 |               1 |                  1 |                   |
    And Create Worker from CWM module
      | WorkerId    | name        | Active | SkillName | ContractorName | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Organization | Validation         |
      | OnBehalf_W2 | OnBehalf_W2 | True   | Skill-1   | OnBehalfC2     | True      | True      | True               | True      | OnBehalf1    | Saved Successfully |
      | OnBehalf_W3 | OnBehalf_W3 | True   | Skill-1   | OnBehalfC2     | True      | True      | True               | True      | OnBehalf1    | Saved Successfully |
      | OnBehalf_W4 | OnBehalf_W4 | True   | Skill-1   | OnBehalfC2     | True      | True      | True               | True      |              | Saved Successfully |
      | OnBehalf_W5 | OnBehalf_W5 | True   | Skill-1   | OnBehalfC2     | True      | True      | True               | True      |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U2 |
      | OnBehalf_U3 |
      | OnBehalf_U4 |
      | OnBehalf_U5 |
      | OnBehalf_W2 |
      | OnBehalf_W3 |
      | OnBehalf_W4 |
      | OnBehalf_W5 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OnBehalf_U2 |
      | OnBehalf_U3 |
      | OnBehalf_U4 |
      | OnBehalf_U5 |
      | OnBehalf_W2 |
      | OnBehalf_W3 |
      | OnBehalf_W4 |
      | OnBehalf_W5 |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | OnBehalf2 | admin       | admin           | LOGIN      |
    And Login with user
      | username  | password | Validation        |
      | OnBehalf2 | admin    | Welcome OnBehalf2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift            | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | OnBehalf_U2 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_U3 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_U4 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_U5 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W2 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W3 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W4 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | OnBehalf_W5 |              0 | GS-General Shift | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
    And Logout from Cosec Web
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Attendance Correction from SA Date From= "0" To= "0"
      | UserID      | AttendanceDate | Approve | Reject | Validation         |
      | OnBehalf_U2 |              0 | true    |        | Saved Successfully |
      | OnBehalf_U3 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W2 |              0 | true    |        | Saved Successfully |
      | OnBehalf_W3 |              0 | true    |        | Saved Successfully |
  
  