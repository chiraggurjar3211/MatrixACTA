@LeaveManagement
Feature: Mobile App automation Pre-Requisite
  I want to use this template for my feature file

  @MAPart1_1
  Scenario: Add Leave Hours In Work Hours= true, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | MA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                |                   |                   | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "MA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | MA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "MA"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | MediCertReq         | MinDurHHH | MinDurMM | Validation         |
      | HP      | MA_HP_AdLvHrInWrkHr | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true            | Ensure Availability |       001 |       00 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | MediCertReq         | MinDurHHH | MinDurMM | Validation         |
      | HU      | MA_HU_AdLvHrInWrkHr | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | Ensure Availability |       001 |       00 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MediCertReq         | MinLvForCertComp | Validation         |
      | CO      | MA_CO_COff | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Ensure Availability |                1 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq         | MinLvForCertComp | Validation         |
      | PL      | MA_PL_PLMedCertReq | Paid Leave |           0.0 |        99.0 | Single App     | Ensure Availability |                1 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq         | MinLvForCertComp | Validation         |
      | UN      | MA_UN_UnPLMedCertReq | Unpaid    |           0.0 |        99.0 | Single App     | Ensure Availability |                1 | Saved Successfully |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | TR     | MA_TR_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq   | MinLvForCertComp | Validation         |
      | LM      | MA_LM_MedCertNotReq | Paid Leave |           0.0 |        99.0 | Single App     | None          |                  | Saved Successfully |
    And Create Leave Group "MA_LeavGrp_AdLvHrInWrkHs1" with Pro-rata "False"
      | LeaveID |
      | HP      |
      | HU      |
      | CO      |
      | PL      |
      | UN      |
      | TR      |
      | LM      |
    And Set custom fields for "Users" in GP
      | Active | FieldName | Type    | Upload | Mandatory |
      | True   | Field 1   | Date    | True   | false     |
      | True   | Field 2   | Date    | False  | false     |
      | True   | Field 3   | Textbox | False  | false     |
      | True   | Field 4   | Textbox | True   | false     |
      | True   | Field 5   | Textbox | True   | false     |
    And Create Attendance Policy
      | PlcName             | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | Attendance Policy-2 |                2 |                 true |               1 |              90 |                 true |                       270 |                       10 |                     |                     |                      |                      | true          | true                 | true             |                    |                       | Saved Successfully |
    And Create In/Out Reasons
      | Reason | Type | Validation         |
      | IN     | IN   | Saved Successfully |
      | OUT    | OUT  | Saved Successfully |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | MARic1 | MARic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | MA_ReportingGrp1 |        1 | MARic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc       | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AutoAuthIMEI | MaxPunchesToBeConsidered | Validation         |
      | MA_Lv1 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Lv2 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Tr1 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Tr2 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Co1 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Co2 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_HPL | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_Atd | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true | 4                        | Saved Successfully |
      | MA_Slv | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true | 4                        | Saved Successfully |
      | MA_Off | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true | 4                        | Saved Successfully |
      | MA_SFT | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
      | MA_LM1 | True   | MA_ReportingGrp1 | MA_LeavGrp_AdLvHrInWrkHs1 | True      | Attendance Policy-2 | MA            | MA         | True      | True      | True      | True               |         true |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | MA_Lv1 |
      | MA_Lv2 |
      | MA_Tr1 |
      | MA_Tr2 |
      | MA_Co1 |
      | MA_Co2 |
      | MA_HPL |
      | MA_Atd |
      | MA_Slv |
      | MA_Off |
      | MA_SFT |
      | MA_LM1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | MA_Lv1 |
      | MA_Lv2 |
      | MA_Tr1 |
      | MA_Tr2 |
      | MA_Co1 |
      | MA_Co2 |
      | MA_HPL |
      | MA_Atd |
      | MA_Slv |
      | MA_Off |
      | MA_SFT |
      | MA_LM1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | MA_Lv1 |
      | MA_Lv2 |
      | MA_Tr1 |
      | MA_Tr2 |
      | MA_Co1 |
      | MA_Co2 |
      | MA_HPL |
      | MA_Atd |
      | MA_Slv |
      | MA_Off |
      | MA_SFT |
      | MA_LM1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | MA_Lv1 |
      | MA_Lv2 |
      | MA_Tr1 |
      | MA_Tr2 |
      | MA_Co1 |
      | MA_Co2 |
      | MA_HPL |
      | MA_Atd |
      | MA_Slv |
      | MA_Off |
      | MA_SFT |
      | MA_LM1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | MA_Lv1 |          0 |           0 |                 |                 |   20 |          |                | PL         |      0 |     0 |    0 |          | credit |        |
      | MA_Lv1 |          0 |           0 |                 |                 |   20 |          |                | PL         |      0 |    -1 |    0 |          | credit |        |
      | MA_Lv2 |          0 |           0 |                 |                 |   20 |          |                | PL         |      0 |     0 |    0 |          | credit |        |
      | MA_Lv2 |          0 |           0 |                 |                 |   20 |          |                | PL         |      0 |    -1 |    0 |          | credit |        |
      | MA_HPL |          0 |           0 |                 |                 |      |          |                | HP         |      0 |     0 |    0 |          | credit | 100:00 |
      | MA_HPL |          0 |           0 |                 |                 |      |          |                | HP         |      0 |    -1 |    0 |          | credit | 100:00 |
      | MA_LM1 |          0 |           0 |                 |                 |   20 |          |                | LM         |      0 |     0 |    0 |          | credit |        |
      | MA_LM1 |          0 |           0 |                 |                 |   20 |          |                | LM         |      0 |    -1 |    0 |          | credit |        |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co1" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co1" on AtdDate= "-2"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co1" on AtdDate= "-3"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co2" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co2" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co2" on AtdDate= "-2"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Manual Overtime/C-OFF Entry for UserID= "MA_Co2" on AtdDate= "-3"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 20:00 | Saved Successfully |
    And Set Minimum Required Characters "5" and Security Level "Low" in GP for ESS
    When Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MA_Lv1 |                          1 | admin        |    1 |
      | MA_Lv2 |                          1 | admin        |    1 |
      | MA_Tr1 |                          1 | admin        |    1 |
      | MA_Tr2 |                          1 | admin        |    1 |
      | MA_Co1 |                          1 | admin        |    1 |
      | MA_Co2 |                          1 | admin        |    1 |
      | MA_HPL |                          1 | admin        |    1 |
      | MARic1 |                          1 | admin        |    1 |
      | MA_Atd |                          1 | admin        |    1 |
      | MA_Slv |                          1 | admin        |    1 |
      | MA_Off |                          1 | admin        |    1 |
      | MA_SFT |                          1 | admin        |    1 |
      | MA_LM1 |                          1 | admin        |    1 |
    And Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | MA_Atd |         -2 |     090000 | 0      |
      | MA_Atd |         -3 |     180000 | 1      |
      | MA_Atd |         -4 |     090000 | 0      |
      | MA_Atd |         -4 |     130000 | 1      |
      | MA_Atd |         -4 |     140000 | 1      |
      | MA_Atd |         -4 |     150000 | 0      |
      | MA_Atd |         -5 |     093000 | 0      |
      | MA_Atd |         -5 |     130000 | 1      |
      | MA_Atd |         -5 |     140000 | 0      |
      | MA_Atd |         -5 |     180000 | 1      |
      | MA_Atd |         -6 |     090000 | 0      |
      | MA_Atd |         -6 |     133000 | 1      |
      | MA_Atd |         -6 |     140000 | 0      |
      | MA_Atd |         -6 |     180000 | 1      |
      | MA_Atd |         -7 |     090000 | 0      |
      | MA_Atd |         -7 |     133000 | 1      |
      | MA_Atd |         -7 |     142000 | 0      |
      | MA_Atd |         -7 |     180000 | 1      |
      | MA_Atd |         -8 |     090000 | 0      |
      | MA_Atd |         -8 |     180000 | 1      |
      | MA_Slv |         -1 |     090000 | 0      |
      | MA_Slv |         -1 |     170000 | 1      |
      | MA_Slv |         -2 |     100000 | 0      |
      | MA_Slv |         -2 |     130000 | 1      |
      | MA_Slv |         -2 |     140000 | 0      |
      | MA_Slv |         -2 |     180000 | 1      |
      | MA_Slv |         -3 |     090000 | 0      |
      | MA_Slv |         -3 |     130000 | 1      |
      | MA_Slv |         -3 |     140000 | 0      |
      | MA_Slv |         -3 |     170000 | 1      |
      | MA_Slv |         -4 |     090000 | 0      |
      | MA_Slv |         -4 |     130000 | 1      |
      | MA_Slv |         -4 |     140000 | 0      |
      | MA_Slv |         -4 |     180000 | 1      |
      | MA_Slv |         -5 |     090000 | 0      |
      | MA_Slv |         -5 |     130000 | 1      |
      | MA_Slv |         -5 |     140000 | 0      |
      | MA_Slv |         -5 |     180000 | 1      |
      | MA_Off |         -1 |     090000 | 0      |
      | MA_Off |         -1 |     170000 | 1      |
      | MA_Off |         -2 |     100000 | 0      |
      | MA_Off |         -2 |     130000 | 1      |
      | MA_Off |         -2 |     140000 | 0      |
      | MA_Off |         -2 |     180000 | 1      |
      | MA_Off |         -3 |     090000 | 0      |
      | MA_Off |         -3 |     130000 | 1      |
      | MA_Off |         -3 |     140000 | 0      |
      | MA_Off |         -3 |     170000 | 1      |
      | MA_Off |         -4 |     090000 | 0      |
      | MA_Off |         -4 |     130000 | 1      |
      | MA_Off |         -4 |     140000 | 0      |
      | MA_Off |         -4 |     180000 | 1      |
      | MA_Off |         -5 |     090000 | 0      |
      | MA_Off |         -5 |     130000 | 1      |
      | MA_Off |         -5 |     140000 | 0      |
      | MA_Off |         -5 |     180000 | 1      |
    Then Logout from Cosec Web
