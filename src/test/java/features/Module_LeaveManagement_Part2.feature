@LeaveManagement
Feature: Leave Management Part2
  I want to use this template for my feature file

  #################################Leave Balance Starts########################
  @LMPart2_1
  Scenario: Leave Balance Scenario
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
    And Create Leave
      | LeaveID | LeaveName   | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | CarryFrdToNxtYr | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | AY      | LM_AY_LvBal | Paid Leave |           0.0 |        99.0 | Single App     | true            | true     | true          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvBal" with Pro-rata "False"
      | LeaveID |
      | AY      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup        | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LvBal | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | AY         |      1 |       |   -1 |          | credit |       |
    And Run Leave Balance Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AY         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | AY         |      0 |     0 |    0 |          | credit |       |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AY         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark     | hours |
      | LMUr1  |          1 |           0 |                 |                 |    1 |          |                | AY         |      0 |     0 |    0 |          | debit      |       |
      | LMUr1  |          2 |           0 |                 |                 |    2 |          |                | AY         |      0 |     0 |    0 |          | encashment |       |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName   | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_AY_LvBal | Monthly |     0 |    0 |    5.00 |   1.00 |  1.00 |       2.00 |    1.00 |    1.00 |     1.00 |

  #################################Leave Balance End########################
  #################################Leave Register Starts########################
  @LMPart2_2
  Scenario: Leave Register for period= Monthly
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 | January | 2024 |          | credit |       |
    When Export "Monthly" Leave Register from Leave Register page
      | FMonth  | FYear | TMonth  | TYear | FileName    | SelectUsers | UserIDs |
      | January |  2024 | January |  2024 | LMLeaveRegi | User Wise   | LMUr1   |
    Then Validate exported file from UI selection.
      | FileName    | FileFormat | Compare  |
      | LMLeaveRegi | XLS        | Compared |

  @LMPart2_3
  Scenario: Leave Register for Period= Yearly
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMUr1 | LMUr1 |               1 |         1 |               1 |                  1 |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup            | WeekOffGroup | Validation         |
      | LMUr1  |                |                | LM_LeaveGrp_PaidLeave |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      1 |       | 2024 |          | credit |       |
    When Export "Yearly" Leave Register from Leave Register page
      | Year | FileName     | SelectUsers | UserIDs |
      | 2024 | LMLeaveRegiY | User Wise   | LMUr1   |
    Then Validate exported file from UI selection.
      | FileName     | FileFormat | Compare  |
      | LMLeaveRegiY | XLS        | Compared |

  #################################Leave Register End########################
  #################################Import Leave Balance Starts########################
  @LMPart2_4
  Scenario Outline: Import Leave Balance scenario
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
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | AZ      | LM_AZ_PLImpLvBal | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLImpLvBal" with Pro-rata "False"
      | LeaveID |
      | AZ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PLImpLvBal | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |                | LM_LeaveGrp_PLImpLvBal | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |                | LM_LeaveGrp_PLImpLvBal | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Import Data "Leave Balance"
      | UserID | Leave ID | Month | Year | Leave Credit | Leave Debit | Leave Encash | Period |
      | LMUr1  | AZ       |       | 2024 |            5 |           2 |            2 |      1 |
      | LMUr2  | AZ       |       | 2024 |            6 |           2 |            2 |      1 |
      | LMUr3  | AZ       |       | 2024 |            7 |           2 |            2 |      1 |
    Then Import "<File Format>" and check Imported Data for "Leave Balance"
      | UserID | Result  |
      | LMUr1  | Success |
      | LMUr2  | Success |
      | LMUr3  | Success |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_AZ_PLImpLvBal | Yearly |       |    2024 |    0.00 |   5.00 |  2.00 |       2.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_AZ_PLImpLvBal | Yearly |       |   2024 |    0.00 |   6.00 |  2.00 |       2.00 |    0.00 |    2.00 |     0.00 |
      | LMUr3  | LM_AZ_PLImpLvBal | Yearly |       |    2024 |    0.00 |   7.00 |  2.00 |       2.00 |    0.00 |    3.00 |     0.00 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  #################################Import Leave Balance End########################
  #################################Leave Club Rule Starts########################
  @LMPart2_5
  Scenario: Leave Club Rule Scenario for Allowed With All Other Leaves = enable
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
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvClbRul1 |
    And Create Holiday Schedule "LM_HSLvClbRul1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 16/01/2024 | 16/01/2024 | TestDay     | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvClbRul1"
      | Date       | RestrictedHolidayName |
      | 17/01/2024 | RHLvClbRulTest1       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AlwWithOthrLv | Validation         |
      | BA      | LM_BA_LvClbRl | Restricted Holiday |           0.0 |        99.0 | Single App     |               | Saved Successfully |
      | BB      | LM_BB_LvClbRl | Unpaid             |           0.0 |        99.0 | Single App     |               | Saved Successfully |
      | BC      | LM_BC_LvClbRl | Lay off            |           0.0 |        99.0 | Single App     |               | Saved Successfully |
      | BD      | LM_BD_LvClbRl | Paid Leave         |           0.0 |        99.0 | Single App     | true          | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvClbRul1" with Pro-rata "False"
      | LeaveID |
      | BA      |
      | BB      |
      | BC      |
      | BD      |
    And Create user from user configuration
      | userid | Active | LeaveGroup            | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvClbRul1 | True      | True      | LM_HSLvClbRul1  | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BA         |      0 | January | 2024 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |   10 |          |                | BD         |      0 | January | 2024 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate   | ToDate     | Leave              | Validation                   |
      | 17/01/2024 | 17/01/2024 | BA - LM_BA_LvClbRl | No more absent records exist |
      | 18/01/2024 | 18/01/2024 | BD - LM_BD_LvClbRl | No more absent records exist |
      | 20/01/2024 | 20/01/2024 | BB - LM_BB_LvClbRl | No more absent records exist |
      | 21/01/2024 | 21/01/2024 | BD - LM_BD_LvClbRl | No more absent records exist |
      | 23/01/2024 | 23/01/2024 | BC - LM_BC_LvClbRl | No more absent records exist |
      | 24/01/2024 | 24/01/2024 | BD - LM_BD_LvClbRl | No more absent records exist |

  @LMPart2_6
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Paid Leave and Lay off
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
    And Create Leave
      | LeaveID | LeaveName     | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | BE      | LM_BE_LvClbRl | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
      | BF      | LM_BF_LvClbRl | Lay off    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BF"
      | LeaveName     | Enable |
      | LM_BE_LvClbRl | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl2" with Pro-rata "False"
      | LeaveID |
      | BE      |
      | BF      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LvClbRl2 | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BE         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BE         |      0 |    -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                               |
      |       -1 |     -1 | BE - LM_BE_LvClbRl | No more absent records exist             |
      |        0 |      0 | BF - LM_BF_LvClbRl | This Leave should not be clubbed with BE |

  @LMPart2_7
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Lay off and Unpaid
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
    And Create Leave
      | LeaveID | LeaveName     | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | BG      | LM_BG_LvClbRl | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
      | BH      | LM_BH_LvClbRl | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BH"
      | LeaveName     | Enable |
      | LM_BG_LvClbRl | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl3" with Pro-rata "False"
      | LeaveID |
      | BG      |
      | BH      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LvClbRl3 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                               |
      |       -1 |     -1 | BG - LM_BG_LvClbRl | No more absent records exist             |
      |        0 |      0 | BH - LM_BH_LvClbRl | This Leave should not be clubbed with BG |

  @LMPart2_8
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Unpaid and Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName     | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | BI      | LM_BI_LvClbRl | Unpaid     |           0.0 |        99.0 | Single App     | Saved Successfully |
      | BJ      | LM_BJ_LvClbRl | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BJ"
      | LeaveName     | Enable |
      | LM_BI_LvClbRl | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl4" with Pro-rata "False"
      | LeaveID |
      | BI      |
      | BJ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LvClbRl4 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BJ         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BJ         |      0 |    -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                               |
      |       -1 |     -1 | BI - LM_BI_LvClbRl | No more absent records exist             |
      |        0 |      0 | BJ - LM_BJ_LvClbRl | This Leave should not be clubbed with BI |

  @LMPart2_9
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Restricted Holiday and Paid Leave
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
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSlvClbRul2 |
    And Create Holiday Schedule "LM_HSlvClbRul2"
      | FromDate | ToDate | HolidayName   | DeviceSynced |
      |       -1 |     -1 | LvClbRulTest2 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSlvClbRul2"
      | Date | RestrictedHolidayName |
      |    0 | RHLvClbRulTest2       |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | BK      | LM_BK_LvClbRul | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
      | BL      | LM_BL_LvClbRul | Paid Leave         |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BL"
      | LeaveName      | Enable |
      | LM_BK_LvClbRul | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl5" with Pro-rata "False"
      | LeaveID |
      | BK      |
      | BL      |
    And Create user from user configuration
      | userid | Active | LeaveGroup           | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvClbRl5 | True      | True      | LM_HSlvClbRul2  | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BK         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BL         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BK         |      0 |     1 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | BL         |      0 |     1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave               | Validation                               |
      |        0 |      0 | BK - LM_BK_LvClbRul | No more absent records exist             |
      |        1 |      1 | BL - LM_BL_LvClbRul | This Leave should not be clubbed with BK |

  @LMPart2_10
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Hourly Paid Leave and Hourly Unpaid Leave
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | BM      | LM_BM_LvClbRul | Hourly Paid Leave   | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | BN      | LM_BN_LvClbRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BN"
      | LeaveName      | Enable |
      | LM_BM_LvClbRul | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl6" with Pro-rata "False"
      | LeaveID |
      | BM      |
      | BN      |
    And Create user from user configuration
      | userid | Active | LeaveGroup           | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvClbRl6 | True      | True      | LM_HSlvClbRul2  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | BM         |      0 |     0 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                               |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | BM - LM_BM_LvClbRul | No more absent records exist             |
      | Hourly         |       0 |        0 |      0 | 12:00    | 13:00  | BN - LM_BN_LvClbRul | This Leave should not be clubbed with BM |

  @LMPart2_11
  Scenario: Leave Club Rule Scenario for Leaves Which Cannot Be Clubbed, Leave Type= Hourly Unpaid Leave and Hourly Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | BP      | LM_BP_LvClbRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
      | BQ      | LM_BQ_LvClbRul | Hourly Paid Leave   | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "BQ"
      | LeaveName      | Enable |
      | LM_BP_LvClbRul | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl7" with Pro-rata "False"
      | LeaveID |
      | BP      |
      | BQ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LvClbRl7 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | BQ         |      0 |     0 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                               |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | BP - LM_BP_LvClbRul | No more absent records exist             |
      | Hourly         |       0 |        0 |      0 | 12:00    | 13:00  | BQ - LM_BQ_LvClbRul | This Leave should not be clubbed with BP |

  #################################Leave Club Rule End########################
  #################################Week-Off/Holiday Club-Cover Rule Starts########################
  @LMPart2_12
  Scenario: Week-Off Club-Cover Rule for Allowed On Single Sided Leave= true, Leave Type= Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BR      | LM_BR_ClbCvrRul | Paid Leave |           0.0 |        99.0 | Single App     | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul1" with Pro-rata "False"
      | LeaveID |
      | BR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul1 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BR         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | BR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 15/01/2024 | 15/01/2024 | BR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BR      | BR      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BR      | BR      |                        |

  @LMPart2_13
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true,Leave Type= Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BS      | LM_BS_ClbCvrRul | Paid Leave |           0.0 |        99.0 | Single App     | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul2" with Pro-rata "False"
      | LeaveID |
      | BS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul2 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BS         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | BS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 15/01/2024 | 15/01/2024 | BS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BS      | BS      |        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BS      | BS      |        |

  @LMPart2_14
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Paid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BT      | LM_BT_ClbCvrRul | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul3" with Pro-rata "False"
      | LeaveID |
      | BT      |
    And Create Holiday Schedule "LM_HSClbCvrRul1"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2024 | 17/01/2024 | HSClbCvrRulTest1 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul3 | True      | True      | LM_HSClbCvrRul1 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BT         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2024 | 16/01/2024 | BT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | BT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BT      | BT      |                        |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BT      | BT      |                        |

  @LMPart2_15
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Paid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul2 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BU      | LM_BU_ClbCvrRul | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul4" with Pro-rata "False"
      | LeaveID |
      | BU      |
    And Create Holiday Schedule "LM_HSClbCvrRul2"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2024 | 17/01/2024 | HSClbCvrRulTest2 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul4 | True      | True      | LM_HSClbCvrRul2 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BU         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2024 | 16/01/2024 | BU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | BU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BU      | BU      |        |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BU      | BU      |        |

  @LMPart2_16
  Scenario: Week-Off/Holiday Club-Cover Rule Scenario - All checkboxes unchecked, Leave Type= Paid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul3 |
    And Create Holiday Schedule "LM_HSClbCvrRul3"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2024 | 17/01/2024 | HSClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BV      | LM_BV_ClbCvrRul | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul5" with Pro-rata "False"
      | LeaveID |
      | BV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul5 | True      | True      | LM_HSClbCvrRul3 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | BV         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2024 | 16/01/2024 | BV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | BV      | BV      |                       |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |

  @LMPart2_17
  Scenario: Week-Off Club-Cover Rule scenario for Allowed On Single Sided Leave= true, Leave Type= Lay off
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BW      | LM_BW_ClbCvrRul | Lay off   |           0.0 |        99.0 | Single App     | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul6" with Pro-rata "False"
      | LeaveID |
      | BW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul6 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | BW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | BW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BW      | BW      |                        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BW      | BW      |                        |

  @LMPart2_18
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Lay off
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BX      | LM_BX_ClbCvrRul | Lay off   |           0.0 |        99.0 | Single App     | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul7" with Pro-rata "False"
      | LeaveID |
      | BX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul7 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | BX         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | BX         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BX      | BX      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BX      | BX      |        |

  @LMPart2_19
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Lay off
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul4 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BY      | LM_BY_ClbCvrRul | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul8" with Pro-rata "False"
      | LeaveID |
      | BY      |
    And Create Holiday Schedule "LM_HSClbCvrRul4"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest4 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul8 | True      | True      | LM_HSClbCvrRul4 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | BY         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | BY         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BY      | BY      |                        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BY      | BY      |                        |

  @LMPart2_20
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Lay off
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul5 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | BZ      | LM_BZ_ClbCvrRul | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul9" with Pro-rata "False"
      | LeaveID |
      | BZ      |
    And Create Holiday Schedule "LM_HSClbCvrRul5"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest5 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | ReportingGroup   | LeaveGroup             | Active | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul9 | True   | True      | True      | LM_HSClbCvrRul5 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | BZ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | BZ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BZ      | BZ      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | BZ      | BZ      |        |

  @LMPart2_21
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Unpaid
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DA      | LM_DA_ClbCvrRul | Unpaid    |           0.0 |        99.0 | Single App     | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul10" with Pro-rata "False"
      | LeaveID |
      | DA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul10 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | DA         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | DA         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DA      | DA      |                        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DA      | DA      |                        |

  @LMPart2_22
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Unpaid
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DB      | LM_DB_ClbCvrRul | Unpaid    |           0.0 |        99.0 | Single App     | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul21" with Pro-rata "False"
      | LeaveID |
      | DB      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul21 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | DB         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | DB         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DB      | DB      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DB      | DB      |        |

  @LMPart2_23
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Unpaid
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul7 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DC      | LM_DC_ClbCvrRul | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl22" with Pro-rata "False"
      | LeaveID |
      | DC      |
    And Create Holiday Schedule "LM_HSClbCvrRul7"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest7 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl22 | True      | True      | LM_HSClbCvrRul7 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | DC         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | DC         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DC      | DC      |                        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DC      | DC      |                        |

  @LMPart2_24
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Unpaid
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul8 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DD      | LM_DD_ClbCvrRul | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl23" with Pro-rata "False"
      | LeaveID |
      | DD      |
    And Create Holiday Schedule "LM_HSClbCvrRul8"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest8 | False        |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl23 | True      | True      | LM_HSClbCvrRul8 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | DD         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | DD         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DD      | DD      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | DD      | DD      |        |

  @LMPart2_25
  Scenario: Week-Off/Holiday Club-Cover Rule - All checkboxes unchecked, Leave Type= Hourly Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DE      | LM_DE_ClbCvrRul | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            | false           | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul24" with Pro-rata "False"
      | LeaveID |
      | DE      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create Holiday Schedule "LM_HSClbCvrRul8"
      | FromDate   | ToDate     | HolidayName      | DeviceSynced |
      | 17/01/2023 | 17/01/2023 | HSClbCvrRulTest8 | False        |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul24 | True      | True      | LM_HSClbCvrRul8 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | DE         |      0 | January | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DE         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                       |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |

  @LMPart2_26
  Scenario: Week-Off/Holiday Club-Cover Rule Scenario - All checkboxes unchecked, Leave Type Hourly Unpaid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DF      | LM_DF_ClbCvrRul | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            | false           | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul25" with Pro-rata "False"
      | LeaveID |
      | DF      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul25 | True      | True      | LM_HSClbCvrRul8 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 14/01/2023 | 14/01/2023 | DF         |                     1 | 14/01/2023      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 14/01/2023 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                       |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |

  @LMPart2_27
  Scenario: Week-Off/Holiday Club-Cover Rule Scenario - All checkboxes unchecked, Leave Type= Restricted Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl11 |
    And Create Holiday Schedule "LM_HSClbCvrRl11"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest11 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRl11"
      | Date       | RestrictedHolidayName |
      | 13/01/2024 | ClbCvrRulTest11       |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DG      | LM_DG_ClbCvrRul | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRul226" with Pro-rata "False"
      | LeaveID |
      | DG      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup               | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRul226 | True      | True      | LM_HSClbCvrRl11 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | DG         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | DG         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DG      | DG      |                       |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |

  @LMPart2_28
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Hourly Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DH      | LM_DH_ClbCvrRul | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true            | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl222" with Pro-rata "False"
      | LeaveID |
      | DH      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl222 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | DH         |      0 | January | 2024 |          | credit | 030:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DH         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 15/01/2024 | 15/01/2024 | DH         |                     1 | 15/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 15/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @LMPart2_29
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Hourly Paid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DI      | LM_DI_ClbCvrRul | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true            | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl223" with Pro-rata "False"
      | LeaveID |
      | DI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl223 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | DI         |      0 | January | 2024 |          | credit | 030:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DI         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 15/01/2024 | 15/01/2024 | DI         |                     1 | 15/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @LMPart2_30
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Hourly Paid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl12 |
    And Create Holiday Schedule "LM_HSClbCvrRl12"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest12 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DJ      | LM_DJ_ClbCvrRul | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true            | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl229" with Pro-rata "False"
      | LeaveID |
      | DJ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl229 | True      | True      | LM_HSClbCvrRl12 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | DJ         |      0 | January | 2024 |          | credit | 030:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 11/01/2024 | 11/01/2024 | DJ         |                     1 | 11/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DJ         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 11/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @LMPart2_31
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Hourly Paid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl13 |
    And Create Holiday Schedule "LM_HSClbCvrRl13"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest13 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DK      | LM_DK_ClbCvrRul | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_HSClbCvrRl225" with Pro-rata "False"
      | LeaveID |
      | DK      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_HSClbCvrRl225 | True      | True      | LM_HSClbCvrRl13 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | DK         |      0 | January | 2024 |          | credit | 030:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 11/01/2024 | 11/01/2024 | DK         |                     1 | 11/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DK         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 11/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @LMPart2_32
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Hourly Unpaid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DL      | LM_DL_ClbCvrRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl231" with Pro-rata "False"
      | LeaveID |
      | DL      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl231 | True      | True      | LM_HSClbCvrRl13 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DL         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 15/01/2024 | 15/01/2024 | DL         |                     1 | 15/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 15/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @LMPart2_33
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Hourly Unpaid Leave
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DM      | LM_DM_ClbCvrRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl232" with Pro-rata "False"
      | LeaveID |
      | DM      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl232 | True      | True      | LM_HSClbCvrRl13 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DM         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 15/01/2024 | 15/01/2024 | DM         |                     1 | 15/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @LMPart2_34
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Hourly Unpaid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl15 |
    And Create Holiday Schedule "LM_HSClbCvrRl15"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest15 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DN      | LM_DN_ClbCvrRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl233" with Pro-rata "False"
      | LeaveID |
      | DN      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl233 | True      | True      | LM_HSClbCvrRl15 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 11/01/2024 | 11/01/2024 | DN         |                     1 | 11/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DN         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 11/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |                        |

  @LMPart2_35
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Hourly Unpaid Leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl16 |
    And Create Holiday Schedule "LM_HSClbCvrRl16"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest16 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DP      | LM_DP_ClbCvrRul | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl234" with Pro-rata "False"
      | LeaveID |
      | DP      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl234 | True      | True      | LM_HSClbCvrRl16 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 | 11/01/2024 | 11/01/2024 | DP         |                     1 | 11/01/2024      | 09:00             | 18:00           | LMUr1     |
      | LMUr1  |                  4 | 13/01/2024 | 13/01/2024 | DP         |                     1 | 13/01/2024      | 09:00             | 18:00           | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 11/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 13/01/2024 | GS    |         |         | 09:00     |           |          |            |         |         |           | PR      | PR      |        |

  @LMPart2_36
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Restricted Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl17 |
    And Create Holiday Schedule "LM_HSClbCvrRl17"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest17 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRl17"
      | Date       | RestrictedHolidayName |
      | 13/01/2024 | RHClbCvrTest17        |
      | 15/01/2024 | RHClbCvrRTest17       |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DQ      | LM_DQ_ClbCvrRul | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl235" with Pro-rata "False"
      | LeaveID |
      | DQ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl235 | True      | True      | LM_HSClbCvrRl17 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | DQ         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | DQ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 15/01/2024 | 15/01/2024 | DQ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DQ      | DQ      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DQ      | DQ      |                        |

  @LMPart2_37
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Restricted Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl18 |
    And Create Holiday Schedule "LM_HSClbCvrRl18"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest18 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRl18"
      | Date       | RestrictedHolidayName |
      | 13/01/2024 | RHClbCvrTest18        |
      | 15/01/2024 | RHClbCvrRTest18       |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DR      | LM_DR_ClbCvrRul | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl236" with Pro-rata "False"
      | LeaveID |
      | DR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl236 | True      | True      | LM_HSClbCvrRl18 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | DR         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | DR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 15/01/2024 | 15/01/2024 | DR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DR      | DR      |        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DR      | DR      |        |

  @LMPart2_38
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Restricted Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl19 |
    And Create Holiday Schedule "LM_HSClbCvrRl19"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest19 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRl19"
      | Date       | RestrictedHolidayName |
      | 11/01/2024 | RHClbCvrTest19        |
      | 13/01/2024 | RHClbCvrRTest19       |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DS      | LM_DS_ClbCvrRul | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl237" with Pro-rata "False"
      | LeaveID |
      | DS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl237 | True      | True      | LM_HSClbCvrRl19 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | DS         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 11/01/2024 | 11/01/2024 | DS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | DS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 11/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DS      | DS      |                        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DS      | DS      |                        |

  @LMPart2_39
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Restricted Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl20 |
    And Create Holiday Schedule "LM_HSClbCvrRl20"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 12/01/2024 | 12/01/2024 | HSClbCvrRulTest20 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRl20"
      | Date       | RestrictedHolidayName |
      | 11/01/2024 | RHClbCvrTest20        |
      | 13/01/2024 | RHClbCvrRTest20       |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DT      | LM_DT_ClbCvrRul | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl238" with Pro-rata "False"
      | LeaveID |
      | DT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl238 | True      | True      | LM_HSClbCvrRl20 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | DT         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 11/01/2024 | 11/01/2024 | DT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | DT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 11/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DT      | DT      |        |
      | 12/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DT      | DT      |        |

  @LMPart2_40
  Scenario: Week-Off/Holiday Club-Cover Rule Scenario - All checkboxes unchecked, Leave Type= Compensatory Off
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DU      | LM_DU_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | True     | false           | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl239" with Pro-rata "False"
      | LeaveID |
      | DU      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl239 | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | DU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DU      | DU      |                       |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |

  @LMPart2_41
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Compensatory Off
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DV      | LM_DV_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | True     | true            | false          | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl240" with Pro-rata "False"
      | LeaveID |
      | DV      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_2 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl240 | True      | Both              | LM_COffPlc_2 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | DV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | DV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DV      | DV      |                        |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DV      | DV      |                        |

  @LMPart2_42
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Compensatory Off
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DW      | LM_DW_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | True     | true            | true           | false            | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl241" with Pro-rata "False"
      | LeaveID |
      | DW      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_3 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl241 | True      | Both              | LM_COffPlc_3 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | DW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | DW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DW      | DW      |        |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DW      | DW      |        |

  @LMPart2_43
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true, Leave Type= Compensatory Off, Leave applied on both side of the Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl23 |
    And Create Holiday Schedule "LM_HSClbCvrRl23"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 09/01/2024 | 09/01/2024 | HSClbCvrRulTest23 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DX      | LM_DX_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl242" with Pro-rata "False"
      | LeaveID |
      | DX      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_4 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl242 | True      | LM_COffPlc_4 | True      | LM_HSClbCvrRl23 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "08/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | DX         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | DX         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DX      | DX      |                        |
      | 09/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DX      | DX      |                        |

  @LMPart2_44
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Compensatory Off
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl24 |
    And Create Holiday Schedule "LM_HSClbCvrRl24"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 09/01/2024 | 09/01/2024 | HSClbCvrRulTest24 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DY      | LM_DY_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true             | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl243" with Pro-rata "False"
      | LeaveID |
      | DY      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_5 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl243 | True      | LM_COffPlc_5 | True      | LM_HSClbCvrRl24 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "08/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | DY         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | DY         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DY      | DY      |        |
      | 09/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DY      | DY      |        |

  @LMPart2_45
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Leave= true and Allowed On Both Sided Leave= true, Leave Type= Compensatory Off, Leave Applied on single side of the Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl25 |
    And Create Holiday Schedule "LM_HSClbCvrRl25"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 09/01/2024 | 09/01/2024 | HSClbCvrRulTest25 | False        |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | DZ      | LM_DZ_ClbCvrRul | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_ClbCvrRl244" with Pro-rata "False"
      | LeaveID |
      | DZ      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_6 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_ClbCvrRl244 | True      | LM_COffPlc_6 | True      | LM_HSClbCvrRl25 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "08/01/2024"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | DZ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | DZ      | DZ      |        |
      | 09/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  #################################Week-Off/Holiday Club-Cover Rule End########################
  #################################Tour Club Rule Starts########################
  @LMPart2_46
  Scenario: Tour Club Rule Scenario for Allowed With All Other Tours= enable
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
    And Create Tour
      | TourID | TourName        | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | AlwWithAllOthrTour | Validation         |
      | EA     | LM_EA_TrClbRul1 |           0.0 |        99.0 | Single App     |                    | Saved Successfully |
      | EB     | LM_EB_TrClbRul1 |           0.0 |        99.0 | Single App     | true               | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrClbRul1" with Pro-rata "False"
      | TourID |
      | EA     |
      | EB     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_TrClbRul1 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour                 | Validation                   |
      |        0 |      0 | OfficialWork | EA - LM_EA_TrClbRul1 | No more absent records exist |
      |        1 |      1 | OfficialWork | EB - LM_EB_TrClbRul1 | No more absent records exist |
    Then Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart2_47
  Scenario: Tour Club Rule Scenario for Tours which cannot be Clubbed
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
    And Create Tour
      | TourID | TourName        | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | AlwWithAllOthrTour | Validation         |
      | EC     | LM_EC_TrClbRul2 |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
      | ED     | LM_ED_TrClbRul2 |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
    And Configure Tours which cannot be Clubbed for TourID = "ED"
      | TourName        | Enable |
      | LM_EC_TrClbRul2 | true   |
    And Create Leave Group "LM_LeaveGrp_TrClbRul246" with Pro-rata "False"
      | TourID |
      | EC     |
      | ED     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_TrClbRul246 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour                 | Validation                              |
      |        0 |      0 | OfficialWork | EC - LM_EC_TrClbRul2 | No more absent records exist            |
      |        1 |      1 | OfficialWork | ED - LM_ED_TrClbRul2 | This Tour should not be clubbed with EC |

  #################################Tour Club Rule End########################
  #################################Week-Off/Holiday Club-Cover Rule Starts########################
  @LMPart2_48
  Scenario: Week-Off Club-Cover Rule Scenario for All checkboxes unchecked, Tour application on both side of the Week Off
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
    And Create Tour
      | TourID | TourName       | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EE     | LM_EE_TrCvrRul | false            | false          | false             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul247" with Pro-rata "False"
      | TourID |
      | EE     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul247 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 21/01/2023 | 21/01/2023 | EE         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | EE         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EE      | EE      |                       |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |

  @LMPart2_49
  Scenario: Holiday Club-Cover Rule Scenario for All checkboxes unchecked, Tour application on both side of the Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl27 |
    And Create Holiday Schedule "LM_HSClbCvrRl27"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 11/01/2023 | 11/01/2023 | HSClbCvrRulTest27 | False        |
    And Create Tour
      | TourID | TourName       | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EF     | LM_EF_TrCvrRul | false            | false          | false             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul248" with Pro-rata "False"
      | TourID |
      | EF     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul248 | True      | True      | LM_HSClbCvrRl27 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | EF         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 12/01/2023 | 12/01/2023 | EF         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EF      | EF      |                       |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |

  @LMPart2_50
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Tour= true and Tour application on both side of the Week-Off
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
    And Create Tour
      | TourID | TourName       | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EG     | LM_EG_TrCvrRul |           0.0 |        99.0 | Single App     | true             | false          | false             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul249" with Pro-rata "False"
      | TourID |
      | EG     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul249 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 21/01/2023 | 21/01/2023 | EG         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | EG         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EG      | EG      |                        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EG      | EG      |                        |

  @LMPart2_51
  Scenario: Week-Off Club-Cover Rule Scenario for Allowed On Single Sided Tour= true and Allowed On Both Sided Tour= true, Tour application on both side of the Week-Off
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
    And Create Tour
      | TourID | TourName       | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EH     | LM_EH_TrCvrRul |           0.0 |        99.0 | Single App     | true             | true           | false             | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul250" with Pro-rata "False"
      | TourID |
      | EH     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul250 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 21/01/2023 | 21/01/2023 | EH         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | EH         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EH      | EH      |        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EH      | EH      |        |

  @LMPart2_52
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Tour= true, Tour application on both side of the Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl28 |
    And Create Holiday Schedule "LM_HSClbCvrRl28"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 11/01/2023 | 11/01/2023 | HSClbCvrRulTest28 | False        |
    And Create Tour
      | TourID | TourName       | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EI     | LM_EI_TrCvrRul |           0.0 |        99.0 | Single App     | false            | false          | true              | false           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul251" with Pro-rata "False"
      | TourID |
      | EI     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul251 | True      | True      | LM_HSClbCvrRl28 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | EI         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 12/01/2023 | 12/01/2023 | EI         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EI      | EI      |                        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EI      | EI      |                        |

  @LMPart2_53
  Scenario: Holiday Club-Cover Rule Scenario for Allowed On Single Sided Tour= true and Allowed On Both Sided Tour= true, Tour application on both side of the Holiday
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRl29 |
    And Create Holiday Schedule "LM_HSClbCvrRl29"
      | FromDate   | ToDate     | HolidayName       | DeviceSynced |
      | 11/01/2023 | 11/01/2023 | HSClbCvrRulTest29 | False        |
    And Create Tour
      | TourID | TourName       | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | WoAlwSingleSidTr | WoAlwBothSidTr | HldAlwSingleSidTr | HldAlwBothSidTr | Validation         |
      | EJ     | LM_EJ_TrCvrRul |           0.0 |        99.0 | Single App     | false            | false          | true              | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TrCvrRul252" with Pro-rata "False"
      | TourID |
      | EJ     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_TrCvrRul252 | True      | True      | LM_HSClbCvrRl29 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
      | LMRic1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | EJ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 12/01/2023 | 12/01/2023 | EJ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EJ      | EJ      |        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | EJ      | EJ      |        |

  #################################Week-Off/Holiday Club-Cover Rule End########################
  #################################C-Off Leave Club Rule Scenario Starts########################
  @LMPart2_54
  Scenario: Leave Club Rule Scenario for Allowed With All Other Leaves= enable and Leave Type= Compensatory Off
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | AlwWithOthrLv | LvEncash | Validation         |
      | EK      | LM_EK_LvClbRul | Unpaid           |           0.0 |        99.0 | Single App     |               |      | Saved Successfully |
      | EL      | LM_EL_LvClbRul | Compensatory Off |           0.0 |        99.0 | Single App     | true          | true     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvClbRl253" with Pro-rata "False"
      | LeaveID |
      | EK      |
      | EL      |
    And Create user from user configuration
      | userid | Active | LeaveGroup             | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvClbRl253 | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave               | Validation                   |
      |        1 |      1 | EK - LM_EK_LvClbRul | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "1" To= "1"
      | Status  |
      | Applied |
    And Apply COff Application from ESS
      | FromDate | ToDate | Leave               | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        2 |      2 | EL - LM_EL_LvClbRul |       0 | 09:00         | sick   | No more absent records exist |
    And Verify C-OFF Application Status in ESS date From= "2" To= "2"
      | Status  |
      | Applied |

  @LMPart2_55
  Scenario: Leave Club Rule scenario for Leaves Which Cannot Be Clubbed, Leave Type= Unpaid, Compensatory Off
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EM      | LM_EM_LvClbRul | Unpaid           |           0.0 |        99.0 | Single App     |      | Saved Successfully |
      | EN      | LM_EN_LvClbRul | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "EN"
      | LeaveName      | Enable |
      | LM_EM_LvClbRul | true   |
    And Create Leave Group "LM_LeaveGrp_LvClbRl254" with Pro-rata "False"
      | LeaveID |
      | EM      |
      | EN      |
    And Create user from user configuration
      | userid | Active | LeaveGroup             | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvClbRl254 | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave               | Validation                   |
      |        1 |      1 | EM - LM_EM_LvClbRul | No more absent records exist |
    And Apply COff Application from ESS
      | FromDate | ToDate | Leave               | AtdDate | SelectCOffHrs | Reason | Validation                               |
      |        2 |      2 | EN - LM_EN_LvClbRul |       0 | 09:00         | sick   | This Leave should not be clubbed with EM |

  #################################C-Off Leave Club Rule Scenario End########################
  #################################C-Off balance Scenario Starts########################
  @LMPart2_56
  Scenario: Check COff balance for COff Credit, Debit, Encashed and Availed
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
    And Create Leave
      | LeaveID | LeaveName     | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EP      | LM_EP_COffBal | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffBal255" with Pro-rata "False"
      | LeaveID |
      | EP      |
    And Create user from user configuration
      | userid | Active | LeaveGroup             | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COffBal255 | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
      | C-OFF     | Debit     | 04:00 | Saved Successfully |
    And Encash C-OFF from C-OFF Encashment page
      | UserId | Leave              | EncashMode | AtdDate | Hours | Validation         |
      | LMUr1  | EP - LM_EP_COffBal | Defined    |       0 | 04:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Apply COff Application from ESS
      | FromDate | ToDate | Leave              | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        1 |      1 | EP - LM_EP_COffBal |       0 | 08:00         | sick   | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify C-OFF Balance in Leave Balance Page for UserID= "LMUr1"
      | Date | Manual Credit | Manual Debit | Encashed | Availed | Available |
      |    0 | 20:00         | 04:00        | 04:00    | 08:00   | 04:00     |

  #################################C-Off balance Scenario End########################
  ##################################C-Off Modification And Cancellation Application Starts#####################
  @LMPart2_57
  Scenario: C-Off Cancellation Application Approved by RIC
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EQ      | LM_EQ_COffCancl | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffCancl256" with Pro-rata "False"
      | LeaveID |
      | EQ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup               | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_COffCancl256 | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply COff Application from ESS
      | FromDate | ToDate | Leave                | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        1 |      1 | EQ - LM_EQ_COffCancl |       0 | 09:00         | sick   | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        1 |      1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for C-Off application "cancellation" from ESS Date From= "1" To= "1"
      | Validation                      |
      | C-OFF Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        1 |      1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify C-OFF Application Status in ESS date From= "1" To= "1"
      | Status   |
      | Rejected |

  @LMPart2_58
  Scenario: C-Off Cancellation Application Rejected by RIC
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
    And Create Leave
      | LeaveID | LeaveName       | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EQ      | LM_EQ_COffCancl | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffCancl" with Pro-rata "False"
      | LeaveID |
      | EQ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_COffCancl | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply COff Application from ESS
      | FromDate | ToDate | Leave                | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        1 |      1 | EQ - LM_EQ_COffCancl |       0 | 08:00         | sick   | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        1 |      1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for C-Off application "cancellation" from ESS Date From= "1" To= "1"
      | Validation                      |
      | C-OFF Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        1 |      1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify C-OFF Application Status in ESS date From= "1" To= "1"
      | Status   |
      | Approved |

  ##################################C-Off Modification And Cancellation Application End#####################
  ###########################Leave Balance Process Starts##############################
  @LMPart2_59
  Scenario: Leave Balance Process Scenario
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
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | CarryFrdToNxtYr | Validation         |
      | ER      | LM_ER_LvBalPro | Paid Leave |           0.0 |        99.0 | Single App     | true            | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvBalPro" with Pro-rata "False"
      | LeaveID |
      | ER      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LvBalPro | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |   12 |          |                | ER         |      1 |       |   -1 |          | credit |       |
    When Run Leave Balance Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Verify leave balance from ESS
      | Period | Month | Year | LeaveName      | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | Yearly |       |    0 | LM_ER_LvBalPro |   12.00 |   0.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |

  ##########################Leave Balance Process End######################################
  @LMPart2_60
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FK      | FK        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FK" with Pro-rata "False"
      | LeaveID |
      | FK      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FK         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FK         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FK         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | FK      |                       |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | FK      |                       |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | FK      |                       |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | FK      |                       |

  @LMPart2_61
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FK      | FK        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FK" with Pro-rata "False"
      | LeaveID |
      | FK      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FK         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FK         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FK         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FK         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FK      | No Punches Available |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | AB      | No Punches Available |
      | 20/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FK      | No Punches Available |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FK      | AB      | No Punches Available |

  @LMPart2_62
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, No Leave Application
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FK      | FK        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FK" with Pro-rata "False"
      | LeaveID |
      | FK      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FK         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |

  @LMPart2_63
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FL      | FL        | Paid Leave |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FL" with Pro-rata "False"
      | LeaveID |
      | FL      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FL         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FL         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FL         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | FL      |                        |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | FL      |                        |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | FL      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | FL      |                        |

  @LMPart2_64
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FL      | FL        | Paid Leave |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FL" with Pro-rata "False"
      | LeaveID |
      | FL      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FL         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FL         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FL         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FL         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FL      | No Punches Available |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | AB      | No Punches Available |
      | 20/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FL      | No Punches Available |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FL      | AB      | No Punches Available |

  @LMPart2_65
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FM      | FM        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FM" with Pro-rata "False"
      | LeaveID |
      | FM      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FM         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FM         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2024 | 03/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2024 | 05/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | FM         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2024 | 05/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | FM      |                       |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 05/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | FM      |                       |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | FM      |                       |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | FM      |                       |

  @LMPart2_66
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FM      | FM        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FM" with Pro-rata "False"
      | LeaveID |
      | FM      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FM         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FM         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2024 | 03/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2024 | 12/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2024 | 16/01/2024 | FM         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2024 | 18/01/2024 | FM         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FM      | No Punches Available |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | AB      | No Punches Available |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FM      | No Punches Available |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FM      | AB      | No Punches Available |

  @LMPart2_67
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FM      | FM        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FM" with Pro-rata "False"
      | LeaveID |
      | FM      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FM         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  @LMPart2_68
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FN      | FN        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FN" with Pro-rata "False"
      | LeaveID |
      | FN      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FN         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FN         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2024 | 03/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2024 | 05/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | FN         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2024 | 05/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | FN      |                        |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 05/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | FN      |                        |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | FN      |                        |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | FN      |                        |

  @LMPart2_69
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FN      | FN        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FN" with Pro-rata "False"
      | LeaveID |
      | FN      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FN         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FN         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2024 | 03/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2024 | 12/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2024 | 16/01/2024 | FN         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2024 | 18/01/2024 | FN         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FN      | No Punches Available |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | AB      | No Punches Available |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FN      | No Punches Available |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FN      | AB      | No Punches Available |

  @LMPart2_70
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FO      | FO        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FO" with Pro-rata "False"
      | LeaveID |
      | FO      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FO         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FO         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 12/01/2024 | 13/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FO         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                |
      | 06/01/2024 | GS-Normal | FO       | FO       |                       |
      | 07/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 08/01/2024 | GS-Normal | FO       | FO       |                       |
      | 13/01/2024 | GS-Normal | FO       | FO       |                       |
      | 14/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 21/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 22/01/2024 | GS-Normal | FO       | FO       |                       |

  @LMPart2_71
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FO      | FO        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FO" with Pro-rata "False"
      | LeaveID |
      | FO      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FO         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FO         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FO         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FO         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 06/01/2024 | GS-Normal | AB       | FO       | No Punches Available |
      | 07/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2024 | GS-Normal | FO       | AB       | No Punches Available |
      | 20/01/2024 | GS-Normal | AB       | FO       | No Punches Available |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 22/01/2024 | GS-Normal | FO       | AB       | No Punches Available |

  @LMPart2_72
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FO      | FO        | Paid Leave |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FO" with Pro-rata "False"
      | LeaveID |
      | FO      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FO         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift    | 1st Half | 2nd Half | Remark |
      | 07/01/2024 | GS-WO/PH | WO       | WO       |        |
      | 14/01/2024 | GS-WO/PH | WO       | WO       |        |
      | 21/01/2024 | GS-WO/PH | WO       | WO       |        |

  @LMPart2_73
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FP      | FP        | Paid Leave |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FP" with Pro-rata "False"
      | LeaveID |
      | FP      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FP         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FP         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FP         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                 |
      | 06/01/2024 | GS-Normal | FP       | FP       |                        |
      | 07/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Cover Rule |
      | 08/01/2024 | GS-Normal | FP       | FP       |                        |
      | 13/01/2024 | GS-Normal | FP       | FP       |                        |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                        |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                        |
      | 22/01/2024 | GS-Normal | FP       | FP       |                        |

  @LMPart2_74
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Paid Leave, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FP      | FP        | Paid Leave |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FP" with Pro-rata "False"
      | LeaveID |
      | FP      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FP         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FP         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FP         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FP         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 06/01/2024 | GS-Normal | AB       | FP       | No Punches Available |
      | 07/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2024 | GS-Normal | FP       | AB       | No Punches Available |
      | 20/01/2024 | GS-Normal | AB       | FP       | No Punches Available |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 22/01/2024 | GS-Normal | FP       | AB       | No Punches Available |

  @LMPart2_75
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |

  @LMPart2_76
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FR      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FR      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | AB      | No Punches Available |

  @LMPart2_77
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, No Leave Application
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           | false          | false            | false           | false                      | false            | false           | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |

  @LMPart2_78
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FS      | FS        | Lay off   |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FS" with Pro-rata "False"
      | LeaveID |
      | FS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FS         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |

  @LMPart2_79
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FS      | FS        | Lay off   |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           | false          | false            | false           | false                      | false            | false           | Saved Successfully |
    And Create Leave Group "FS" with Pro-rata "False"
      | LeaveID |
      | FS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FS         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FS      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FS      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | AB      | No Punches Available |

  @LMPart2_80
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | FT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |

  @LMPart2_81
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           | false          | false            | false           | true                       | false            | false           | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | FT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FT      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FT      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | AB      | No Punches Available |

  @LMPart2_82
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           | false          | false            | false           | true                       | false            | false           | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  @LMPart2_83
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FU      | FU        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FU" with Pro-rata "False"
      | LeaveID |
      | FU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FU         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | FU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |

  @LMPart2_84
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FU      | FU        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FU" with Pro-rata "False"
      | LeaveID |
      | FU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FU         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | FU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FU      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FU      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | AB      | No Punches Available |

  @LMPart2_85
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                |
      | 07/01/2023 | GS-Normal | FV       | FV       |                       |
      | 08/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS-Normal | FV       | FV       |                       |
      | 14/01/2023 | GS-Normal | FV       | FV       |                       |
      | 15/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS-Normal | FV       | FV       |                       |

  @LMPart2_86
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | FV       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | FV       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | FV       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | FV       | AB       | No Punches Available |

  @LMPart2_87
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Lay off   |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift    | 1st Half | 2nd Half | Remark |
      | 08/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 15/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 22/01/2023 | GS-WO/PH | WO       | WO       |        |

  @LMPart2_88
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FW      | FW        | Lay off   |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FW" with Pro-rata "False"
      | LeaveID |
      | FW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FW         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                 |
      | 07/01/2023 | GS-Normal | FW       | FW       |                        |
      | 08/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Cover Rule |
      | 09/01/2023 | GS-Normal | FW       | FW       |                        |
      | 14/01/2023 | GS-Normal | FW       | FW       |                        |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 23/01/2023 | GS-Normal | FW       | FW       |                        |

  @LMPart2_89
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Lay off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FW      | FW        | Lay off   |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FW" with Pro-rata "False"
      | LeaveID |
      | FW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FW         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | FW       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | FW       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | FW       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | FW       | AB       | No Punches Available |

  @LMPart2_90
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | FR      |                       |

  @LMPart2_91
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FR         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FR         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FR      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FR      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FR      | AB      | No Punches Available |

  @LMPart2_92
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, No Leave Application
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FR      | FR        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FR" with Pro-rata "False"
      | LeaveID |
      | FR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FR         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |

  @LMPart2_93
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FS      | FS        | Unpaid    |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FS" with Pro-rata "False"
      | LeaveID |
      | FS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FS         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | FS      |                        |

  @LMPart2_94
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FS      | FS        | Unpaid    |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FS" with Pro-rata "False"
      | LeaveID |
      | FS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FS         | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FS         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FS         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FS      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FS      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FS      | AB      | No Punches Available |

  @LMPart2_95
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | FT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | FT      |                       |

  @LMPart2_96
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | FT         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | FT         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FT      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FT      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FT      | AB      | No Punches Available |

  @LMPart2_97
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FT      | FT        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FT" with Pro-rata "False"
      | LeaveID |
      | FT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FT         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  @LMPart2_98
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FU      | FU        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FU" with Pro-rata "False"
      | LeaveID |
      | FU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FU         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | FU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | FU      |                        |

  @LMPart2_99
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FU      | FU        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FU" with Pro-rata "False"
      | LeaveID |
      | FU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FU         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | FU         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | FU         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FU      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | FU      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | FU      | AB      | No Punches Available |

  @LMPart2_100
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                |
      | 07/01/2023 | GS-Normal | FV       | FV       |                       |
      | 08/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS-Normal | FV       | FV       |                       |
      | 14/01/2023 | GS-Normal | FV       | FV       |                       |
      | 15/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS-Normal | FV       | FV       |                       |

  @LMPart2_101
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FV         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FV         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | FV       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | FV       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | FV       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | FV       | AB       | No Punches Available |

  @LMPart2_102
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FV      | FV        | Unpaid    |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FV" with Pro-rata "False"
      | LeaveID |
      | FV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FV         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift    | 1st Half | 2nd Half | Remark |
      | 08/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 15/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 22/01/2023 | GS-WO/PH | WO       | WO       |        |

  @LMPart2_103
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FW      | FW        | Unpaid    |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FW" with Pro-rata "False"
      | LeaveID |
      | FW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FW         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | FW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                 |
      | 07/01/2023 | GS-Normal | FW       | FW       |                        |
      | 08/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Cover Rule |
      | 09/01/2023 | GS-Normal | FW       | FW       |                        |
      | 14/01/2023 | GS-Normal | FW       | FW       |                        |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 23/01/2023 | GS-Normal | FW       | FW       |                        |

  @LMPart2_104
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Unpaid, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FW      | FW        | Unpaid    |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FW" with Pro-rata "False"
      | LeaveID |
      | FW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FW         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | FW         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | FW         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | FW       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | FW       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | FW       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | FW       | AB       | No Punches Available |

 @LMPart2_105
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 03/01/2024 | 03/01/2024 | LM_HSClbCvrRul9 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 08/01/2024 | Test2                 |
      | 13/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FX      | FX        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FX" with Pro-rata "False"
      | LeaveID |
      | FX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FX         | True      |               | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FX         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FX         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | FX      |                       |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | FX      |                       |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | FX      |                       |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | FX      |                       |
      
  @LMPart2_106
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | LM_HSClbCvrRul9 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 15/01/2024 | Test2                 |
      | 20/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FX      | FX        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FX" with Pro-rata "False"
      | LeaveID |
      | FX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FX         | True      |               | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FX         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FX         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FX         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FX      | No Punches Available |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | AB      | No Punches Available |
      | 20/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FX      | No Punches Available |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FX      | AB      | No Punches Available |

  @LMPart2_107
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 05/01/2023 | 05/01/2023 | LM_HSClbCvrRul9 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 07/01/2023 | Test1                 |
      | 09/01/2023 | Test2                 |
      | 14/01/2023 | Test3                 |
      | 23/01/2023 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FX      | FX        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FX" with Pro-rata "False"
      | LeaveID |
      | FX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FX         | True      |               | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |

  @LMPart2_108
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 05/01/2024 | 05/01/2024 | LM_HSClbCvrRul9 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 08/01/2024 | Test2                 |
      | 13/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FY      | FY        | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FY" with Pro-rata "False"
      | LeaveID |
      | FY      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FY         | True      |               | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FY         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | FY         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | FY      |                        |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 08/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | FY      |                        |
      | 13/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | FY      |                        |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | FY      |                        |

  @LMPart2_109
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 05/01/2024 | 05/01/2024 | LM_HSClbCvrRul9 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 15/01/2024 | Test2                 |
      | 20/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FY      | FY        | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "FY" with Pro-rata "False"
      | LeaveID |
      | FY      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | AttendancePlc | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FY         | True      |               | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FY         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | FY         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | FY         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 06/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FY      | No Punches Available |
      | 07/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 14/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | AB      | No Punches Available |
      | 20/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FY      | No Punches Available |
      | 21/01/2024 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 22/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FY      | AB      | No Punches Available |

  @LMPart2_110
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 03/01/2024 | Test1                 |
      | 05/01/2024 | Test2                 |
      | 10/01/2024 | Test3                 |
      | 18/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FZ      | FZ        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FZ" with Pro-rata "False"
      | LeaveID |
      | FZ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FZ         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | FZ         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2024 | 03/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2024 | 05/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | FZ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2024 | 05/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | FZ      |                       |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 05/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | FZ      |                       |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | FZ      |                       |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | FZ      |                       |

  @LMPart2_111
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 03/01/2024 | Test1                 |
      | 12/01/2024 | Test2                 |
      | 16/01/2024 | Test3                 |
      | 18/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FZ      | FZ        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FZ" with Pro-rata "False"
      | LeaveID |
      | FZ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FZ         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | FZ         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2024 | 03/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2024 | 12/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2024 | 16/01/2024 | FZ         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2024 | 18/01/2024 | FZ         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FZ      | No Punches Available |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | AB      | No Punches Available |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | FZ      | No Punches Available |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | FZ      | AB      | No Punches Available |

  @LMPart2_112
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 03/01/2023 | Test1                 |
      | 05/01/2023 | Test2                 |
      | 10/01/2023 | Test3                 |
      | 18/01/2023 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | FZ      | FZ        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "FZ" with Pro-rata "False"
      | LeaveID |
      | FZ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | FZ         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  @LMPart2_113
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 03/01/2024 | Test1                 |
      | 05/01/2024 | Test2                 |
      | 10/01/2024 | Test3                 |
      | 18/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GA      | GA        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GA" with Pro-rata "False"
      | LeaveID |
      | GA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GA         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | GA         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2024 | 03/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2024 | 05/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2024 | 10/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2024 | 18/01/2024 | GA         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2024 | 05/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2024 | 10/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | GA      |                        |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 05/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | GA      |                        |
      | 10/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | GA      |                        |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | GA      |                        |

  @LMPart2_114
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2024 | 04/01/2024 | ClbCvrRulTest1 | False        |
      | 11/01/2024 | 11/01/2024 | ClbCvrRulTest2 | False        |
      | 17/01/2024 | 17/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 03/01/2024 | Test1                 |
      | 12/01/2024 | Test2                 |
      | 16/01/2024 | Test3                 |
      | 18/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GA      | GA        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GA" with Pro-rata "False"
      | LeaveID |
      | GA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GA         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | GA         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2024 | 03/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2024 | 12/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2024 | 16/01/2024 | GA         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2024 | 18/01/2024 | GA         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2024 | 03/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2024 | 16/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2024 | 18/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2024"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | GA      | No Punches Available |
      | 04/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | AB      | No Punches Available |
      | 16/01/2024 | GS    |         |         |           |           |          |            |         |         |           | AB      | GA      | No Punches Available |
      | 17/01/2024 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2024 | GS    |         |         |           |           |          |            |         |         |           | GA      | AB      | No Punches Available |

 @LMPart2_115
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 08/01/2024 | Test2                 |
      | 13/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GB      | GB        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GB" with Pro-rata "False"
      | LeaveID |
      | GB      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GB         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | GB         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | GB         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                |
      | 06/01/2024 | GS-Normal | GB       | GB       |                       |
      | 07/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 08/01/2024 | GS-Normal | GB       | GB       |                       |
      | 13/01/2024 | GS-Normal | GB       | GB       |                       |
      | 14/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 21/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 22/01/2024 | GS-Normal | GB       | GB       |                       |

  @LMPart2_116
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 15/01/2024 | Test2                 |
      | 20/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GB      | GB        | Restricted Holiday |           0.0 |        99.0 | Single App     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GB" with Pro-rata "False"
      | LeaveID |
      | GB      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GB         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | GB         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | GB         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | GB         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 06/01/2024 | GS-Normal | AB       | GB       | No Punches Available |
      | 07/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2024 | GS-Normal | GB       | AB       | No Punches Available |
      | 20/01/2024 | GS-Normal | AB       | GB       | No Punches Available |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 22/01/2024 | GS-Normal | GB       | AB       | No Punches Available |

  @LMPart2_117
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 08/01/2024 | Test2                 |
      | 13/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GC      | GC        | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GC" with Pro-rata "False"
      | LeaveID |
      | GC      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GC         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | GC         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 06/01/2024 | 06/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 08/01/2024 | 08/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 13/01/2024 | 13/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 22/01/2024 | 22/01/2024 | GC         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 08/01/2024 | 08/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                 |
      | 06/01/2024 | GS-Normal | GC       | GC       |                        |
      | 07/01/2024 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Cover Rule |
      | 08/01/2024 | GS-Normal | GC       | GC       |                        |
      | 13/01/2024 | GS-Normal | GC       | GC       |                        |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                        |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                        |
      | 22/01/2024 | GS-Normal | GC       | GC       |                        |

  @LMPart2_118
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Restricted Holiday, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 07/01/2024 | 07/01/2024 | ClbCvrRulTest1 | False        |
      | 14/01/2024 | 14/01/2024 | ClbCvrRulTest2 | False        |
      | 21/01/2024 | 21/01/2024 | ClbCvrRulTest3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSClbCvrRul9"
      | Date       | RestrictedHolidayName |
      | 06/01/2024 | Test1                 |
      | 15/01/2024 | Test2                 |
      | 20/01/2024 | Test3                 |
      | 22/01/2024 | Test4                 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GC      | GC        | Restricted Holiday |           0.0 |        99.0 | Single App     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GC" with Pro-rata "False"
      | LeaveID |
      | GC      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GC         | True      | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | GC         |      0 | January | 2024 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 06/01/2024 | 06/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 15/01/2024 | 15/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 20/01/2024 | 20/01/2024 | GC         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 22/01/2024 | 22/01/2024 | GC         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 06/01/2024 | 06/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 15/01/2024 | 15/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 22/01/2024 | 22/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 06/01/2024 | GS-Normal | AB       | GC       | No Punches Available |
      | 07/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 14/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2024 | GS-Normal | GC       | AB       | No Punches Available |
      | 20/01/2024 | GS-Normal | AB       | GC       | No Punches Available |
      | 21/01/2024 | GS-WO/PH  | WO       | WO       |                      |
      | 22/01/2024 | GS-Normal | GC       | AB       | No Punches Available |

  @LMPart2_119
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GD      | GD        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "GD" with Pro-rata "False"
      | LeaveID |
      | GD      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GD         | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | GD         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | GD      |                       |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | GD      |                       |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | GD      |                       |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | GD      |                       |

  @LMPart2_120
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GD      | GD        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "GD" with Pro-rata "False"
      | LeaveID |
      | GD      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GD         | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | GD         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | GD         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GD      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GD      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GD      | AB      | No Punches Available |

  @LMPart2_121
  Scenario: Week-Off Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, No Leave Application
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GD      | GD        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "GD" with Pro-rata "False"
      | LeaveID |
      | GD      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GD         | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |        |

  @LMPart2_122
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GE      | GE        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "GE" with Pro-rata "False"
      | LeaveID |
      | GE      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GE         | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | GE         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | GE      |                        |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | AB      | AB      | WO-AB:Leave Cover Rule |
      | 09/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | GE      |                        |
      | 14/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | GE      |                        |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                        |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | GE      |                        |

  @LMPart2_123
  Scenario: Week-Off Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GE      | GE        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | true            | false          | true                      | false           |                | false            | false           | false                      | false            |                 | Saved Successfully |
    And Create Leave Group "GE" with Pro-rata "False"
      | LeaveID |
      | GE      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GE         | True      | Both              | LM_COffPlc_1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | GE         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | GE         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 07/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GE      | No Punches Available |
      | 08/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 15/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | AB      | No Punches Available |
      | 21/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GE      | No Punches Available |
      | 22/01/2023 | GS-WO |         |         |           |           |          |            |         |         |           | WO      | WO      |                      |
      | 23/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GE      | AB      | No Punches Available |

  @LMPart2_124
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GF      | GF        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GF" with Pro-rata "False"
      | LeaveID |
      | GF      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GF         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | GF         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | GF      |                       |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | GF      |                       |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | GF      |                       |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Club Rule |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | GF      |                       |

  @LMPart2_125
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GF      | GF        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GF" with Pro-rata "False"
      | LeaveID |
      | GF      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GF         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | GF         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | GF         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GF      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GF      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GF      | AB      | No Punches Available |

  @LMPart2_126
  Scenario: Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GF      | GF        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | false                     | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GF" with Pro-rata "False"
      | LeaveID |
      | GF      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GF         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |        |

  @LMPart2_127
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GG      | GG        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GG" with Pro-rata "False"
      | LeaveID |
      | GG      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GG         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 03/01/2023 | 03/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 05/01/2023 | 05/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 10/01/2023 | 10/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 18/01/2023 | 18/01/2023 | GG         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 05/01/2023 | 05/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 10/01/2023 | 10/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark                 |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | GG      |                        |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | AB      | AB      | PH-AB:Leave Cover Rule |
      | 05/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | GG      |                        |
      | 10/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | GG      |                        |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                        |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | GG      |                        |

  @LMPart2_128
  Scenario: Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 04/01/2023 | 04/01/2023 | ClbCvrRulTest1 | False        |
      | 11/01/2023 | 11/01/2023 | ClbCvrRulTest2 | False        |
      | 17/01/2023 | 17/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GG      | GG        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | false                     | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GG" with Pro-rata "False"
      | LeaveID |
      | GG      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GG         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 03/01/2023 | 03/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 12/01/2023 | 12/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 16/01/2023 | 16/01/2023 | GG         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 18/01/2023 | 18/01/2023 | GG         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 03/01/2023 | 03/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 12/01/2023 | 12/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 18/01/2023 | 18/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "January" year= "2023"
      | Date       | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark               |
      | 03/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GG      | No Punches Available |
      | 04/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 11/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 12/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | AB      | No Punches Available |
      | 16/01/2023 | GS    |         |         |           |           |          |            |         |         |           | AB      | GG      | No Punches Available |
      | 17/01/2023 | GS-PH |         |         |           |           |          |            |         |         |           | PH      | PH      |                      |
      | 18/01/2023 | GS    |         |         |           |           |          |            |         |         |           | GG      | AB      | No Punches Available |

  @LMPart2_129
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GH      | GH        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GH" with Pro-rata "False"
      | LeaveID |
      | GH      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GH         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 09/01/2023 | 09/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 14/01/2023 | 14/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | GH         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 09/01/2023 | 09/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 14/01/2023 | 14/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                |
      | 07/01/2023 | GS-Normal | GH       | GH       |                       |
      | 08/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 09/01/2023 | GS-Normal | GH       | GH       |                       |
      | 14/01/2023 | GS-Normal | GH       | GH       |                       |
      | 15/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 22/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Club Rule |
      | 23/01/2023 | GS-Normal | GH       | GH       |                       |

  @LMPart2_130
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GH      | GH        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GH" with Pro-rata "False"
      | LeaveID |
      | GH      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GH         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | GH         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | GH         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | GH       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | GH       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | GH       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | GH       | AB       | No Punches Available |

  @LMPart2_131
  Scenario: Week-Off and Holiday Club-Cover Rule for "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, No Leave Application
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GH      | GH        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | false           | false          | true                      | false           |                | false            | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GH" with Pro-rata "False"
      | LeaveID |
      | GH      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GH         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift    | 1st Half | 2nd Half | Remark |
      | 08/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 15/01/2023 | GS-WO/PH | WO       | WO       |        |
      | 22/01/2023 | GS-WO/PH | WO       | WO       |        |

  @LMPart2_132
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true and "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, full day leave before WO, After WO, Before & After WO
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GI      | GI        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GI" with Pro-rata "False"
      | LeaveID |
      | GI      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GI         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 | 07/01/2023 | 07/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 16/01/2023 | 16/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 21/01/2023 | 21/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  1 | 23/01/2023 | 23/01/2023 | GI         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark                 |
      | 07/01/2023 | GS-Normal | GI       | GI       |                        |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                        |
      | 16/01/2023 | GS-Normal | GI       | GI       |                        |
      | 21/01/2023 | GS-Normal | GI       | GI       |                        |
      | 22/01/2023 | GS-WO/PH  | AB       | AB       | WO-AB:Leave Cover Rule |
      | 23/01/2023 | GS-Normal | GI       | GI       |                        |

  @LMPart2_133
  Scenario: Week-Off and Holiday Club-Cover Rule for "Allowed On Single Sided Leave"= true, "At least Full Day Leave For Club-Cover"= true, Leave Type= Compensatory Off, 2nd half Leave before WO, 1st half Leave after WO, before & after WO 1st half & 2nd half leave
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
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSClbCvrRul9 |
    And Create Holiday Schedule "LM_HSClbCvrRul9"
      | FromDate   | ToDate     | HolidayName    | DeviceSynced |
      | 08/01/2023 | 08/01/2023 | ClbCvrRulTest1 | False        |
      | 15/01/2023 | 15/01/2023 | ClbCvrRulTest2 | False        |
      | 22/01/2023 | 22/01/2023 | ClbCvrRulTest3 | False        |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | WoAlwSinglSidLv | WoAlwBothSidLv | WOAtlstFullDayLvForClbCvr | WOEnblMinLmtChk | MinLmtAroundWO | HldAlwSinglSidLv | HldAlwBothSidLv | HldAtlstFullDayLvForClbCvr | HldEnblMinLmtChk | MinLmtAroundHld | Validation         |
      | GI      | GI        | Compensatory Off |           0.0 |        99.0 | Single App     | true     | true            | false          | true                      | false           |                | true             | false           | true                       | false            |                 | Saved Successfully |
    And Create Leave Group "GI" with Pro-rata "False"
      | LeaveID |
      | GI      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | LM_COffPlc_1 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup | AtdEnable | OtCoffEligibility | CoffPlc      | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | GI         | True      | Both              | LM_COffPlc_1 | True      | LM_HSClbCvrRul9 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "05/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "06/01/2023"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 15:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  3 | 07/01/2023 | 07/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 16/01/2023 | 16/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  3 | 21/01/2023 | 21/01/2023 | GI         |                     1 | LMUr1     |
      | LMUr1  |                  2 | 23/01/2023 | 23/01/2023 | GI         |                     1 | LMUr1     |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 07/01/2023 | 07/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 16/01/2023 | 16/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 21/01/2023 | 21/01/2023 |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  | 23/01/2023 | 23/01/2023 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | LMUr1  |
    Then Daily Attendance View for userid "LMUr1" and period "Month" on "January" and "2023"
      | Date       | Shift     | 1st Half | 2nd Half | Remark               |
      | 07/01/2023 | GS-Normal | AB       | GI       | No Punches Available |
      | 08/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 15/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 16/01/2023 | GS-Normal | GI       | AB       | No Punches Available |
      | 21/01/2023 | GS-Normal | AB       | GI       | No Punches Available |
      | 22/01/2023 | GS-WO/PH  | WO       | WO       |                      |
      | 23/01/2023 | GS-Normal | GI       | AB       | No Punches Available |
