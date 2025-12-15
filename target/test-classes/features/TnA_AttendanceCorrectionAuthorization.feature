@T&A
Feature: Attendance Correction Authorization
  I want to use this template for my feature file

  @TA_AtdCorrectionAuth1
  Scenario: Attendance Correction Application for 4 Punch User - incharge= System Admin, status= pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | ACA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason   | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | BreakStartTime | BreakEndTime | Validation         |
      |             -1 | AC-AC | Normal | Personal | 09:00       | 13:00       | 14:00       | 18:00       |                |              | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth2
  Scenario: Attendance Correction Application for 4 Punch User - incharge= RIC, status= pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth3
  Scenario: Attendance Correction Application for N-Punch User - incharge= System Admin, status= pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:00   |
      |            | add    | 13:00   |
      |            | add    | 14:00   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth4
  Scenario: Attendance Correction Application for N-Punch User - incharge= RIC, status= pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:00   |
      |            | add    | 13:00   |
      |            | add    | 14:00   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth5
  Scenario: Attendance Correction Authorization of 4 Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | validation         |
      | ACA_AtdPlc1 |                4 | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1300 |            1400 |            1800 | AC    | ACA_Ur1   |
    And Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |

  @TA_AtdCorrectionAuth6
  Scenario: Attendance Correction Authorization of 4 Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1300 |            1400 |            1800 | AC    | ACA_Ur1   |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    And Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    And Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth7
  Scenario: Attendance Correction Authorization of 4 Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1300 |            1400 |            1800 | AC    | ACA_Ur1   |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth8
  Scenario: Attendance Correction Authorization of 4 Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1300 |            1400 |            1800 | AC    | ACA_Ur1   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth9
  Scenario: Attendance Correction Authorization of N-Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | punch5-datetime | punch6-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1100 |            1300 |            1400 |            1600 |            1800 | AC    | ACA_Ur1   |
    When Approve Reject Attendance Correction from SA Date From= "-1" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-1" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth10
  Scenario: Attendance Correction Authorization for N-Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | punch5-datetime | punch6-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1100 |            1300 |            1400 |            1600 |            1800 | AC    | ACA_Ur1   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth11
  Scenario: Attendance Correction Authorization of N-Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | punch5-datetime | punch6-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1100 |            1300 |            1400 |            1600 |            1800 | AC    | ACA_Ur1   |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth12
  Scenario: Attendance Correction Authorization for N-Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          |                 |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid  | process-date | punch1-datetime | punch2-datetime | punch3-datetime | punch4-datetime | punch5-datetime | punch6-datetime | Shift | appliedBy |
      | ACA_Ur1 |           -1 |            0900 |            1100 |            1300 |            1400 |            1600 |            1800 | AC    | ACA_Ur1   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          |          | AB       | AB       |

  @TA_AtdCorrectionAuth13
  Scenario: Attendance Correction Application and Authorization for first punch missing of 4 Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth14
  Scenario: Attendance Correction Application and Authorization for first punch missing of 4 Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth15
  Scenario: Attendance Correction Application and Authorization for first punch missing of 4 Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    And Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |

  @TA_AtdCorrectionAuth16
  Scenario: Attendance Correction Application and Authorization for first punch missing of 4 Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | IN       |

  @TA_AtdCorrectionAuth17
  Scenario: Attendance Correction Application and Authorization for first punch missing of N-Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     141500 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     164500 |
      | ACA_Ur1 |         -1 |     170000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 13:00      | edit   | 09:00   |
      | 14:15      |        |         |
      | 14:30      |        |         |
      | 16:45      |        |         |
      | 17:00      |        |         |
      | 18:00      |        |         |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth18
  Scenario: Attendance Correction Application and Authorization for first punch missing of N-Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     163000 |
      | ACA_Ur1 |         -1 |     170000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 13:00      | edit   | 09:00   |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:30      |        |         |
      | 17:00      |        |         |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth19
  Scenario: Attendance Correction Application and Authorization for first punch missing of N-Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     163000 |
      | ACA_Ur1 |         -1 |     170000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 13:00      | edit   | 09:00   |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:30      |        |         |
      | 17:00      |        |         |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |

  @TA_AtdCorrectionAuth20
  Scenario: Attendance Correction Application and Authorization for first punch missing of N-Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     163000 |
      | ACA_Ur1 |         -1 |     170000 |
      | ACA_Ur1 |         -1 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 13:00      | edit   | 09:00   |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:30      |        |         |
      | 17:00      |        |         |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 13:00    | 18:00    | AB       | PR       |

  @TA_AtdCorrectionAuth21
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of 4 Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | ShiftSchedule | Validation         |
      | ACA_Ur1 | True   | True      |                   | True      | True      | True      | True               |                        4 | AC            | Saved Successfully |
    And Assign policy to user
      | UserID  | AttendancePlc | Validation         |
      | ACA_Ur1 | ACA_AtdPlc1   | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth22
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of 4 Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth23
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of 4 Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |

  @TA_AtdCorrectionAuth24
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of 4 Punch User - Rejected bt RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     140000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 14:00    | PR       | IN       |

  @TA_AtdCorrectionAuth25
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of N-Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     123000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     160000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      | 12:30      |        |         |
      | 13:00      |        |         |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:00      | edit   | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth26
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of N-Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     123000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     160000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      | 12:30      |        |         |
      | 13:00      |        |         |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:00      | edit   | 18:00   |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth27
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of N-Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     123000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     160000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      | 12:30      |        |         |
      | 13:00      |        |         |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:00      | edit   | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |

  @TA_AtdCorrectionAuth28
  Scenario: Attendance Correction Application and Authorization for Out Punch missing of N-Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | ACA_Ur1 |         -1 |     090000 |
      | ACA_Ur1 |         -1 |     123000 |
      | ACA_Ur1 |         -1 |     130000 |
      | ACA_Ur1 |         -1 |     143000 |
      | ACA_Ur1 |         -1 |     150000 |
      | ACA_Ur1 |         -1 |     160000 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      | 12:30      |        |         |
      | 13:00      |        |         |
      | 14:30      |        |         |
      | 15:00      |        |         |
      | 16:00      | edit   | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 16:00    | PR       | AB       |

  @TA_AtdCorrectionAuth29
  Scenario: Attendance Correction Application and Authorization for No In punch of 4 Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth30
  Scenario: Attendance Correction Application and Authorization for No In punch of 4 Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth31
  Scenario: Attendance Correction Application and Authorization for No In punch of 4 Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |

  @TA_AtdCorrectionAuth32
  Scenario: Attendance Correction Application and Authorization for No In punch of 4 Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |

  @TA_AtdCorrectionAuth33
  Scenario: Attendance Correction Application and Authorization for No In punch of N-Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth34
  Scenario: Attendance Correction Application and Authorization for No In punch of N-Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -2 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -2 |          | 18:00    | AB       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-2" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-2"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -2 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -2 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-2"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -2 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth35
  Scenario: Attendance Correction Application and Authorization for No In punch of N-Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |

  @TA_AtdCorrectionAuth36
  Scenario: Attendance Correction Application and Authorization for No In punch of N-Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     180000 |      1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      |            | add    | 09:00   |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      | 18:00      |        |         |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 |          | 18:00    | AB       | AB       |

  @TA_AtdCorrectionAuth37
  Scenario: Attendance Correction Application and Authorization for No out punch of 4 Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth38
  Scenario: Attendance Correction Application and Authorization for No out punch of 4 Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth39
  Scenario: Attendance Correction Application and Authorization for No out punch of 4 Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |

  @TA_AtdCorrectionAuth40
  Scenario: Attendance Correction Application and Authorization for No out punch of 4 Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 |                4 | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Generate Attendance Correction Application from ESS
      | AttendanceDate | Shift | Day    | Reason | Punch1-Time | Punch2-Time | Punch3-Time | Punch4-Time | Validation         |
      |             -1 | AC-AC | Normal |        | 09:00       | 13:00       | 14:00       | 18:00       | Saved Successfully |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |

  @TA_AtdCorrectionAuth41
  Scenario: Attendance Correction Application and Authorization for No out punch of N-Punch User - Approved by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Approved" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth42
  Scenario: Attendance Correction Application and Authorization for No out punch of N-Punch User - Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 | true    |        | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Approved  | ACA_Ur1 |             -1 | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Approved |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrectionAuth43
  Scenario: Attendance Correction Application and Authorization for No out punch of N-Punch User - Rejected by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | ACA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   |                | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Assign policy to user
      | UserID  | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | ACA_Ur1 | ACA_AtdPlc1   |             |             |           |             |         | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | ACA_Ur1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status  |
      | SA - System Admin | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Attendance Correction from SA Date From= "-2" To= "0"
      | UserID  | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Rejected" Attendance Correction Application from SA from= "-2" To= "0"
      | UserID  | AttendanceDate | Status   |
      | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    Then Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge          | Status   |
      | SA - System Admin | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |

  @TA_AtdCorrectionAuth44
  Scenario: Attendance Correction Application and Authorization for No out punch of N-Punch User - Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | ACA_Ur1  |
      | ACA_Ric1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName     | MaxPunchesToCons | DailyAtdAuthReq | LiEoMarkAbsentAsPer | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | ACA_AtdPlc1 | N-Punch          | false           |                     |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ACA_Ric1 | ACA_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | ACA_RGrp1        | AnyOne     | ACA_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | ACA_Ur1 | True   | ACA_RGrp1      | True      | ACA_AtdPlc1   |             |                   | AC            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | ACA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | ACA_Ur1  |                          1 | admin        |    1 |
      | ACA_Ric1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time | In-out |
      | ACA_Ur1 |         -1 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
    When Attendance Correction for N-Punch User from ESS for AtdDate= "-1" Shift= "AC-AC" Day= "Normal"
      | ActualTime | Action | NewTime |
      | 09:00      |        |         |
      |            | add    | 12:30   |
      |            | add    | 13:00   |
      |            | add    | 14:30   |
      |            | add    | 15:00   |
      |            | add    | 18:00   |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status  |
      | ACA_Ric1 - ACA_Ric1 | Pending |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | ACA_Ric1 | admin    | Welcome ACA_Ric1 |
    When Approve Reject "Attendance Correction" Application from RIC Date from= "-2" To= "0"
      | User    | AttendanceDate | Approve | Reject | Validation         |
      | ACA_Ur1 |             -1 |         | true   | Saved Successfully |
    Then Validate "Attendance Correction" Application from RIC date From= "-2" To= "0"
      | PanelName | UserID  | AttendanceDate | Status   |
      | Rejected  | ACA_Ur1 |             -1 | Rejected |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation      |
      | ACA_Ur1  | admin    | Welcome ACA_Ur1 |
    And Verify Attendance Correction Application Approval Details in ESS for AttendanceDate = "-1"
      | Incharge            | Status   |
      | ACA_Ric1 - ACA_Ric1 | Rejected |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
