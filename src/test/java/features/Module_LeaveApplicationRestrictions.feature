@LeaveManagementModule
Feature: Leave Application Restrictions
  I want to use this template for my feature file

  @LMCase1
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Minimum Days Before Leave Start Date'= 2, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GJ      | GJ        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                  2 |              |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GJ" with Pro-rata "False"
      | LeaveID |
      | GJ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GJ         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GJ         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GJ         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                                 |
      |        1 |      1 | GJ - GJ | GJ application allowed only 2 days before leave start date |
      |        2 |      2 | GJ - GJ | No more absent records exist                               |

  @LMCase2
  Scenario: Leave Application Restrictions for 'Application Allowed After Leave'= true, 'Maximum Days After Leave End Date'= 2, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GK      | GK        | Paid Leave |           0.0 |        99.0 | Single App     | false      |                    | true         |                  2 |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GK" with Pro-rata "False"
      | LeaveID |
      | GK      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GK         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GK         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GK         |      0 |    -1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                                |
      |       -3 |     -3 | GK - GK | GK application allowed within 2 days after leave end date |
      |       -2 |     -2 | GK - GK | No more absent records exist                              |
      |       -1 |     -1 | GK - GK | No more absent records exist                              |

  @LMCase3
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=true, 'Application Allowed After Leave'= true, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GL      | GL        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GL" with Pro-rata "False"
      | LeaveID |
      | GL      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GL         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GL         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GL         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GL         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                   |
      |       -1 |     -1 | GL - GL | No more absent records exist |
      |       -2 |     -2 | GL - GL | No more absent records exist |
      |        1 |      1 | GL - GL | No more absent records exist |
      |        2 |      2 | GL - GL | No more absent records exist |

  @LMCase4
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=false, 'Application Allowed After Leave'= true, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GM      | GM        | Paid Leave |           0.0 |        99.0 | Single App     | false      |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GM" with Pro-rata "False"
      | LeaveID |
      | GM      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GM         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GM         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GM         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                           |
      |        1 |      1 | GM - GM | Prior application for GM not allowed |

  @LMCase5
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Application Allowed After Leave'= false, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GN      | GN        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                    | false        |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GN" with Pro-rata "False"
      | LeaveID |
      | GN      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GN         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GN         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GN         |      0 |    -1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                            |
      |       -1 |     -1 | GN - GN | Application for GN post leave duration is not allowed |

  @LMCase6
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Days, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | GO      | GO        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Days   |               2 | Saved Successfully |
    And Create Leave Group "GO" with Pro-rata "False"
      | LeaveID |
      | GO      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |           0 |                  | GO         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GO         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GO         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |        1 |      1 | GO - GO | This Leave is not allowed for Restricted Period |
      |        2 |      2 | GO - GO | No more absent records exist                    |

  @LMCase7
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Month, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | GP      | GP        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Month  |               1 | Saved Successfully |
    And Create Leave Group "GP" with Pro-rata "False"
      | LeaveID |
      | GP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -15 |                  | GP         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GP         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GP         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |       10 |     10 | GP - GP | This Leave is not allowed for Restricted Period |
      |       16 |     16 | GP - GP | No more absent records exist                    |

  @LMCase8
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict till Confirmation Date, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                         | ResPrd | ResPrdDay/Month | Validation         |
      | GS      | GS        | Paid Leave |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict till Confirmation Date |        |                 | Saved Successfully |
    And Create Leave Group "GS" with Pro-rata "False"
      | LeaveID |
      | GS      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -35 |                0 | GS         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GS         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GS         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    6 |          |                | GS         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |       -1 |     -1 | GS - GS | This Leave is not allowed for Restricted Period |
      |        0 |      0 | GS - GS | No more absent records exist                    |
      |        1 |      1 | GS - GS | No more absent records exist                    |

  @LMCase9
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Minimum Days Before Leave Start Date'= 2, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GQ      | GQ        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | true       |                  2 |              |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GQ" with Pro-rata "False"
      | LeaveID |
      | GQ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GQ         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                                 |
      |        1 |      1 | GQ - GQ |       0 | 08:00         | sick   | GQ application allowed only 2 days before leave start date |
      |        2 |      2 | GQ - GQ |       0 | 08:00         | sick   | No more absent records exist                               |

  @LMCase10
  Scenario: Leave Application Restrictions for 'Application Allowed After Leave'= true, 'Maximum Days After Leave End Date'= 2, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GR      | GR        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false      |                    | true         |                  2 |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GR" with Pro-rata "False"
      | LeaveID |
      | GR      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GR         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "-4"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                                |
      |       -3 |     -3 | GR - GR |      -4 | 08:00         | sick   | GR application allowed within 2 days after leave end date |
      |       -2 |     -2 | GR - GR |      -4 | 08:00         | sick   | No more absent records exist                              |
      |       -1 |     -1 | GR - GR |      -4 | 08:00         | sick   | No more absent records exist                              |
 
  @LMCase11
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=true, 'Application Allowed After Leave'= true, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GT      | GT        | Compensatory Off |           0.0 |        99.0 | Single App     | true       |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GT" with Pro-rata "False"
      | LeaveID |
      | GT      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GT         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "-4"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "-3"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |       -1 |      1 | GT - GT |      -4 | 08:00         | sick   | No more absent records exist |
      |       -2 |      2 | GT - GT |      -4 | 08:00         | sick   | No more absent records exist |
      |        1 |      1 | GT - GT |      -3 | 08:00         | sick   | No more absent records exist |
      |        2 |      2 | GT - GT |      -3 | 08:00         | sick   | No more absent records exist |

  @LMCase12
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=false, 'Application Allowed After Leave'= true, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GU      | GU        | Compensatory Off |           0.0 |        99.0 | Single App     | false      |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GU" with Pro-rata "False"
      | LeaveID |
      | GU      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GU         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                           |
      |        1 |      1 | GU - GU |       0 | 08:00         | sick   | Prior application for GU not allowed |

  @LMCase13
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Application Allowed After Leave'= false, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GV      | GV        | Compensatory Off |           0.0 |        99.0 | Single App     | true       |                    | false        |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GV" with Pro-rata "False"
      | LeaveID |
      | GV      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GV         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                            |
      |       -1 |     -1 | GV - GV |       0 | 08:00         | sick   | Application for GV post leave duration is not allowed |

  @LMCase14
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Days, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | GW      | GW        | Compensatory Off |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Days   |               2 | Saved Successfully |
    And Create Leave Group "GW" with Pro-rata "False"
      | LeaveID |
      | GW      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |           0 |                  | GW         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                      |
      |        1 |      1 | GW - GW |       0 | 08:00         | sick   | This Leave is not allowed for Restricted Period |
      |        2 |      2 | GW - GW |       0 | 08:00         | sick   | No more absent records exist                    |

  @LMCase15
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Month, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | GX      | GX        | Compensatory Off |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Month  |               1 | Saved Successfully |
    And Create Leave Group "GX" with Pro-rata "False"
      | LeaveID |
      | GX      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -15 |                  | GX         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                      |
      |       10 |     10 | GX - GX |       0 | 08:00         | sick   | This Leave is not allowed for Restricted Period |
      |       16 |     16 | GX - GX |       0 | 08:00         | sick   | No more absent records exist                    |

  @LMCase16
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict till Confirmation Date, Leave Type= Compensatory Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                         | ResPrd | ResPrdDay/Month | Validation         |
      | GY      | GY        | Compensatory Off |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict till Confirmation Date |        |                 | Saved Successfully |
    And Create Leave Group "GY" with Pro-rata "False"
      | LeaveID |
      | GY      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -15 |                0 | GY         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "-2"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                      |
      |       -1 |     -1 | GY - GY |      -2 | 08:00         | sick   | This Leave is not allowed for Restricted Period |
      |        0 |      0 | GY - GY |      -2 | 08:00         | sick   | No more absent records exist                    |
      |        1 |      1 | GY - GY |      -2 | 08:00         | sick   | No more absent records exist                    |

  @LMCase17
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Minimum Days Before Leave Start Date'= 2, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |    1 | RHLvAppRes1           |
      |    2 | RHLvAppRes2           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | GZ      | GZ        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                  2 |              |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "GZ" with Pro-rata "False"
      | LeaveID |
      | GZ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | GZ         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | GZ         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | GZ         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                                 |
      |        1 |      1 | GZ - GZ | GZ application allowed only 2 days before leave start date |
      |        2 |      2 | GZ - GZ | No more absent records exist                               |

  @LMCase18
  Scenario: Leave Application Restrictions for 'Application Allowed After Leave'= true, 'Maximum Days After Leave End Date'= 2, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |   -1 | RHLvAppRes1           |
      |   -2 | RHLvAppRes2           |
      |   -3 | RHLvAppRes3           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HA      | HA        | Restricted Holiday |           0.0 |        99.0 | Single App     | false      |                    | true         |                  2 |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HA" with Pro-rata "False"
      | LeaveID |
      | HA      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HA         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HA         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HA         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                                |
      |       -3 |     -3 | HA - HA | HA application allowed within 2 days after leave end date |
      |       -2 |     -2 | HA - HA | No more absent records exist                              |
      |       -1 |     -1 | HA - HA | No more absent records exist                              |

  @LMCase19
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=true, 'Application Allowed After Leave'= true, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |   -1 | RHLvAppRes1           |
      |   -2 | RHLvAppRes2           |
      |    1 | RHLvAppRes01          |
      |    2 | RHLvAppRes02          |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HB      | HB        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HB" with Pro-rata "False"
      | LeaveID |
      | HB      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HB         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HB         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HB         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HB         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                   |
      |       -1 |     -1 | HB - HB | No more absent records exist |
      |       -2 |     -2 | HB - HB | No more absent records exist |
      |        1 |      1 | HB - HB | No more absent records exist |
      |        2 |      2 | HB - HB | No more absent records exist |

  @LMCase20
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=false, 'Application Allowed After Leave'= true, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |    1 | RHLvAppRes1           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HC      | HC        | Restricted Holiday |           0.0 |        99.0 | Single App     | false      |                    | true         |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HC" with Pro-rata "False"
      | LeaveID |
      | HC      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HC         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HC         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HC         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                           |
      |        1 |      1 | HC - HC | Prior application for HC not allowed |

  @LMCase21
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Application Allowed After Leave'= false, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |   -1 | RHLvAppRes1           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HD      | HD        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                    | false        |                    |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HD" with Pro-rata "False"
      | LeaveID |
      | HD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HD         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HD         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HD         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                            |
      |       -1 |     -1 | HD - HD | Application for HD post leave duration is not allowed |

  @LMCase22
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Days, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |    1 | RHLvAppRes1           |
      |    2 | RHLvAppRes2           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | HE      | HE        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Days   |               2 | Saved Successfully |
    And Create Leave Group "HE" with Pro-rata "False"
      | LeaveID |
      | HE      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |           0 |                  | HE         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HE         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HE         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |        1 |      1 | HE - HE | This Leave is not allowed for Restricted Period |
      |        2 |      2 | HE - HE | No more absent records exist                    |

  @LMCase23
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Month, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |        0 |      0 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |   10 | RHLvAppResTest1       |
      |   16 | RHLvAppResTest2       |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | HF      | HF        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict w.r.t Joining Date | Month  |               1 | Saved Successfully |
    And Create Leave Group "HF" with Pro-rata "False"
      | LeaveID |
      | HF      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -15 |                  | HF         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HF         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HF         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |       10 |     10 | HF - HF | This Leave is not allowed for Restricted Period |
      |       16 |     16 | HF - HF | No more absent records exist                    |

  @LMCase24
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict till Confirmation Date, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvAppRes1 |
    And Create Holiday Schedule "LM_HSLvAppRes1"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |       -2 |     -2 | LvAppResTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvAppRes1"
      | Date | RestrictedHolidayName |
      |   -1 | RHLvAppRes1           |
      |    0 | RHLvAppRes2           |
      |    1 | RHLvAppRes3           |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AppAlwB4Lv | MinDaysB4LvStartDt | AppAlwAftrLv | MaxDaysAftrLvEndDt | ResAppWthnSpecPrd | ResType                         | ResPrd | ResPrdDay/Month | Validation         |
      | HG      | HG        | Restricted Holiday |           0.0 |        99.0 | Single App     | true       |                    | true         |                    | true              | Restrict till Confirmation Date |        |                 | Saved Successfully |
    And Create Leave Group "HG" with Pro-rata "False"
      | LeaveID |
      | HG      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -35 |                0 | HG         | True      | True      | AZ            | LM_HSLvAppRes1  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HG         |      0 |    -1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HG         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | HG         |      0 |     1 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave   | Validation                                      |
      |       -1 |     -1 | HG - HG | This Leave is not allowed for Restricted Period |
      |        0 |      0 | HG - HG | No more absent records exist                    |
      |        1 |      1 | HG - HG | No more absent records exist                    |

  @LMCase25
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Minimum Duration Before Leave Start Date'= Days, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HH      | HH        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       | Days              |                     2 |                      |              |                   |                       |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HH" with Pro-rata "False"
      | LeaveID |
      | HH      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HH         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HH         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HH         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                                 |
      | Hourly         |       1 |        1 |      1 | 09:00    | 18:00  | HH - HH | HH application allowed only 2 days before leave start date |
      | Hourly         |       2 |        2 |      2 | 09:00    | 18:00  | HH - HH | No more absent records exist                               |

  @LMCase26
  Scenario: Leave Application Restrictions for 'Application Allowed After Leave'= true, 'Maximum Duration After Leave End Date'= Days, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HI      | HI        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | false      |                   |                       |                      | true         | Days              |                     2 |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HI" with Pro-rata "False"
      | LeaveID |
      | HI      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HI         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HI         |      0 |    -1 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HI         |      0 |     0 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                                |
      | Hourly         |      -3 |       -3 |     -3 | 09:00    | 18:00  | HI - HI | HI application allowed within 2 days after leave end date |
      | Hourly         |      -2 |       -2 |     -2 | 09:00    | 18:00  | HI - HI | No more absent records exist                              |
      | Hourly         |      -1 |       -1 |     -1 | 09:00    | 18:00  | HI - HI | No more absent records exist                              |

  @LMCase27
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Minimum Duration Before Leave Start Date'= Hours, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HL      | HL        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       | Hours             |                       | 004:00               |              |                   |                       |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HL" with Pro-rata "False"
      | LeaveID |
      | HL      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HL         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HL         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HL         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                                      |
      | Hourly         |       0 |        0 |      0 |        3 |      8 | HL - HL | HL application allowed only 04 hour(s) and 00 minute(s) befo... |
      | Hourly         |       0 |        0 |      0 |        4 |      8 | HL - HL | No more absent records exist                                    |
  
  @LMCase28
  Scenario: Leave Application Restrictions for 'Application Allowed After Leave'= true, 'Maximum Duration After Leave End Date'= Hours, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HM      | HM        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | false      |                   |                       |                      | true         | Hours             |                       | 004:00               |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HM" with Pro-rata "False"
      | LeaveID |
      | HM      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HM         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HM         |      0 |    -1 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HM         |      0 |     0 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                                      |
      | Hourly         |       0 |        0 |      0 |       -8 |     -5 | HM - HM | HM application allowed within 04 hour(s) and 00 minute(s) af... |
      | Hourly         |       0 |        0 |      0 |       -4 |      0 | HM - HM | No more absent records exist                                    |

  @LMCase29
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=true, 'Application Allowed After Leave'= true, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HJ      | HJ        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       |                   |                       |                      | true         |                   |                       |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HJ" with Pro-rata "False"
      | LeaveID |
      | HJ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HJ         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HJ         |      0 |    -1 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HJ         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HJ         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                   |
      | Hourly         |      -1 |       -1 |     -1 | 09:00    | 18:00  | HJ - HJ | No more absent records exist |
      | Hourly         |      -2 |       -2 |     -2 | 09:00    | 18:00  | HJ - HJ | No more absent records exist |
      | Hourly         |       1 |        1 |      1 | 09:00    | 18:00  | HJ - HJ | No more absent records exist |
      | Hourly         |       2 |        2 |      2 | 09:00    | 18:00  | HJ - HJ | No more absent records exist |

       @LMCase30
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'=false, 'Application Allowed After Leave'= true, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HK      | HK        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | false      |                   |                       |                      | true         |                   |                       |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HK" with Pro-rata "False"
      | LeaveID |
      | HK      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HK         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HK         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HK         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                           |
      | Hourly         |       1 |        1 |      1 | 09:00    | 18:00  | HK - HK | Prior application for HK not allowed |
 
 
 @LMCase31
  Scenario: Leave Application Restrictions for 'Application Allowed Before Leave'= true, 'Application Allowed After Leave'= false, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType | ResPrd | ResPrdDay/Month | Validation         |
      | HN      | HN        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       |                   |                       |                      | false        |                   |                       |                      |                   |         |        |                 | Saved Successfully |
    And Create Leave Group "HN" with Pro-rata "False"
      | LeaveID |
      | HN      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | HN         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HN         |      0 |    -1 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HN         |      0 |     0 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                            |
      | Hourly         |      -1 |       -1 |     -1 | 09:00    | 18:00  | HN - HN | Application for HN post leave duration is not allowed |
 
      @LMCase32
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Days, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | HO      | HO        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       |                   |                       |                      | true         |                   |                       |                      | true              | Restrict w.r.t Joining Date | Days   |               2 | Saved Successfully |
    And Create Leave Group "HO" with Pro-rata "False"
      | LeaveID |
      | HO      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |           0 |                  | HO         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HO         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HO         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                      |
      | Hourly         |       1 |        1 |      1 | 09:00    | 18:00  | HO - HO | This Leave is not allowed for Restricted Period |
      | Hourly         |       2 |        2 |      2 | 09:00    | 18:00  | HO - HO | No more absent records exist                    |
    
    
     @LMCase33
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict w.r.t Joining Date, 'Restriction Period'= Month, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType                     | ResPrd | ResPrdDay/Month | Validation         |
      | HP      | HP        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       |                   |                       |                      | true         |                   |                       |                      | true              | Restrict w.r.t Joining Date | Month  |               1 | Saved Successfully |
    And Create Leave Group "HP" with Pro-rata "False"
      | LeaveID |
      | HP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -15 |                  | HP         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HP         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HP         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                      |
      | Hourly         |      10 |       10 |     10 | 09:00    | 18:00  | HP - HP | This Leave is not allowed for Restricted Period |
      | Hourly         |      16 |       16 |     16 | 09:00    | 18:00  | HP - HP | No more absent records exist                    |
  
  @LMCase34
  Scenario: Leave Application Restrictions for 'Restriction Type'= Restrict till Confirmation Date, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete "AZ" shift schedule
    And Delete "AZ" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | AZ      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "AZ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AZ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AZ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AppAlwB4Lv | MinDurB4LvStartDt | MinDurB4LvStartDtDays | MinDurB4LvStartDtHrs | AppAlwAftrLv | MaxDurAftrLvEndDt | MaxDurAftrLvEndDtDays | MaxDurAftrLvEndDtHrs | ResAppWthnSpecPrd | ResType                         | ResPrd | ResPrdDay/Month | Validation         |
      | HQ      | HQ        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true       |                   |                       |                      | true         |                   |                       |                      | true              | Restrict till Confirmation Date |        |                 | Saved Successfully |
    And Create Leave Group "HQ" with Pro-rata "False"
      | LeaveID |
      | HQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ConfirmationDate | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |         -35 |                0 | HQ         | True      | True      | AZ            | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HQ         |      0 |    -1 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HQ         |      0 |     0 |    0 |          | credit | 020:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | HQ         |      0 |     1 |    0 |          | credit | 020:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave   | Validation                                      |
      | Hourly         |      -1 |       -1 |     -1 | 09:00    | 18:00  | HQ - HQ | This Leave is not allowed for Restricted Period |
      | Hourly         |       0 |        0 |      0 | 09:00    | 18:00  | HQ - HQ | No more absent records exist                    |
      | Hourly         |       1 |        1 |      1 | 09:00    | 18:00  | HQ - HQ | No more absent records exist                    |
   