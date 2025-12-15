@T&A
Feature: Advance Overtime Approval
  I want to use this template for my feature file

  @AOA_1
  Scenario: Advance Overtime Application from ESS and Approved by RIC - "Auto Authorize Overtime Component"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | AOA_Ur1  |
      | AOA_Ric1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AOA_Ric1 | AOA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AOA_RGrp1        | AnyOne     | AOA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   | AOA_RGrp1      | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | AOA_Ur1  |                          1 | admin        |    1 |
      | AOA_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    When Create Advance Overtime Application from ESS
      | AttendanceDate | OTHours | Reason   | Validation                                     |
      |              2 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status  |
      |      2 | Applied |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge            | Status  |
      | AOA_Ric1 - AOA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | AOA_Ric1 | admin    | Welcome AOA_Ric1 |
    And Approve Reject "Advance Overtime Approval" Application from RIC Date from= "0" To= "3"
      | User    | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | AOA_Ur1 |      2 | 03:00   | 03:00         | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status   |
      |      2 | Approved |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge            | Status   |
      | AOA_Ric1 - AOA_Ric1 | Approved |

  @AOA_2
  Scenario: Advance Overtime Application from ESS and Rejected by RIC "Auto Authorize Overtime Component"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | AOA_Ur1  |
      | AOA_Ric1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AOA_Ric1 | AOA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AOA_RGrp1        | AnyOne     | AOA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   | AOA_RGrp1      | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | AOA_Ur1  |                          1 | admin        |    1 |
      | AOA_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    When Create Advance Overtime Application from ESS
      | AttendanceDate | OTHours | Reason   | Validation                                     |
      |              2 | 03:00   | Overtime | OT Application has been submitted successfully |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status  |
      |      2 | Applied |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge            | Status  |
      | AOA_Ric1 - AOA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | AOA_Ric1 | admin    | Welcome AOA_Ric1 |
    And Approve Reject "Advance Overtime Approval" Application from RIC Date from= "0" To= "3"
      | User    | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | AOA_Ur1 |      2 | 03:00   | 03:00         |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status   |
      |      2 | Rejected |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge            | Status   |
      | AOA_Ric1 - AOA_Ric1 | Rejected |

  @AOA_3
  Scenario: Advance Overtime Application from ESS and Approved by System Admin - "Auto Authorize Overtime Component"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | AOA_Ur1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   |                | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | AOA_Ur1  |                          1 | admin        |    1 |
      | AOA_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    When Create Advance Overtime Application from ESS
      | AttendanceDate | OTHours | Reason   | Validation                                     |
      |              2 | 03:00   | Overtime | OT Application has been submitted successfully |
    Then Verify Advance Overtime Application status in ESS
      | OTDate | Status  |
      |      2 | Applied |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Advance Overtime Application from SA Date from= "0" To= "3"
      | User    | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | AOA_Ur1 |      2 | 03:00   | 03:00         | true    |        | Saved Successfully |
    And Verify Advance Overtime Application Approval Status from SA Date from= "0" To= "3"
      | PanelName | User    | OTDate | OTHours | Status   |
      | Approved  | AOA_Ur1 |      2 | 03:00   | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status   |
      |      2 | Approved |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @AOA_4
  Scenario: Advance Overtime Application from ESS and Rejected by System Admin - "Auto Authorize Overtime Component"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | AOA_Ur1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   |                | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | AOA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    When Create Advance Overtime Application from ESS
      | AttendanceDate | OTHours | Reason   | Validation                                     |
      |              2 | 03:00   | Overtime | OT Application has been submitted successfully |
    Then Verify Advance Overtime Application status in ESS
      | OTDate | Status  |
      |      2 | Applied |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Advance Overtime Application from SA Date from= "0" To= "3"
      | User    | OTDate | OTHours | ApprovedHours | Approve | Reject | Validation         |
      | AOA_Ur1 |      2 | 03:00   | 03:00         |         | true   | Saved Successfully |
    And Verify Advance Overtime Application Approval Status from SA Date from= "0" To= "3"
      | PanelName | User    | OTDate | OTHours | Status   |
      | Rejected  | AOA_Ur1 |      2 | 03:00   | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status   |
      |      2 | Rejected |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |

  @AOA_5
  Scenario: Advance Overtime Application Scenario for "Auto Authorize Overtime Component"= true - validate in ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | AOA_Ur1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | true            |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   |                | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | AOA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    Then Create Advance Overtime Application from ESS
      | Validation                                      |
      | Assigned rights for auto authorization overtime |

  @AOA_6
  Scenario: Advance Overtime Application from SA - "Auto Authorize Overtime Component"= false
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | AOA_Ur1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   |                | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    When Create Advance Overtime Application from SA
      | User    | AttendanceDate | OTHours | Reason   | Validation                                     |
      | AOA_Ur1 |              2 | 03:00   | Overtime | OT Application has been submitted successfully |
    Then Verify Advance Overtime Application status from SA
      | User    | OTDate | Status   |
      | AOA_Ur1 |      2 | Approved |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | AOA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | AOA_Ur1  | admin    | Welcome AOA_Ur1 |
    And Verify Advance Overtime Application status in ESS
      | OTDate | Status   |
      |      2 | Approved |
    And Validate Advance Overtime Application Approval Details in ESS for OT Date= "2"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @AOA_7
  Scenario: Advance Overtime Application Scenario for "Auto Authorize Overtime Component" = true - validate in SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | AOA_Ur1 |
    And Delete Overtime Policy from TnA module
      | Name       |
      | AOA_OTPlc1 |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AOA_OTPlc1 | OverTime Policy-1 | True      | ALL     | Daily 1    | True            |                       |            |              |               |                  |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AG      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AG"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | AOA_AtdPlc1 |                4 | Saved Successfully |
    When Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AOA_Ur1 | True   |                | True      | AOA_AtdPlc1   | AOA_OTPlc1  | Both              | AG            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID  |
      | AOA_Ur1 |
    Then Create Advance Overtime Application from SA
      | User    | Validation                                               |
      | AOA_Ur1 | User has assigned rights for auto authorization overtime |
