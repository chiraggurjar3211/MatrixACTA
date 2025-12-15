@LeaveManagement
Feature: Leave Management Module API
  I want to use this template for my feature file

  #*********************************************************************************
  # 33 leave-balance
  #*********************************************************************************
  @API_33LvBl1
  Scenario: 33-leave-balance -  33-leave-balance - Leave Credit  Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | MA      | API_MA    | Paid Leave |           0.0 |        99.0 | Single App     |               |           | Saved Successfully |
      | MB      | API_MB    | Paid Leave |           0.0 |        99.0 | Single App     | True          |         2 | Saved Successfully |
      | MC      | API_MC    | Paid Leave |           0.0 |        99.0 | Single App     | True          |         2 | Saved Successfully |
    And Create Leave Group "API_MA" with Pro-rata "False"
      | LeaveID |
      | MA      |
    And Create Leave Group "API_MA2" with Pro-rata "True"
      | LeaveID |
      | MA      |
    And Create Leave Group "API_MBC" with Pro-rata "False"
      | LeaveID |
      | MB      |
      | MC      |
    And Create user from user configuration
      | userid  | Active | JoiningDate | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   |             | API_MA     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | 12/01/2023  | API_MA2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | 11/01/2023  | API_MA2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   |             | API_MBC    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   |             | API_MBC    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays          | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May | June | July | August | September | October | November | December | Validation         |
      | API_Cr1     | Monthly      | Fixed       | Days            |               |                  |             |                |          |        |        |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr2     | Monthly      | Calculated  | Days            |             1 | Payable Days     | Presents    |                |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr3     | Monthly      | Calculated  | Days            |             1 | Non-Payable Days |             | Absents        |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr4     | Yearly       | Fixed       | Days            |               |                  |             |                |          |        |        |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr5     | Yearly       | Calculated  | Days            |             1 | Payable Days     | Presents    |                |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
      | API_Cr6     | Yearly       | Calculated  | Days            |             1 | Non-Payable Days |             | Absents        |        0 |      1 |      1 |         |          |       |       |     |      |      |        |           |         |          |          | Saved Successfully |
    And Add Considered Attendance values in "API_Cr2" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr3" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr5" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr6" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    When Execute scenario start from "scenario 1" to "scenario 26" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 1" to "scenario 26" result "Pass".

  @API_33LvBl2
  Scenario: 33-leave-balance -  Leave Credit  Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | MD      | API_MD    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           |               |          |          | Saved Successfully |
      | ME      | API_ME    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True          |      020 |       00 | Saved Successfully |
      | MF      | API_MF    | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True          |      020 |       00 | Saved Successfully |
    And Create Leave Group "API_MD" with Pro-rata "False"
      | LeaveID |
      | MD      |
    And Create Leave Group "API_MD2" with Pro-rata "True"
      | LeaveID |
      | MD      |
    And Create Leave Group "API_MEF" with Pro-rata "False"
      | LeaveID |
      | ME      |
      | MF      |
    And Create user from user configuration
      | userid  | Active | JoiningDate | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   |             | API_MD     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | 12/01/2023  | API_MD2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | 11/01/2023  | API_MD2    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   |             | API_MEF    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   |             | API_MEF    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | CrHrs  | PreviMonConsi | AtdDays          | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May   | June  | July  | August | September | October | November | December | Validation         |
      | API_Cr7     | Monthly      | Fixed       | Hours           |        |               |                  |             |                |          |        |        | 10:00   | 10:00    | 10:00 | 10:00 | 10:00 | 10:00 | 10:00 | 10:00  | 10:00     | 10:00   | 10:00    | 10:00    | Saved Successfully |
      | API_Cr8     | Monthly      | Calculated  | Hours           |        |             1 | Payable Days     | Presents    |                |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr9     | Monthly      | Calculated  | Hours           |        |             1 | Non-Payable Days |             | Absents        |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr10    | Yearly       | Fixed       | Hours           | 030:00 |               |                  |             |                |          |        |        |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr11    | Yearly       | Calculated  | Hours           |        |             1 | Payable Days     | Presents    |                |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
      | API_Cr12    | Yearly       | Calculated  | Hours           |        |             1 | Non-Payable Days |             | Absents        |        0 |      1 | 010:00 |         |          |       |       |       |       |       |        |           |         |          |          | Saved Successfully |
    And Add Considered Attendance values in "API_Cr8" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr9" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr11" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    And Add Considered Attendance values in "API_Cr12" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    When Execute scenario start from "scenario 30" to "scenario 70" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 30" to "scenario 70" result "Pass".

  @API_33LvBl3
  Scenario: 33-leave-balance -  Leave Debit  Leave Type= Paid Leave & Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MG      | API_MG    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | MH      | API_MH    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "API_MGH" with Pro-rata "False"
      | LeaveID |
      | MG      |
      | MH      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   | API_MGH    | True      | True      | True      | True      | True               | Saved Successfully |
    When Execute scenario start from "scenario 71" to "scenario 78" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 71" to "scenario 78" result "Pass".

  @API_33LvBl4
  Scenario: 33-leave-balance -  Leave Encashment  Leave Type= Paid Leave & Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
      | API_BL3 |
      | API_BL4 |
      | API_BL5 |
      | API_BL6 |
      | API_BL7 |
      | API_BL8 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | MI      | API_MI    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | True     | Saved Successfully |
      | MJ      | API_MJ    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | Saved Successfully |
    And Create Leave Group "API_MIJ" with Pro-rata "False"
      | LeaveID |
      | MI      |
      | MJ      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL3 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL4 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL5 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL6 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL7 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL8 | True   | API_MIJ    | True      | True      | True      | True      | True               | Saved Successfully |
    When Execute scenario start from "scenario 79" to "scenario 102" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 79" to "scenario 102" result "Pass".

  @API_33LvBl5
  Scenario: 33-leave-balance -  C-Off Encashment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | MK      | API_MK    | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "API_MK" with Pro-rata "False"
      | LeaveID |
      | MK      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MK     | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MK     | True      | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    When Execute scenario start from "scenario 103" to "scenario 103" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 103" to "scenario 103" result "Pass".
    And Manual Overtime/C-OFF Entry for UserID= "API_BL1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "API_BL2" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    When Execute scenario start from "scenario 104" to "scenario 109" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 104" to "scenario 109" result "Pass".

  @API_33LvBl6
  Scenario: 33-leave-balance -  Overflow Management = Discard
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | ML      | API_ML    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MM      | API_MM    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_ML" with Pro-rata "False"
      | LeaveID |
      | ML      |
      | MM      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_ML     | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 110" to "scenario 111" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 110" to "scenario 111" result "Pass".

  @API_33LvBl7
  Scenario: 33-leave-balance -  Overflow Management = Reuse
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | MN      | API_MN    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MO      | API_MO    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_MNO" with Pro-rata "False"
      | LeaveID |
      | MN      |
      | MO      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MNO    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MNO    | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
      | API_BL2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 112" to "scenario 115" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 112" to "scenario 115" result "Pass".

  @API_33LvBl8
  Scenario: 33-leave-balance -  Overflow Management = Encash
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
      | API_BL2 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxBalAlw | MaxHHAlw | MaxMMAlw | Validation         |
      | MP      | API_MP    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | true     | True          |         5 |          |          | Saved Successfully |
      | MQ      | API_MQ    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | True     | True          |           |      050 |       00 | Saved Successfully |
    And Create Leave Group "API_MPQ" with Pro-rata "False"
      | LeaveID |
      | MP      |
      | MQ      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MPQ    | True      | True      | True      | True      | True               | Saved Successfully |
      | API_BL2 | True   | API_MPQ    | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | API_BL1 |                          1 | admin        |    1 |
      | API_BL2 |                          1 | admin        |    1 |
    When Execute scenario start from "scenario 116" to "scenario 117" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 116" to "scenario 117" result "Pass".

  @API_33LvBl9
  Scenario: 33-leave-balance -  Leave Credit - General case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | API_BL1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MR      | API_MR    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | MS      | API_MS    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "API_MRS" with Pro-rata "False"
      | LeaveID |
      | MR      |
      | MS      |
    And Create user from user configuration
      | userid  | Active | LeaveGroup | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | API_BL1 | True   | API_MRS    | True      | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays | PayableDays | NonPayableDays | FromDate | ToDate | FixVal | January | February | March | April | May   | June  | July  | August | September | October | November | December | Validation         |
      | API_Cr1     | Monthly      | Fixed       | Days            |               |         |             |                |          |        |        |       1 |        1 |     1 |     1 |     1 |     1 |     1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
      | API_Cr7     | Monthly      | Fixed       | Hours           |               |         |             |                |          |        |        | 10:00   | 10:00    | 10:00 | 10:00 | 10:00 | 10:00 | 10:00 | 10:00  | 10:00     | 10:00   | 10:00    | 10:00    | Saved Successfully |
    When Execute scenario start from "scenario 118" to "scenario 120" in API sheet named "leave-balanceSET".
    Then Verify API sheet named "leave-balanceSET" and scenario start from "scenario 118" to "scenario 120" result "Pass".

  #*********************************************************************************
  # 33 leave-application & 34 leave-approval
  #*********************************************************************************
  @LM_API_1
  Scenario: Leave Application and Approval, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIUr1  |
      | APIUr2  |
      | APIUr3  |
      | APIUr4  |
      | APIUr5  |
      | APIUr6  |
      | APIUr7  |
      | APIRic1 |
      | APIRic2 |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | ID     | API_Tour_ID |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | HS      | API_HS    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 |          | Saved Successfully |
      | HR      | API_HR    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |          | Saved Successfully |
    And Create Leave Group "API_LvGrp1" with Pro-rata "False"
      | LeaveID |
      | HS      |
      | HR      |
      | ID      |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1 | APIRic1 |               1 |         1 |               1 |                  1 |
      | APIRic2 | APIRic2 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
      | API_ReportingGrp2 | AnyOne     | APIRic2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup    | LeaveGroup | AtdEnable | RestrHalfDayCons | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   | API_ReportingGrp1 | API_LvGrp1 | True      | True             | True      | True      | True      | True               | Saved Successfully |
      | APIUr4 | True   | API_ReportingGrp2 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr5 | True   | API_ReportingGrp2 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr6 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr7 | True   | API_ReportingGrp1 | API_LvGrp1 | True      |                  | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIUr4  |                          1 | admin        |    1 |
      | APIUr5  |                          1 | admin        |    1 |
      | APIUr6  |                          1 | admin        |    1 |
      | APIUr7  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
      | APIRic2 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
    When Execute scenario start from "scenario 1" to "scenario 44" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 1" to "scenario 44" result "Pass".

  @LM_API_2
  Scenario: Leave Club Rule, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | APIUr1  |
      | APIUr2  |
      | APIUr3  |
      | APIUr4  |
      | APIUr5  |
      | APIUr6  |
      | APIUr7  |
      | APIRic1 |
      | APIRic2 |
    And Delete "BC" shift schedule
    And Delete "BC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BC      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BC"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | ChkClbAcross        | Validation         |
      | HU      | API_HU    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Week-Offs & PH Only | Saved Successfully |
      | HV      | API_HV    | Lay off           |           0.0 |        99.0 | Single App     |           |                 |                 |                     | Saved Successfully |
      | HY      | API_HY    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Week-Offs & PH Only | Saved Successfully |
      | IE      | API_IE    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |                     | Saved Successfully |
      | HX      | API_HX    | Unpaid            |           0.0 |        99.0 | Single App     |           |                 |                 |                     | Saved Successfully |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "HU"
      | LeaveName | Enable |
      | API_HV    | true   |
    And Configure Leaves Which Cannot Be Clubbed for LeaveID = "HY"
      | LeaveName | Enable |
      | API_IE    | true   |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | AlwWithAllOthrTour | Validation         |
      | IB     | API_Tour_IB |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
      | IC     | API_Tour_IC |           0.0 |        99.0 | Single App     | false              | Saved Successfully |
    And Configure Tours which cannot be Clubbed for TourID = "IB"
      | TourName    | Enable |
      | API_Tour_IC | true   |
      | API_HX      | true   |
    And Create Leave Group "API_LvGrp2" with Pro-rata "False"
      | LeaveID |
      | HU      |
      | HV      |
      | HY      |
      | HX      |
      | IB      |
      | IC      |
      | IE      |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1 | APIRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup    | LeaveGroup | AtdEnable | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   | API_ReportingGrp1 | API_LvGrp2 | True      | BC            | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | APIUr1 |
      | APIUr2 |
      | APIUr3 |
    And Change Shift via API
      | userid | FromDt | ToDt | shift-id | week-off | public-holiday |
      | APIUr1 |     -2 |   -2 |          |        1 |                |
      | APIUr1 |      1 |    1 |          |        1 |                |
      | APIUr2 |      0 |    0 |          |        1 |                |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |    6 |          |                | HU         |      1 |       |    1 |          | credit |        |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | HY         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr2 |          0 |           0 |                 |                 |      |          |                | IE         |      1 |       |    1 |          | credit | 060:00 |
    When Execute scenario start from "scenario 45" to "scenario 51" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 45" to "scenario 51" result "Pass".

  @LM_API_3
  Scenario: Leave Application Validation, Leave Type= Paid Leave, Hourly Paid Leave, Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | APIUr1   |
      | APIUr2   |
      | APIUr3   |
      | APIUr4   |
      | APIUr5   |
      | APIUr6   |
      | APIUr7   |
      | APIUr999 |
      | APIRic1  |
      | APIRic2  |
    And Create Tour
      | TourID | TourName    | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | TourDocReq      | MinTrDayForDocCom | Validation         |
      | HZ     | API_Tour_HZ |           0.0 |        99.0 | Single App     | Upload Document |                 1 | Saved Successfully |
      | IC     | API_Tour_IC |           0.0 |        99.0 | Single App     |                 |                   | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | HS      | API_HS    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 |                 |           |          | Saved Successfully |
      | HR      | API_HR    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           |                 |           |          | Saved Successfully |
      | HW      | API_HW    | Paid Leave        |           0.0 |        99.0 | Single App     |           |                 |                 | Upload Document |           |          | Saved Successfully |
      | IA      | API_IA    | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "API_LvGrp3" with Pro-rata "False"
      | LeaveID |
      | HS      |
      | HR      |
      | HW      |
      | HZ      |
      | IA      |
      | IC      |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | APIRic1  | APIRic1  |               1 |         1 |               1 |                  1 |
      | APIUr999 | APIUr999 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId  | PolicyName | RIC1    | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | API_ReportingGrp1 | AnyOne     | APIRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup    | LeaveGroup | AtdEnable | RestrHalfDayCons | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | APIUr1 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr2 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr3 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr4 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr5 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
      | APIUr6 | True   |              | API_ReportingGrp1 | API_LvGrp3 | True      |                  | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid  | user-verified-for-password | new-password | type |
      | APIUr1  |                          1 | admin        |    1 |
      | APIUr2  |                          1 | admin        |    1 |
      | APIUr3  |                          1 | admin        |    1 |
      | APIUr4  |                          1 | admin        |    1 |
      | APIUr5  |                          1 | admin        |    1 |
      | APIUr6  |                          1 | admin        |    1 |
      | APIRic1 |                          1 | admin        |    1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |    0 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |   -1 |          | credit |        |
      | APIUr1 |          0 |           0 |                 |                 |   10 |          |                | HW         |      1 |       |    1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    1 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |    1 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr3 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 004:00 |
      | APIUr3 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 004:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |    0 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |   -1 |          | credit | 060:00 |
      | APIUr4 |          0 |           0 |                 |                 |      |          |                | IA         |      1 |       |    1 |          | credit | 060:00 |
      | APIUr1 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 002:00 |
      | APIUr1 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 002:00 |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |   -1 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    1 |          | credit |        |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    0 |          | credit | 040:00 |
      | APIUr5 |          0 |           0 |                 |                 |      |          |                | HR         |      1 |       |    1 |          | credit | 040:00 |
      | APIUr6 |          0 |           0 |                 |                 |    5 |          |                | HS         |      1 |       |    0 |          | credit |        |
    When Execute scenario start from "scenario 52" to "scenario 132" in API sheet named "leave-approvalSET".
    Then Verify API sheet named "leave-approvalSET" and scenario start from "scenario 52" to "scenario 132" result "Pass".
