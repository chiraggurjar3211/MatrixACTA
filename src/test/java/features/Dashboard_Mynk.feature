@Dashboard
Feature: Title of your feature
  I want to use this template for my feature file

  @Dashboard0
  Scenario: Precondition - All
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | DB_A1  |
      | DB_A2  |
      | DB_A3  |
      | DB_A4  |
      | DB_B1  |
      | DB_B2  |
      | DB_B3  |
      | DB_B4  |
      | DB_B5  |
      | DB_B6  |
      | DB_B7  |
      | DB_B8  |
      | DB_B9  |
      | DB_C1  |
      | DB_C2  |
      | DB_C3  |
      | DB_C4  |
      | DB_D1  |
      | DB_D2  |
      | DB_D3  |
      | DB_D4  |
      | DB_D5  |
      | DB_D6  |
      | DB_D7  |
      | DB_D8  |
      | DB_D9  |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
      | DB_I1  |
      | DB_J1  |
      | DB_K1  |
      | DB_L1  |
      | DB_I2  |
      | DB_J2  |
      | DB_K2  |
      | DB_L2  |
      | DB_I3  |
      | DB_J3  |
      | DB_K3  |
      | DB_L3  |
      | DB_I4  |
      | DB_J4  |
      | DB_K4  |
      | DB_L4  |
      | DB_I5  |
      | DB_J5  |
      | DB_K5  |
      | DB_L5  |
      | DB_I6  |
      | DB_J6  |
      | DB_K6  |
      | DB_L6  |
      | DB_I7  |
      | DB_J7  |
      | DB_K7  |
      | DB_L7  |
      | DB_I8  |
      | DB_J8  |
      | DB_K8  |
      | DB_L8  |
      | DB_I9  |
      | DB_J9  |
      | DB_K9  |
      | DB_L9  |
    And Delete Overtime Policy from TnA module
      | Name       |
      | DB_AdvOT1  |
      | DB_OTAuth1 |
    And Delete Enterprise group from Enterprise module
      | Group          | Name                      | Validation           |
      | Organization   | Adani Group               | Deleted Successfully |
      | Organization   | Adani Power               | Deleted Successfully |
      | Organization   | Adani Green               | Deleted Successfully |
      | Branch         | Mundra Port               | Deleted Successfully |
      | Branch         | Ahmedabad HO              | Deleted Successfully |
      | Branch         | Tiroda Plant              | Deleted Successfully |
      | Branch         | Solar Plant UP            | Deleted Successfully |
      | Department     | Logistics Operations      | Deleted Successfully |
      | Department     | Finance                   | Deleted Successfully |
      | Department     | Power Generation          | Deleted Successfully |
      | Department     | Maintenance               | Deleted Successfully |
      | Designation    | Operations Manager        | Deleted Successfully |
      | Designation    | Senior Accountant         | Deleted Successfully |
      | Section        | Cargo Handling            | Deleted Successfully |
      | Section        | Auditing                  | Deleted Successfully |
      | Category       | Permanent Staff           | Deleted Successfully |
      | Category       | Contract Staff            | Deleted Successfully |
      | Grade          | Grade B                   | Deleted Successfully |
      | Grade          | Grade C                   | Deleted Successfully |
      | Custom Group 1 | SBU Ports                 | Deleted Successfully |
      | Custom Group 1 | SBU Corporate Services    | Deleted Successfully |
      | Custom Group 2 | Project Green Energy Port | Deleted Successfully |
      | Custom Group 2 | Project Budget 2025       | Deleted Successfully |
      | Custom Group 3 | Shift Morning             | Deleted Successfully |
      | Custom Group 3 | Shift General             | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group          | Name                      | Code   | Validation         |
      | Organization   | Adani Group               | ADGRP  | Saved Successfully |
      | Organization   | Adani Power               | ADPWR  | Saved Successfully |
      | Organization   | Adani Green               | ADGRN  | Saved Successfully |
      | Branch         | Mundra Port               | MUNPRT | Saved Successfully |
      | Branch         | Ahmedabad HO              | AMDHO  | Saved Successfully |
      | Branch         | Tiroda Plant              | TIRPLT | Saved Successfully |
      | Branch         | Solar Plant UP            | SPLTUP | Saved Successfully |
      | Department     | Logistics Operations      | LOGOPE | Saved Successfully |
      | Department     | Finance                   | FIN    | Saved Successfully |
      | Department     | Power Generation          | PWRGEN | Saved Successfully |
      | Department     | Maintenance               | MAIN   | Saved Successfully |
      | Designation    | Operations Manager        | OPEMAN | Saved Successfully |
      | Designation    | Senior Accountant         | SENACT | Saved Successfully |
      | Section        | Cargo Handling            | CARHAN | Saved Successfully |
      | Section        | Auditing                  | AUDIT  | Saved Successfully |
      | Category       | Permanent Staff           | PERSTF | Saved Successfully |
      | Category       | Contract Staff            | CONSTF | Saved Successfully |
      | Grade          | Grade B                   | GRDB   | Saved Successfully |
      | Grade          | Grade C                   | GRDC   | Saved Successfully |
      | Custom Group 1 | SBU Ports                 | SBUPRT | Saved Successfully |
      | Custom Group 1 | SBU Corporate Services    | SBUCOS | Saved Successfully |
      | Custom Group 2 | Project Green Energy Port | PGEP   | Saved Successfully |
      | Custom Group 2 | Project Budget 2025       | PB2025 | Saved Successfully |
      | Custom Group 3 | Shift Morning             | SFTMOR | Saved Successfully |
      | Custom Group 3 | Shift General             | SFTGEN | Saved Successfully |
    And Delete "IP" shift schedule
    And Delete "IP" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | IP      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "IP" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | IP      |               7 |
    And Configure Off Day Configuration in Shift Schedule "IP"
      | OffDay1 |
      | None    |
    And Delete "IR" shift schedule
    And Delete "IR" shift
    When Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | IR      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "IR" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | IR      |               7 |
    And Configure Off Day Configuration in Shift Schedule "IR"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | IP      | IP        | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | IQ     | IQ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "IP" with Pro-rata "False"
      | LeaveID |
      | IP      |
      | IQ      |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | DailyAtdAuthReq | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | DB_EvtAuth1   |                2 | true         | false                             | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |                 |                      |                      |                     |                     |                      |                      |               |                      |                  |                    | Saved Successfully |
      | DB_DailyAuth1 |                2 |              |                                   |                                                                     | True            |                      |                      |                     |                     |                      |                      |               |                      |                  |                    | Saved Successfully |
      | DB_SlOffAuth1 |                2 |              |                                   |                                                                     |                 | False                | False                | False               | False               | False                | False                | true          | true                 | true             | true               | Saved Successfully |
    And Create NetWork Hours Policy "DB_NW1"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName    | NetWorkPlcName    | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | CalOnAsPerWeekDay | CalOnResHolasperPH | OTR4FracEnable | validation         |
      | DB_AdvOT1  | OverTime Policy-1 | True      | ALL     | Daily 1    | false           |                   |                    |                | Saved Successfully |
      | DB_OTAuth1 | DB_NW1            | True      | All     | Daily 1    | false           | True              | True               | true           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "DB_OTAuth1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create Late-In Policy
      | Name   | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | DB_LI1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name   | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | DB_EO1 | True               |          10 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | DB_AEshrt1 |                4 | False                |                 |                 | True                 |                        10 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create User via api
      | Id    | name  | Active | joining-date | Blacklisted | Organization_code | branch_code | department_code | designation_code | section_code | category_code | grade_code | customgroup1_code | customgroup2_code | customgroup3_code | Attendance-calc | pin    | card-1   |
      | DB_A1 | DB_A1 |      1 |              |             | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 | 111111 |          |
      | DB_A2 | DB_A2 |      0 |              |             | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_A3 | DB_A3 |      1 |              |             | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_A3 | DB_A3 |      1 |              |           1 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_A4 | DB_A4 |      1 |            0 |             | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        | 16545412 |
      | DB_B1 | DB_B1 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B2 | DB_B2 |      0 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B3 | DB_B3 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B3 | DB_B3 |      1 |              |           1 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B4 | DB_B4 |      1 |            0 |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B5 | DB_B5 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B6 | DB_B6 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B7 | DB_B7 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 | 111112 |          |
      | DB_B8 | DB_B8 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_B9 | DB_B9 |      1 |              |             | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_C1 | DB_C1 |      1 |              |             | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 | 111113 |          |
      | DB_C2 | DB_C2 |      0 |              |             | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_C3 | DB_C3 |      1 |              |             | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_C3 | DB_C3 |      1 |              |           1 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_C4 | DB_C4 |      1 |            0 |             | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |        |          |
      | DB_D1 | DB_D1 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D2 | DB_D2 |      0 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D3 | DB_D3 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D3 | DB_D3 |      1 |              |           1 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D4 | DB_D4 |      1 |            0 |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D5 | DB_D5 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |  5451654 |
      | DB_D6 | DB_D6 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D7 | DB_D7 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D8 | DB_D8 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
      | DB_D9 | DB_D9 |      1 |              |             | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |        |          |
    And Create user from user configuration
      | userid | Active | AtdEnable | AttendancePlc | OvertimePlc | OtCoffEligibility | ESSEnable | LeaveGroup | ShiftSchedule | Validation         | MaxPunchesToBeConsidered | LateInPlc | EarlyOutPlc |
      | DB_E1  | True   | True      |               | DB_AdvOT1   | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F1  | True   | True      |               | DB_AdvOT1   | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G1  | True   | True      |               | DB_AdvOT1   | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H1  | True   | True      |               | DB_AdvOT1   | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_E2  | True   | True      | DB_EvtAuth1   |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F2  | True   | True      | DB_EvtAuth1   |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G2  | True   | True      | DB_EvtAuth1   |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H2  | True   | True      | DB_EvtAuth1   |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_E3  | True   | True      |               |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F3  | True   | True      |               |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G3  | True   | True      |               |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H3  | True   | True      |               |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_E4  | True   | True      | DB_DailyAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F4  | True   | True      | DB_DailyAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G4  | True   | True      | DB_DailyAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H4  | True   | True      | DB_DailyAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_E5  | True   | True      |               | DB_OTAuth1  | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F5  | True   | True      |               | DB_OTAuth1  | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G5  | True   | True      |               | DB_OTAuth1  | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H5  | True   | True      |               | DB_OTAuth1  | Both              | True      |            |               | Saved Successfully |                          |           |             |
      | DB_E6  | True   | True      | DB_SlOffAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_F6  | True   | True      | DB_SlOffAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_G6  | True   | True      | DB_SlOffAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_H6  | True   | True      | DB_SlOffAuth1 |             |                   | True      |            |               | Saved Successfully |                          |           |             |
      | DB_B5  |        |           |               |             |                   |           | IP         |               | Saved Successfully |                          |           |             |
      | DB_B6  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_B7  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_B8  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_B9  |        |           |               |             |                   |           | IP         |               | Saved Successfully |                          |           |             |
      | DB_D5  |        |           |               |             |                   |           | IP         |               | Saved Successfully |                          |           |             |
      | DB_D6  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_D7  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_D8  |        |           |               |             |                   |           | IP         | IP            | Saved Successfully |                          |           |             |
      | DB_D9  |        |           |               |             |                   |           | IP         |               | Saved Successfully |                          |           |             |
      | DB_I3  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_I4  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_J3  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_J4  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_K3  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_K4  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_L3  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_L4  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 | DB_LI1    |             |
      | DB_I5  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_I6  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_J5  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_J6  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_K5  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_K6  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_L5  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_L6  | True   | True      |               |             |                   | True      |            | IR            | Saved Successfully |                        4 |           | DB_EO1      |
      | DB_I7  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_J7  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_K7  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_L7  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_I8  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_J8  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_K8  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
      | DB_L8  | True   | True      | DB_AEshrt1    |             |                   | True      |            | IR            | Saved Successfully |                        4 |           |             |
    And Create User via api
      | Id    | name  | Organization_code | branch_code | department_code | designation_code | section_code | category_code | grade_code | customgroup1_code | customgroup2_code | customgroup3_code |
      | DB_E1 | DB_E1 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F1 | DB_F1 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G1 | DB_G1 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H1 | DB_H1 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_E2 | DB_E2 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F2 | DB_F2 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G2 | DB_G2 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H2 | DB_H2 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_E3 | DB_E3 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F3 | DB_F3 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G3 | DB_G3 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H3 | DB_H3 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_E4 | DB_E4 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F4 | DB_F4 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G4 | DB_G4 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H4 | DB_H4 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_E5 | DB_E5 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F5 | DB_F5 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G5 | DB_G5 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H5 | DB_H5 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_E6 | DB_E6 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_F6 | DB_F6 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
      | DB_G6 | DB_G6 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |
      | DB_H6 | DB_H6 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |
    And Create User via api
      | Id    | name  | Organization_code | branch_code | department_code | designation_code | section_code | category_code | grade_code | customgroup1_code | customgroup2_code | customgroup3_code | Attendance-calc | ess-login |
      | DB_I1 | DB_I1 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_J1 | DB_J1 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
      | DB_K1 | DB_K1 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_L1 | DB_L1 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
      | DB_I2 | DB_I2 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_J2 | DB_J2 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
      | DB_K2 | DB_K2 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_L2 | DB_L2 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
      | DB_I3 | DB_I3 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J3 | DB_J3 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K3 | DB_K3 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L3 | DB_L3 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I4 | DB_I4 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J4 | DB_J4 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K4 | DB_K4 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L4 | DB_L4 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I5 | DB_I5 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J5 | DB_J5 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K5 | DB_K5 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L5 | DB_L5 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I6 | DB_I6 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J6 | DB_J6 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K6 | DB_K6 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L6 | DB_L6 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I7 | DB_I7 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J7 | DB_J7 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K7 | DB_K7 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L7 | DB_L7 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I8 | DB_I8 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_J8 | DB_J8 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_K8 | DB_K8 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |                 |           |
      | DB_L8 | DB_L8 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |                 |           |
      | DB_I9 | DB_I9 | ADGRP             | MUNPRT      | LOGOPE          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_J9 | DB_J9 | ADGRP             | AMDHO       | FIN             | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
      | DB_K9 | DB_K9 | ADPWR             | TIRPLT      | PWRGEN          | OPEMAN           | CARHAN       | PERSTF        | GRDB       | SBUPRT            | PGEP              | SFTMOR            |               1 |         1 |
      | DB_L9 | DB_L9 | ADGRN             | SPLTUP      | MAIN            | SENACT           | AUDIT        | CONSTF        | GRDC       | SBUCOS            | PB2025            | SFTGEN            |               1 |         1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | DB_A1  |
      | DB_A2  |
      | DB_A3  |
      | DB_A4  |
      | DB_B1  |
      | DB_B2  |
      | DB_B3  |
      | DB_B4  |
      | DB_B5  |
      | DB_B6  |
      | DB_B7  |
      | DB_B8  |
      | DB_B9  |
      | DB_C1  |
      | DB_C2  |
      | DB_C3  |
      | DB_C4  |
      | DB_D1  |
      | DB_D2  |
      | DB_D3  |
      | DB_D4  |
      | DB_D5  |
      | DB_D6  |
      | DB_D7  |
      | DB_D8  |
      | DB_D9  |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
      | DB_I1  |
      | DB_J1  |
      | DB_K1  |
      | DB_L1  |
      | DB_I3  |
      | DB_J3  |
      | DB_K3  |
      | DB_L3  |
      | DB_I4  |
      | DB_J4  |
      | DB_K4  |
      | DB_L4  |
      | DB_I5  |
      | DB_J5  |
      | DB_K5  |
      | DB_L5  |
      | DB_I6  |
      | DB_J6  |
      | DB_K6  |
      | DB_L6  |
      | DB_I7  |
      | DB_J7  |
      | DB_K7  |
      | DB_L7  |
      | DB_I8  |
      | DB_J8  |
      | DB_K8  |
      | DB_L8  |
      | DB_I9  |
      | DB_J9  |
      | DB_K9  |
      | DB_L9  |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DB_A1  |
      | DB_A2  |
      | DB_A3  |
      | DB_A4  |
      | DB_B1  |
      | DB_B2  |
      | DB_B3  |
      | DB_B4  |
      | DB_B5  |
      | DB_B6  |
      | DB_B7  |
      | DB_B8  |
      | DB_B9  |
      | DB_C1  |
      | DB_C2  |
      | DB_C3  |
      | DB_C4  |
      | DB_D1  |
      | DB_D2  |
      | DB_D3  |
      | DB_D4  |
      | DB_D5  |
      | DB_D6  |
      | DB_D7  |
      | DB_D8  |
      | DB_D9  |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
      | DB_I1  |
      | DB_J1  |
      | DB_K1  |
      | DB_L1  |
      | DB_I3  |
      | DB_J3  |
      | DB_K3  |
      | DB_L3  |
      | DB_I4  |
      | DB_J4  |
      | DB_K4  |
      | DB_L4  |
      | DB_I5  |
      | DB_J5  |
      | DB_K5  |
      | DB_L5  |
      | DB_I6  |
      | DB_J6  |
      | DB_K6  |
      | DB_L6  |
      | DB_I7  |
      | DB_J7  |
      | DB_K7  |
      | DB_L7  |
      | DB_I8  |
      | DB_J8  |
      | DB_K8  |
      | DB_L8  |
      | DB_I9  |
      | DB_J9  |
      | DB_K9  |
      | DB_L9  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | DB_E1  |
      | DB_F1  |
      | DB_G1  |
      | DB_H1  |
      | DB_E2  |
      | DB_F2  |
      | DB_G2  |
      | DB_H2  |
      | DB_E3  |
      | DB_F3  |
      | DB_G3  |
      | DB_H3  |
      | DB_E4  |
      | DB_F4  |
      | DB_G4  |
      | DB_H4  |
      | DB_E5  |
      | DB_F5  |
      | DB_G5  |
      | DB_H5  |
      | DB_E6  |
      | DB_F6  |
      | DB_G6  |
      | DB_H6  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | DB_E1  |                          1 | admin        |    1 |
      | DB_F1  |                          1 | admin        |    1 |
      | DB_G1  |                          1 | admin        |    1 |
      | DB_H1  |                          1 | admin        |    1 |
      | DB_E2  |                          1 | admin        |    1 |
      | DB_F2  |                          1 | admin        |    1 |
      | DB_G2  |                          1 | admin        |    1 |
      | DB_H2  |                          1 | admin        |    1 |
      | DB_E3  |                          1 | admin        |    1 |
      | DB_F3  |                          1 | admin        |    1 |
      | DB_G3  |                          1 | admin        |    1 |
      | DB_H3  |                          1 | admin        |    1 |
      | DB_E4  |                          1 | admin        |    1 |
      | DB_F4  |                          1 | admin        |    1 |
      | DB_G4  |                          1 | admin        |    1 |
      | DB_H4  |                          1 | admin        |    1 |
      | DB_E5  |                          1 | admin        |    1 |
      | DB_F5  |                          1 | admin        |    1 |
      | DB_G5  |                          1 | admin        |    1 |
      | DB_H5  |                          1 | admin        |    1 |
      | DB_E6  |                          1 | admin        |    1 |
      | DB_F6  |                          1 | admin        |    1 |
      | DB_G6  |                          1 | admin        |    1 |
      | DB_H6  |                          1 | admin        |    1 |
      | DB_I7  |                          1 | admin        |    1 |
      | DB_J7  |                          1 | admin        |    1 |
      | DB_K7  |                          1 | admin        |    1 |
      | DB_L7  |                          1 | admin        |    1 |
      | DB_I8  |                          1 | admin        |    1 |
      | DB_J8  |                          1 | admin        |    1 |
      | DB_K8  |                          1 | admin        |    1 |
      | DB_L8  |                          1 | admin        |    1 |
    When Change Shift via API
      | userid | FromDt | ToDt | shift-id | week-off | public-holiday |
      | DB_B7  |      0 |    0 |          |        1 |                |
      | DB_B8  |      0 |    0 |          |          |              1 |
      | DB_D7  |      0 |    0 |          |        1 |                |
      | DB_D8  |      0 |    0 |          |          |              1 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | DB_B6  |          0 |           0 |                 |                 |    5 |          |                | IP         |      0 |     0 |    0 |          | credit |       |
      | DB_D6  |          0 |           0 |                 |                 |    5 |          |                | IP         |      0 |     0 |    0 |          | credit |       |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_B5  |          0 |     090000 |
      | DB_B5  |          0 |     130000 |
      | DB_B5  |          0 |     140000 |
      | DB_B5  |          0 |     180000 |
      | DB_D5  |          0 |     090000 |
      | DB_D5  |          0 |     130000 |
      | DB_D5  |          0 |     140000 |
      | DB_D5  |          0 |     180000 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | DB_B6  |                  1 |          0 |        0 | IP         |                     1 |                 |                   |                 | SA        |
      | DB_B9  |                  1 |          0 |        0 | IQ         |                     1 |                 |                   |                 | SA        |
      | DB_D6  |                  1 |          0 |        0 | IP         |                     1 |                 |                   |                 | SA        |
      | DB_D9  |                  1 |          0 |        0 | IQ         |                     1 |                 |                   |                 | SA        |
    When Generate Advance Overtime Application via API
      | userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | DB_E1  |      16 |     0200 | OTApplication | Junagadh | +919687295144 | DB_E1     |
      | DB_E1  |      15 |     0200 | OTApplication | Junagadh | +919687295144 | DB_E1     |
      | DB_E1  |      14 |     0200 | OTApplication | Junagadh | +919687295144 | DB_E1     |
      | DB_F1  |      15 |     0200 | OTApplication | Junagadh | +919687295144 | DB_F1     |
      | DB_F1  |      14 |     0200 | OTApplication | Junagadh | +919687295144 | DB_F1     |
      | DB_F1  |      13 |     0200 | OTApplication | Junagadh | +919687295144 | DB_F1     |
      | DB_F1  |       0 |     0200 | OTApplication | Junagadh | +919687295144 | DB_F1     |
      | DB_G1  |      15 |     0200 | OTApplication | Junagadh | +919687295144 | DB_G1     |
      | DB_G1  |      14 |     0200 | OTApplication | Junagadh | +919687295144 | DB_G1     |
      | DB_H1  |      15 |     0200 | OTApplication | Junagadh | +919687295144 | DB_H1     |
      | DB_H1  |      14 |     0200 | OTApplication | Junagadh | +919687295144 | DB_H1     |
      | DB_H1  |       0 |     0200 | OTApplication | Junagadh | +919687295144 | DB_H1     |
    And Approve Reject Advance Overtime Application via API
      | approved | ot-hours | remark        | ricID | userid | OT-date |
      |        1 |     0200 | AdvOTApproved | sa    | DB_E1  |      14 |
      |        1 |     0200 | AdvOTApproved | sa    | DB_F1  |      15 |
      |        2 |     0200 | AdvOTRejected | sa    | DB_F1  |      13 |
      |        1 |     0200 | AdvOTRejected | sa    | DB_F1  |       0 |
      |        1 |     0200 | AdvOTApproved | sa    | DB_G1  |      15 |
      |        2 |     0200 | AdvOTApproved | sa    | DB_H1  |      14 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_E2  |          0 |     090000 |
      | DB_E2  |        -15 |     100000 |
      | DB_F2  |          0 |     090000 |
      | DB_F2  |        -15 |     100000 |
      | DB_F2  |        -14 |     180000 |
      | DB_F2  |         -1 |     090000 |
      | DB_F2  |         -2 |     100000 |
      | DB_G2  |          0 |     090000 |
      | DB_G2  |        -15 |     100000 |
      | DB_H2  |         -1 |     090000 |
      | DB_H2  |          0 |     090000 |
      | DB_H2  |        -15 |     100000 |
      | DB_H2  |        -16 |     100000 |
    And Approve Reject Event Authorization Application from SA Date from= "-20" To= "0"
      | UserID | Date | Authorize | Validation         |
      | DB_E2  |  -15 | true      | Saved Successfully |
      | DB_F2  |    0 | true      | Saved Successfully |
      | DB_F2  |  -14 | true      | Saved Successfully |
      | DB_F2  |   -2 | true      | Saved Successfully |
      | DB_G2  |    0 | true      | Saved Successfully |
      | DB_H2  |  -15 | true      | Saved Successfully |
      | DB_H2  |  -16 | true      | Saved Successfully |
    When Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | DB_E3  |          -15 |            0900 |            1800 | GS    | DB_E3     |
      | DB_E3  |          -14 |            0900 |            1800 | GS    | DB_E3     |
      | DB_F3  |          -15 |            0900 |            1800 | GS    | DB_F3     |
      | DB_F3  |          -14 |            0900 |            1800 | GS    | DB_F3     |
      | DB_F3  |          -13 |            0900 |            1800 | GS    | DB_F3     |
      | DB_F3  |            0 |            0900 |            1800 | GS    | DB_F3     |
      | DB_F3  |          -16 |            0900 |            1800 | GS    | DB_F3     |
      | DB_G3  |          -15 |            0900 |            1800 | GS    | DB_G3     |
      | DB_G3  |          -14 |            0900 |            1800 | GS    | DB_G3     |
      | DB_G3  |            0 |            0900 |            1800 | GS    | DB_G3     |
      | DB_H3  |          -15 |            0900 |            1800 | GS    | DB_H3     |
      | DB_H3  |          -14 |            0900 |            1800 | GS    | DB_H3     |
      | DB_H3  |            0 |            0900 |            1800 | GS    | DB_H3     |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID | process-date |
      | DB_E3  |       1 | AtdCorApproved | SA    |          -14 |
      | DB_F3  |       1 | AtdCorApproved | SA    |          -15 |
      | DB_F3  |       0 | AtdCorApproved | SA    |          -13 |
      | DB_F3  |       1 | AtdCorApproved | SA    |            0 |
      | DB_G3  |       1 | AtdCorApproved | SA    |          -15 |
      | DB_G3  |       0 | AtdCorApproved | SA    |            0 |
      | DB_H3  |       0 | AtdCorApproved | SA    |          -14 |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_E4  |        -15 |     090000 |
      | DB_E4  |        -15 |     180000 |
      | DB_E4  |        -14 |     090000 |
      | DB_E4  |        -14 |     180000 |
      | DB_F4  |        -15 |     090000 |
      | DB_F4  |        -15 |     180000 |
      | DB_F4  |        -14 |     090000 |
      | DB_F4  |        -14 |     180000 |
      | DB_F4  |        -13 |     090000 |
      | DB_F4  |        -13 |     180000 |
      | DB_F4  |          0 |     090000 |
      | DB_F4  |          0 |     180000 |
      | DB_F4  |         -1 |     090000 |
      | DB_F4  |         -1 |     180000 |
      | DB_G4  |        -15 |     090000 |
      | DB_G4  |        -15 |     180000 |
      | DB_G4  |        -14 |     090000 |
      | DB_G4  |        -14 |     180000 |
      | DB_G4  |          0 |     090000 |
      | DB_G4  |          0 |     180000 |
      | DB_G4  |        -16 |     090000 |
      | DB_G4  |        -16 |     180000 |
      | DB_H4  |        -15 |     090000 |
      | DB_H4  |        -15 |     180000 |
      | DB_H4  |        -14 |     090000 |
      | DB_H4  |        -14 |     180000 |
      | DB_H4  |          0 |     090000 |
      | DB_H4  |          0 |     180000 |
      | DB_H4  |         -1 |     090000 |
      | DB_H4  |         -1 |     180000 |
    And Daily Attendance Authorization from SA Date from= "-20" To= "0"
      | UserID | Date | Authorize |
      | DB_E4  |  -14 | true      |
      | DB_F4  |  -15 | true      |
      | DB_F4  |  -13 | true      |
      | DB_G4  |  -15 | true      |
      | DB_G4  |    0 | true      |
      | DB_G4  |  -16 | true      |
      | DB_H4  |  -15 | true      |
      | DB_H4  |    0 | true      |
      | DB_H4  |   -1 | true      |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_E5  |        -15 |     070000 |
      | DB_E5  |        -15 |     180000 |
      | DB_E5  |        -14 |     070000 |
      | DB_E5  |        -14 |     180000 |
      | DB_F5  |        -15 |     070000 |
      | DB_F5  |        -15 |     180000 |
      | DB_F5  |        -14 |     070000 |
      | DB_F5  |        -14 |     180000 |
      | DB_F5  |        -13 |     070000 |
      | DB_F5  |        -13 |     180000 |
      | DB_F5  |          0 |     070000 |
      | DB_F5  |          0 |     180000 |
      | DB_F5  |         -1 |     070000 |
      | DB_F5  |         -1 |     180000 |
      | DB_G5  |        -15 |     070000 |
      | DB_G5  |        -15 |     180000 |
      | DB_G5  |        -14 |     070000 |
      | DB_G5  |        -14 |     180000 |
      | DB_G5  |          0 |     070000 |
      | DB_G5  |          0 |     180000 |
      | DB_H5  |        -15 |     070000 |
      | DB_H5  |        -15 |     180000 |
      | DB_H5  |        -14 |     070000 |
      | DB_H5  |        -14 |     180000 |
      | DB_H5  |          0 |     070000 |
      | DB_H5  |          0 |     180000 |
      | DB_H5  |         -1 |     070000 |
      | DB_H5  |         -1 |     180000 |
      | DB_H5  |        -16 |     070000 |
      | DB_H5  |        -16 |     180000 |
    And Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-20" and "0"
      | UserID | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | DB_E5  |  -14 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
      | DB_F5  |  -15 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
      | DB_G5  |  -15 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
      | DB_G5  |    0 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
      | DB_H5  |    0 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
      | DB_H5  |   -1 | OT1    | 02:00   | 002:00   |            | Saved Successfully |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_E6  |        -15 |     100000 |
      | DB_E6  |        -15 |     180000 |
      | DB_E6  |        -14 |     100000 |
      | DB_E6  |        -14 |     180000 |
      | DB_F6  |        -15 |     100000 |
      | DB_F6  |        -15 |     180000 |
      | DB_F6  |        -14 |     100000 |
      | DB_F6  |        -14 |     180000 |
      | DB_F6  |        -13 |     100000 |
      | DB_F6  |        -13 |     180000 |
      | DB_F6  |          0 |     100000 |
      | DB_F6  |          0 |     180000 |
      | DB_F6  |         -1 |     100000 |
      | DB_F6  |         -1 |     180000 |
      | DB_G6  |        -15 |     100000 |
      | DB_G6  |        -15 |     180000 |
      | DB_G6  |        -14 |     100000 |
      | DB_G6  |        -14 |     180000 |
      | DB_G6  |          0 |     100000 |
      | DB_G6  |          0 |     180000 |
      | DB_H6  |        -15 |     100000 |
      | DB_H6  |        -15 |     180000 |
      | DB_H6  |          0 |     100000 |
      | DB_H6  |          0 |     180000 |
      | DB_H6  |         -1 |     100000 |
      | DB_H6  |         -1 |     180000 |
      | DB_H6  |        -16 |     100000 |
      | DB_H6  |        -16 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | DB_E6  |             -15 |      2 | p1short  | DB_E6     |
      | DB_E6  |             -14 |      1 | p1short  | DB_E6     |
      | DB_F6  |             -15 |      2 | p1short  | DB_F6     |
      | DB_F6  |             -14 |      1 | p1short  | DB_F6     |
      | DB_F6  |             -13 |      2 | p1short  | DB_F6     |
      | DB_F6  |               0 |      1 | p1short  | DB_F6     |
      | DB_F6  |              -1 |      2 | p1short  | DB_F6     |
      | DB_G6  |             -15 |      2 | p1short  | DB_G6     |
      | DB_G6  |             -14 |      1 | p1short  | DB_G6     |
      | DB_G6  |               0 |      2 | p1short  | DB_G6     |
      | DB_H6  |             -15 |      2 | p1short  | DB_H6     |
      | DB_H6  |               0 |      2 | p1short  | DB_H6     |
      | DB_H6  |              -1 |      1 | p1short  | DB_H6     |
      | DB_H6  |             -16 |      1 | p1short  | DB_H6     |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | Authorization-for | Verdict | remark        | ricID |
      | DB_E6  |             -14 |                 1 |       1 | ShortApproved | SA    |
      | DB_F6  |             -15 |                 2 |       1 | ShortApproved | SA    |
      | DB_F6  |             -14 |                 1 |       1 | ShortApproved | SA    |
      | DB_F6  |               0 |                 1 |       2 | ShortRejected | SA    |
      | DB_G6  |             -15 |                 2 |       2 | ShortRejected | SA    |
      | DB_H6  |               0 |                 2 |       1 | ShortApproved | SA    |
      | DB_H6  |              -1 |                 1 |       2 | ShortRejected | SA    |
      | DB_H6  |             -16 |                 1 |       2 | ShortRejected | SA    |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | DB_I2  |          0 |     090000 |
      | DB_I2  |          0 |     180000 |
      | DB_J2  |          0 |     090000 |
      | DB_J2  |          0 |     180000 |
      | DB_K2  |          0 |     090000 |
      | DB_K2  |          0 |     180000 |
      | DB_L2  |          0 |     090000 |
      | DB_L2  |          0 |     180000 |
      | DB_I3  |          0 |     091500 |
      | DB_I3  |          0 |     130000 |
      | DB_I3  |          0 |     140000 |
      | DB_I3  |          0 |     181500 |
      | DB_I4  |          0 |     090000 |
      | DB_I4  |          0 |     130000 |
      | DB_I4  |          0 |     141500 |
      | DB_I4  |          0 |     181500 |
      | DB_J3  |          0 |     091500 |
      | DB_J3  |          0 |     130000 |
      | DB_J3  |          0 |     140000 |
      | DB_J3  |          0 |     181500 |
      | DB_J4  |          0 |     090000 |
      | DB_J4  |          0 |     130000 |
      | DB_J4  |          0 |     141500 |
      | DB_J4  |          0 |     181500 |
      | DB_K3  |          0 |     091500 |
      | DB_K3  |          0 |     130000 |
      | DB_K3  |          0 |     140000 |
      | DB_K3  |          0 |     181500 |
      | DB_K4  |          0 |     090000 |
      | DB_K4  |          0 |     130000 |
      | DB_K4  |          0 |     141500 |
      | DB_K4  |          0 |     181500 |
      | DB_L3  |          0 |     091500 |
      | DB_L3  |          0 |     130000 |
      | DB_L3  |          0 |     140000 |
      | DB_L3  |          0 |     181500 |
      | DB_L4  |          0 |     090000 |
      | DB_L4  |          0 |     130000 |
      | DB_L4  |          0 |     141500 |
      | DB_L4  |          0 |     181500 |
      | DB_I5  |          0 |     090000 |
      | DB_I5  |          0 |     130000 |
      | DB_I5  |          0 |     140000 |
      | DB_I5  |          0 |     174900 |
      | DB_I6  |          0 |     090000 |
      | DB_I6  |          0 |     124900 |
      | DB_I6  |          0 |     140000 |
      | DB_I6  |          0 |     180000 |
      | DB_J5  |          0 |     090000 |
      | DB_J5  |          0 |     130000 |
      | DB_J5  |          0 |     140000 |
      | DB_J5  |          0 |     174900 |
      | DB_J6  |          0 |     090000 |
      | DB_J6  |          0 |     124900 |
      | DB_J6  |          0 |     140000 |
      | DB_J6  |          0 |     180000 |
      | DB_K5  |          0 |     090000 |
      | DB_K5  |          0 |     130000 |
      | DB_K5  |          0 |     140000 |
      | DB_K5  |          0 |     174900 |
      | DB_K6  |          0 |     090000 |
      | DB_K6  |          0 |     124900 |
      | DB_K6  |          0 |     140000 |
      | DB_K6  |          0 |     180000 |
      | DB_L5  |          0 |     090000 |
      | DB_L5  |          0 |     130000 |
      | DB_L5  |          0 |     140000 |
      | DB_L5  |          0 |     174900 |
      | DB_L6  |          0 |     090000 |
      | DB_L6  |          0 |     124900 |
      | DB_L6  |          0 |     140000 |
      | DB_L6  |          0 |     180000 |
      | DB_I7  |         -1 |     090000 |
      | DB_I7  |         -1 |     130000 |
      | DB_I7  |         -1 |     140000 |
      | DB_I7  |         -1 |     175000 |
      | DB_I7  |          0 |     091000 |
      | DB_I7  |          0 |     130000 |
      | DB_I7  |          0 |     140000 |
      | DB_I7  |          0 |     180000 |
      | DB_J7  |         -1 |     090000 |
      | DB_J7  |         -1 |     130000 |
      | DB_J7  |         -1 |     140000 |
      | DB_J7  |         -1 |     175000 |
      | DB_J7  |          0 |     091000 |
      | DB_J7  |          0 |     130000 |
      | DB_J7  |          0 |     140000 |
      | DB_J7  |          0 |     180000 |
      | DB_K7  |         -1 |     090000 |
      | DB_K7  |         -1 |     130000 |
      | DB_K7  |         -1 |     140000 |
      | DB_K7  |         -1 |     175000 |
      | DB_K7  |          0 |     091000 |
      | DB_K7  |          0 |     130000 |
      | DB_K7  |          0 |     140000 |
      | DB_K7  |          0 |     180000 |
      | DB_L7  |         -1 |     090000 |
      | DB_L7  |         -1 |     130000 |
      | DB_L7  |         -1 |     140000 |
      | DB_L7  |         -1 |     175000 |
      | DB_L7  |          0 |     091000 |
      | DB_L7  |          0 |     130000 |
      | DB_L7  |          0 |     140000 |
      | DB_L7  |          0 |     180000 |
      | DB_I8  |         -1 |     091000 |
      | DB_I8  |         -1 |     130000 |
      | DB_I8  |         -1 |     140000 |
      | DB_I8  |         -1 |     180000 |
      | DB_I8  |          0 |     090000 |
      | DB_I8  |          0 |     130000 |
      | DB_I8  |          0 |     140000 |
      | DB_I8  |          0 |     175000 |
      | DB_J8  |         -1 |     091000 |
      | DB_J8  |         -1 |     130000 |
      | DB_J8  |         -1 |     140000 |
      | DB_J8  |         -1 |     180000 |
      | DB_J8  |          0 |     090000 |
      | DB_J8  |          0 |     130000 |
      | DB_J8  |          0 |     140000 |
      | DB_J8  |          0 |     175000 |
      | DB_K8  |         -1 |     091000 |
      | DB_K8  |         -1 |     130000 |
      | DB_K8  |         -1 |     140000 |
      | DB_K8  |         -1 |     180000 |
      | DB_K8  |          0 |     090000 |
      | DB_K8  |          0 |     130000 |
      | DB_K8  |          0 |     140000 |
      | DB_K8  |          0 |     175000 |
      | DB_L8  |         -1 |     091000 |
      | DB_L8  |         -1 |     130000 |
      | DB_L8  |         -1 |     140000 |
      | DB_L8  |         -1 |     180000 |
      | DB_L8  |          0 |     090000 |
      | DB_L8  |          0 |     130000 |
      | DB_L8  |          0 |     140000 |
      | DB_L8  |          0 |     175000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1     | spfid4 | reason-4     | appliedBy |
      | DB_I7  |              -1 |        |              |      2 | ByAutomation | DB_I7     |
      | DB_I7  |               0 |      2 | ByAutomation |        |              | DB_I7     |
      | DB_J7  |              -1 |        |              |      2 | ByAutomation | DB_J7     |
      | DB_J7  |               0 |      2 | ByAutomation |        |              | DB_J7     |
      | DB_K7  |              -1 |        |              |      2 | ByAutomation | DB_K7     |
      | DB_K7  |               0 |      2 | ByAutomation |        |              | DB_K7     |
      | DB_L7  |              -1 |        |              |      2 | ByAutomation | DB_L7     |
      | DB_L7  |               0 |      2 | ByAutomation |        |              | DB_L7     |
      | DB_I8  |               0 |        |              |      2 | ByAutomation | DB_I8     |
      | DB_I8  |              -1 |      2 | ByAutomation |        |              | DB_I8     |
      | DB_J8  |               0 |        |              |      2 | ByAutomation | DB_J8     |
      | DB_J8  |              -1 |      2 | ByAutomation |        |              | DB_J8     |
      | DB_K8  |               0 |        |              |      2 | ByAutomation | DB_K8     |
      | DB_K8  |              -1 |      2 | ByAutomation |        |              | DB_K8     |
      | DB_L8  |               0 |        |              |      2 | ByAutomation | DB_L8     |
      | DB_L8  |              -1 |      2 | ByAutomation |        |              | DB_L8     |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | DB_I7  |
      | DB_J7  |
      | DB_K7  |
      | DB_L7  |
      | DB_I8  |
      | DB_J8  |
      | DB_K8  |
      | DB_L8  |
    When Manual Status correction done from TnA module
      | FromDt | ToDt | ManualStatusMarking | Remark       | SelectUsers | UserIDs                 |
      |      0 |    0 | Full Day Absent     | ByAutomation | User Wise   | DB_I9,DB_J9,DB_K9,DB_L9 |

  @Dashboard1
  Scenario: Dashboard Check - User Statistics All
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then the existing "User Statistics" data for "0" date should be displayed correctly in the "Pie"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Active Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Inactive Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Blocked Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Blacklisted Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "New Joined Users"

  @Dashboard2
  Scenario: Dashboard Check - User Statistics FIlter
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And the user filters the "User Statistics" chart with the following data and saves it.
      | Select Users | Organization            | Branch                      | Department                   | Designation       | Section  | Category       | Grade   | Custom Group 1         | Custom Group 2      | Custom Group 3 |
      | Group Wise   | Adani Group,Adani Green | Ahmedabad HO,Solar Plant UP | Logistics Operations,Finance | Senior Accountant | Auditing | Contract Staff | Grade C | SBU Corporate Services | Project Budget 2025 | Shift General  |
    Then the existing "User Statistics" data for "0" date should be displayed correctly in the "Pie"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Active Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Inactive Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Blocked Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "Blacklisted Users"
    And the "User Statistics" chart is filtered by the Date filter set to "0" and the data is filtered by "New Joined Users"

  @Dashboard3
  Scenario: Dashboard Check - Attendance Summary ALl
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then the existing "Attendance Summary" data for "0" date should be displayed correctly in the "Pie"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Reported"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Not Reported"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Leave"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Tour"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Week Off"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Public Holiday"

  @Dashboard4
  Scenario: Dashboard Check - Attendance Summary Filter
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And the user filters the "Attendance Summary" chart with the following data and saves it.
      | Select Users | Organization            | Branch                      | Department                   | Designation       | Section  | Category       | Grade   | Custom Group 1         | Custom Group 2      | Custom Group 3 |
      | Group Wise   | Adani Group,Adani Green | Ahmedabad HO,Solar Plant UP | Logistics Operations,Finance | Senior Accountant | Auditing | Contract Staff | Grade C | SBU Corporate Services | Project Budget 2025 | Shift General  |
    Then the existing "Attendance Summary" data for "0" date should be displayed correctly in the "Pie"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Reported"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "Not Reported"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Leave"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Tour"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Week Off"
    And the "Attendance Summary" chart is filtered by the Date filter set to "0" and the data is filtered by "On Public Holiday"

  @Dashboard5
  Scenario: Dashboard Check - User Enrollment All
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then the existing "User Enrollment" data for "0" date should be displayed correctly in the "Pie"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Enrolled Users"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Pending Users"

  @Dashboard6
  Scenario: Dashboard Check - User Enrollment Filter
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And the user filters the "User Enrollment" chart with the following data and saves it.
      | Select Users | Organization            | Branch                      | Department                   | Designation       | Section  | Category       | Grade   | Custom Group 1         | Custom Group 2      | Custom Group 3 |
      | Group Wise   | Adani Group,Adani Green | Ahmedabad HO,Solar Plant UP | Logistics Operations,Finance | Senior Accountant | Auditing | Contract Staff | Grade C | SBU Corporate Services | Project Budget 2025 | Shift General  |
    Then the existing "User Enrollment" data for "0" date should be displayed correctly in the "Pie"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Enrolled Users"
    And the "User Enrollment" chart is filtered by the Date filter set to "0" and the data is filtered by "Pending Users"

  @Dashboard7
  Scenario: Dashboard Check - Attendance Authorization All
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then the existing "Attendance Authorization" data for "0" date should be displayed correctly in the "Chart"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Pending"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Approved"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Rejected"

  @Dashboard8
  Scenario: Dashboard Check - Attendance Authorization Filter
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And the user filters the "Attendance Authorization" chart with the following data and saves it.
      | Select Users | Organization            | Branch                      | Department                   | Designation       | Section  | Category       | Grade   | Custom Group 1         | Custom Group 2      | Custom Group 3 |
      | Group Wise   | Adani Group,Adani Green | Ahmedabad HO,Solar Plant UP | Logistics Operations,Finance | Senior Accountant | Auditing | Contract Staff | Grade C | SBU Corporate Services | Project Budget 2025 | Shift General  |
    Then the existing "Attendance Authorization" data for "0" date should be displayed correctly in the "Chart"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Pending"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Approved"
    And the "Attendance Authorization" chart is filtered by the Date filter set to "0" and the data is filtered by "Rejected"

  @Dashboard9
  Scenario: Dashboard Check - Attendance Exception All
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then the existing "Attendance Exception" data for "0" date should be displayed correctly in the "Pie"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "No Punches Available"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Shift Not Available"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Late-In"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Early Out"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "1st Half AB"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "2nd Half AB"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Full Day AB"

  @Dashboard10
  Scenario: Dashboard Check - Attendance Exception Filter
    Given Open Cosec Web
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And the user filters the "Attendance Exception" chart with the following data and saves it.
      | Select Users | Organization            | Branch                      | Department                   | Designation       | Section  | Category       | Grade   | Custom Group 1         | Custom Group 2      | Custom Group 3 |
      | Group Wise   | Adani Group,Adani Green | Ahmedabad HO,Solar Plant UP | Logistics Operations,Finance | Senior Accountant | Auditing | Contract Staff | Grade C | SBU Corporate Services | Project Budget 2025 | Shift General  |
    Then the existing "Attendance Exception" data for "0" date should be displayed correctly in the "Pie"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Select All"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "No Punches Available"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Shift Not Available"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Late-In"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Early Out"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "1st Half AB"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "2nd Half AB"
    And the "Attendance Exception" chart is filtered by the Date filter set to "0" and the data is filtered by "Full Day AB"
  