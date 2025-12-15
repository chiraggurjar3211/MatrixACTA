@T&A
Feature: Absentee Policy
  I want to use this template for my feature file

  @AbsenteePolicyCase1
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent checked only -  2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase2
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent checked only -  2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase3
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user 2nd half punches before WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | PlcPeriodFrom | PlcPeriodTo | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | 01/01/2009    | 31/12/2099  | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase4
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user 1st half punches after WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |

  @AbsenteePolicyCase5
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                  |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Cover Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |

  @AbsenteePolicyCase6
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase7
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only -  2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase8
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only -  2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase9
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only -    2 punch user 2nd half punches before WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase10
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user 1st half punches after WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |

  @AbsenteePolicyCase11
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase12
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before and after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @AbsenteePolicyCase13
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches before WO and 2nd half punches after WO
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark       |
      | 14/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |              |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN   |

  @AbsenteePolicyCase14
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase15
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @AbsenteePolicyCase16
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 2nd half punches before WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN             |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase17
  Scenario: Week-Off Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches after WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT           |

  @AbsenteePolicyCase18
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only -   2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase19
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only -   2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase20
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches before WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase21
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 2nd half punches after WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |

  @AbsenteePolicyCase22
  Scenario: Week-Off Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - No user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                  |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Cover Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |

  @AbsenteePolicyCase23
  Scenario: Week-Off Club/Cover Rule - All Checkboxes unchecked -  2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase24
  Scenario: Week-Off Club/Cover Rule - All Checkboxes unchecked -  2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @AbsenteePolicyCase25
  Scenario: Week-Off Club/Cover Rule - All Checkboxes unchecked -   2 punch user 2nd half punches before WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN             |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase26
  Scenario: Week-Off Club/Cover Rule - All Checkboxes unchecked -  2 punch user 1st half punches after WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 15/01/2023 | AA-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT           |

  @AbsenteePolicyCase27
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase28
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user full day punches after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase29
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user 2nd half punches before PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase30
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only -  2 punch user 1st half punches after PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |

  @AbsenteePolicyCase31
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    When Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                  |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Cover Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |

  @AbsenteePolicyCase32
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase33
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase34
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user full day punches after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase35
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only -  2 punch user 2nd half punches before PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase36
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only -   2 punch user 1st half punches after PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |

  @AbsenteePolicyCase37
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase38
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before and after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @AbsenteePolicyCase39
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches before PH and 2nd half punches after PH
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 18/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark       |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |              |
      | 18/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN   |

  @AbsenteePolicyCase40
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase41
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @AbsenteePolicyCase42
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only -  2 punch user 2nd half punches before PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN             |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase43
  Scenario: Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches after PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT           |

  @AbsenteePolicyCase44
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase45
  Scenario: Holiday Club/Cover Rule2 - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                      |

  @AbsenteePolicyCase46
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches before PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT         |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |

  @AbsenteePolicyCase47
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 2nd half punches after PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN           |

  @AbsenteePolicyCase48
  Scenario: Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - no user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                  |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Cover Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available    |

  @AbsenteePolicyCase49
  Scenario: Holiday Club/Cover Rule - All Checkboxes unchecked -  2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase50
  Scenario: Holiday Club/Cover Rule - All Checkboxes unchecked -  2 punch user full day punches after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    | 09:00   | 18:00   | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @AbsenteePolicyCase51
  Scenario: Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user 2nd half punches before PH - Status - AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    | 14:00   | 18:00   | 04:00     |           |          |            |         |         |           | AB      | PR      | AB:Late-IN             |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |

  @AbsenteePolicyCase52
  Scenario: Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user 1st half punches after PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Verify user Attendance in Attendance Summary page for userid= "AbPlc_Ur1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | AA    |         |         |           |           |          |            |         |         |           | AB      | AB      | No Punches Available   |
      | 17/01/2023 | AA-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Absent Club Rule |
      | 18/01/2023 | AA    | 09:00   | 13:00   | 04:00     |           |          |            |         |         |           | PR      | AB      | AB:Early-OUT           |

  @AbsenteePolicyCase53
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user full day punches before WO/PH - Status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase54
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user full day punches after WO/PH - Status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase55
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user 2nd half punches before WO/PH - Status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase56
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - 2 punch user 1st half punches after WO/PH - Status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |

  @AbsenteePolicyCase57
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent checked only - No USer punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    When Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                  |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available    |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Cover Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available    |

  @AbsenteePolicyCase58
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - No User punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    When Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase59
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user full day punches before WO/PH - Status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase60
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user full day punches after WO/PH - Status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase61
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user 2nd half punches before WO/PH - Status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
    And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase62
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked and Allowed On Both Sided Absent= checked only - 2 punch user 1st half punches after WO/PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | PlcPeriodFrom | PlcPeriodTo | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1 | 01/01/2009    | 31/12/2099  | true             | true             | false                     | true              | true              | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |

  @AbsenteePolicyCase63
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - No user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase64
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only -  2 punch user full day punches before and after WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |        |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |        |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |        |

  @AbsenteePolicyCase65
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user punches 1st half before WO/PH and 2nd half after WO/PH
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1400 | AA    | AbPlc_Ur1 |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark       |
      | 14/01/2023 | AA-Normal | 09:00    | 14:00    | PR       | AB       |         | AB:Early-OUT |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |              |
      | 16/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN   |

  @AbsenteePolicyCase66
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before WO/PH - Status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                        |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase67
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punch after Wo/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                        |

  @AbsenteePolicyCase68
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only - 2 punch user 2nd half punches before WO/PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN             |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase69
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - At least Full Day Absent For Club-Cover = checked only -  2 punch user 1st half punches after WO/PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | true                      | false             | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT           |#AB:Less Work Hrs

  @AbsenteePolicyCase70
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches before Wo/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | PlcPeriodFrom | PlcPeriodTo | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | 01/01/2009    | 31/12/2099  | true             | false            | true                      | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase71
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user full day punches after WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase72
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 1st half punches before WO/PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase73
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - 2 punch user 2nd half punches after WO/PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |

  @AbsenteePolicyCase74
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - Allowed On Single Sided Absent = checked, At least Full Day Absent For Club-Cover = checked only - No user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | false            | true                      | true              | false             | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    When Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                  |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available    |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Cover Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available    |

  @AbsenteePolicyCase75
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes unchecked - no user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase76
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user full day punch before WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                        |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase77
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user full day punches after WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                        |

  @AbsenteePolicyCase78
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user 2nd half punches before WO/PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN             |#AB:Less Work Hrs
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |

  @AbsenteePolicyCase79
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes unchecked - 2 punch user 1st half punches after WO/PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | PlcPeriodFrom | PlcPeriodTo | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | 01/01/2009    | 31/12/2099  | false            | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark                 |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available   |
      | 15/01/2023 | AA-WO/PH  |          |          | AB       | AB       |         | WO-AB:Absent Club Rule |
      | 16/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT           |#AB:Less Work Hrs

  @AbsenteePolicyCase80
  Scenario: Week-Off Club/Cover Rule + Holiday Club/Cover Rule - All Checkboxes checked - No user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase81
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user full day punch before WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase82
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - All Checkboxes checked 2 punch user full day punch after WO/PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase83
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user 1st half punches before WO/PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase84
  Scenario: Week-Off Club/Cover Rule and Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user 2nd half punches after WO/PH - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 15/01/2023 | 15/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | True             | True             | True                      | True              | True              | True                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO/PH  |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |#AB:Less Work Hrs

  @AbsenteePolicyCase85
  Scenario: Week-Off Club/Cover Rule - All Checkboxes checked -  no user punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            |                 | True      | True      | True      | True               |                        2 | Saved Successfully |
    When Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO     |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase86
  Scenario: Week-Off Club/Cover Rule - All Checkboxes checked - 2 punch user full day punches before WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            |                 | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 15/01/2023 | AA-WO     |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase87
  Scenario: Week-Off Club/Cover Rule - All Checkboxes checked - 2 punch user full day punches after WO - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
     And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO     |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase88
  Scenario: Week-Off Club/Cover Rule - All Checkboxes checked - 2 punch user 1st half punches before WO - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | true             | true             | true                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 14/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 14/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |
      | 15/01/2023 | AA-WO     |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase89
  Scenario: Week-Off Club/Cover Rule - All Checkboxes checked - 2 punch user 2nd half punches after WO - status- AB PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | True             | True             | True                      | false             | false             | false                      | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 14/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 15/01/2023 | AA-WO     |          |          | WO       | WO       |         |                      |
      | 16/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |

  @AbsenteePolicyCase90
  Scenario: Holiday Club/Cover Rule - All Checkboxes checked - No user punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 17/01/2023 | AA-PH     |          |          | PH       | PH       |         |                      |
      | 18/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase91
  Scenario: Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user full day punches before PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 16/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |
      | 17/01/2023 | AA-PH     |          |          | PH       | PH       |         |                      |
      | 18/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase92
  Scenario: Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user full day punches after PH - status- PR PR
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            0900 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 17/01/2023 | AA-PH     |          |          | PH       | PH       |         |                      |
      | 18/01/2023 | AA-Normal | 09:00    | 18:00    | PR       | PR       |         |                      |

  @AbsenteePolicyCase93
  Scenario: Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user 1st half punches before PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | true              | true              | true                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 16/01/2023   |            0900 |            1300 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 16/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 16/01/2023 | AA-Normal | 09:00    | 13:00    | PR       | AB       |         | AB:Early-OUT         |
      | 17/01/2023 | AA-PH     |          |          | PH       | PH       |         |                      |
      | 18/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |

  @AbsenteePolicyCase94
  Scenario: Holiday Club/Cover Rule - All Checkboxes checked - 2 punch user 2nd half punches after PH - status- PR AB
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AbPlc_Ur1   |
      | AbPlc_Ric_1 |
     And Delete "AA" shift schedule
    And Delete "AA" shift
    And Delete Holiday Schedule
      | HSName         |
      | AP_HSClbCvrRl1 |
    And Create Holiday Schedule "AP_HSClbCvrRl1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AA      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | validation         |
      | AP_AtdPlc1 |                2 | Saved Successfully |
    And Create Absentee Policy
      | PlcName | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AbPlc1  | false            | false            | false                     | True              | True              | True                       | Saved Successfully |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AbPlc_Ric_1 | AbPlc_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | AbPlc_RGrp1      | AnyOne     | AbPlc_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPolicy | Validation         |
      | AbPlc_Ur1 | True   | AbPlc_RGrp1    | True      | AP_AtdPlc1    | AbPlc1      | AA            | AP_HSClbCvrRl1  | True      | True      | True      | True               |                        2 |              | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AbPlc_Ur1   |                          1 | admin        |    1 |
      | AbPlc_Ric_1 |                          1 | admin        |    1 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | AbPlc_Ur1 | 18/01/2023   |            1400 |            1800 | AA    | AbPlc_Ur1 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | AbPlc_Ur1 |       1 | AtdCorApproved | AbPlc_Ric_1 | 18/01/2023   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID    |
      | AbPlc_Ur1 |
    Then Daily Attendance View for userid "AbPlc_Ur1" and period "Month" on "January" and "2023"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Remark               |
      | 16/01/2023 | AA-Normal |          |          | AB       | AB       |         | No Punches Available |
      | 17/01/2023 | AA-PH     |          |          | PH       | PH       |         |                      |
      | 18/01/2023 | AA-Normal | 14:00    | 18:00    | AB       | PR       |         | AB:Late-IN           |
