@T&A
Feature: Daily Overtime Policy for Daily 1 calculation for 4 Punch User
  Short Leave and Official IN/OUT Components Configuration in Daily Overtime Policy for Daily 1 calculation

  @FIT2975_1
  Scenario: Official IN/OUT Punches for WO, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | 05:00    | 18:00    | WO       | WO       | 13:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | WO       | WO       | 11:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | WO       | WO       | 11:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | WO       | WO       | 08:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | WO       | WO       | 09:00              |             |
      |  -09 | 05:00    | 15:00    | WO       | WO       | 03:00              |             |
      |  -08 | 05:00    | 15:00    | WO       | WO       | 01:00              |             |
      |  -07 | 07:00    | 16:00    | WO       | WO       | 06:00              |             |
      |  -06 | 07:00    | 15:00    | WO       | WO       | 05:00              |             |
      |  -05 | 07:00    | 14:30    | WO       | WO       | 05:00              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | WO       | WO       | 05:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | WO       | WO       | 09:00              |             |
      |  -02 | 05:00    | 15:00    | WO       | WO       | 11:00              |             |
      |  -01 | 07:00    | 15:00    | WO       | WO       | 08:00              | OFFICIAL    |

  @FIT2975_2
  Scenario: Official IN/OUT Punches for WO, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     2 |
      | OTDaily1Ur1 |         -1 |     140000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -1 | 05:00    | 15:00    | WO       | WO       | 09:00              | OFFICIAL |

  @FIT2975_3
  Scenario: Official IN/OUT Punches for PH, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | 05:00    | 18:00    | PH       | PH       | 13:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | PH       | PH       | 11:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | PH       | PH       | 11:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | PH       | PH       | 10:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | PH       | PH       | 10:00              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | PH       | PH       | 08:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | PH       | PH       | 09:00              |             |
      |  -09 | 05:00    | 15:00    | PH       | PH       | 03:00              |             |
      |  -08 | 05:00    | 15:00    | PH       | PH       | 01:00              |             |
      |  -07 | 07:00    | 16:00    | PH       | PH       | 06:00              |             |
      |  -06 | 07:00    | 15:00    | PH       | PH       | 05:00              |             |
      |  -05 | 07:00    | 14:30    | PH       | PH       | 05:00              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | PH       | PH       | 05:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | PH       | PH       | 09:00              |             |
      |  -02 | 05:00    | 15:00    | PH       | PH       | 11:00              |             |
      |  -01 | 07:00    | 15:00    | PH       | PH       | 08:00              | OFFICIAL    |

  @FIT2975_4
  Scenario: Official IN/OUT Punches for PH, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     2 |
      | OTDaily1Ur1 |         -1 |     140000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -1 | 05:00    | 15:00    | PH       | PH       | 09:00              | OFFICIAL |

  @FIT2975_5
  Scenario: Official IN/OUT Punches for WO/PH, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 13:00              | OFFICIAL    |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 11:00              | OFFICIAL    |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 11:00              | OFFICIAL    |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 08:00              | OFFICIAL    |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 09:00              |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       | 06:00              |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 05:00              |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 05:00              | OFFICIAL    |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 05:00              | OFFICIAL    |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 09:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 11:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 08:00              | OFFICIAL    |

  @FIT2975_6
  Scenario: Official IN/OUT Punches for WO/PH, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     2 |
      | OTDaily1Ur1 |         -1 |     140000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -1 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 09:00              | OFFICIAL |

  @FIT2975_7
  Scenario: Short Leave Punches for WO, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | BA-WO | 05:00    | 18:00    | WO       | WO       | 13:00              | SHORT LEAVE |
      |  -17 | BA-WO | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -16 | BA-WO | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -15 | BA-WO | 07:00    | 18:00    | WO       | WO       | 11:00              | SHORT LEAVE |
      |  -14 | BA-WO | 07:00    | 18:00    | WO       | WO       | 11:00              | SHORT LEAVE |
      |  -13 | BA-WO | 05:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -12 | BA-WO | 05:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -11 | BA-WO | 07:00    | 17:00    | WO       | WO       | 08:00              | SHORT LEAVE |
      |  -10 | BA-WO | 07:00    | 17:00    | WO       | WO       | 09:00              |             |
      |  -09 | BA-WO | 05:00    | 15:00    | WO       | WO       | 03:00              |             |
      |  -08 | BA-WO | 05:00    | 15:00    | WO       | WO       | 01:00              |             |
      |  -07 | BA-WO | 07:00    | 16:00    | WO       | WO       | 06:00              |             |
      |  -06 | BA-WO | 07:00    | 15:00    | WO       | WO       | 05:00              |             |
      |  -05 | BA-WO | 07:00    | 14:30    | WO       | WO       | 05:00              | SHORT LEAVE |
      |  -04 | BA-WO | 08:00    | 15:00    | WO       | WO       | 05:00              | SHORT LEAVE |
      |  -03 | BA-WO | 07:00    | 15:00    | WO       | WO       | 09:00              |             |
      |  -02 | BA-WO | 05:00    | 15:00    | WO       | WO       | 11:00              |             |
      |  -01 | BA-WO | 07:00    | 15:00    | WO       | WO       | 08:00              | SHORT LEAVE |

  @FIT2975_8
  Scenario: Short Leave Punches for WO, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
      
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     4 |
      | OTDaily1Ur1 |         -1 |     140000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -1 | BA-WO | 05:00    | 15:00    | WO       | WO       | 09:00              | SHORT LEAVE |

  @FIT2975_9
  Scenario: Short Leave Punches for PH, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | BA-PH | 05:00    | 18:00    | PH       | PH       | 13:00              | SHORT LEAVE |
      |  -17 | BA-PH | 07:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -16 | BA-PH | 07:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -15 | BA-PH | 07:00    | 18:00    | PH       | PH       | 11:00              | SHORT LEAVE |
      |  -14 | BA-PH | 07:00    | 18:00    | PH       | PH       | 11:00              | SHORT LEAVE |
      |  -13 | BA-PH | 05:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -12 | BA-PH | 05:00    | 15:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -11 | BA-PH | 07:00    | 17:00    | PH       | PH       | 08:00              | SHORT LEAVE |
      |  -10 | BA-PH | 07:00    | 17:00    | PH       | PH       | 09:00              |             |
      |  -09 | BA-PH | 05:00    | 15:00    | PH       | PH       | 03:00              |             |
      |  -08 | BA-PH | 05:00    | 15:00    | PH       | PH       | 01:00              |             |
      |  -07 | BA-PH | 07:00    | 16:00    | PH       | PH       | 06:00              |             |
      |  -06 | BA-PH | 07:00    | 15:00    | PH       | PH       | 05:00              |             |
      |  -05 | BA-PH | 07:00    | 14:30    | PH       | PH       | 05:00              | SHORT LEAVE |
      |  -04 | BA-PH | 08:00    | 15:00    | PH       | PH       | 05:00              | SHORT LEAVE |
      |  -03 | BA-PH | 07:00    | 15:00    | PH       | PH       | 09:00              |             |
      |  -02 | BA-PH | 05:00    | 15:00    | PH       | PH       | 11:00              |             |
      |  -01 | BA-PH | 07:00    | 15:00    | PH       | PH       | 08:00              | SHORT LEAVE |

  @FIT2975_10
  Scenario: Short Leave Punches for PH, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     4 |
      | OTDaily1Ur1 |         -1 |     140000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     5 |
      | OTDaily1Ur1 |         -2 |     060000 |     4 |
      | OTDaily1Ur1 |         -2 |     140000 |     3 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -1 | BA-PH | 05:00    | 15:00    | PH       | PH       | 09:00              | SHORT LEAVE |

  @FIT2975_11
  Scenario: Short Leave Punches for WO/PH, No Break Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -18 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 13:00              | SHORT LEAVE |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 11:00              | SHORT LEAVE |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 11:00              | SHORT LEAVE |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 08:00              | SHORT LEAVE |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 09:00              |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       | 06:00              |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 05:00              |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 05:00              | SHORT LEAVE |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 05:00              | SHORT LEAVE |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 09:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 11:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 08:00              | SHORT LEAVE |

  @FIT2975_12
  Scenario: Short Leave Punches for WO/PH, Configured Break= yes, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Early-IN                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Overstay                              |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Work Hours Within Shift               |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -1 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     050000 |     5 |
      | OTDaily1Ur1 |         -1 |     060000 |     4 |
      | OTDaily1Ur1 |         -1 |     140000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -1 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 09:00              | SHORT LEAVE |

  @FIT2975_13
  Scenario: Official IN/OUT Punches for WO, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | 07:00    | 18:00    | WO       | WO       |                    | OFFICIAL    |
      |  -22 | 05:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -21 | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | 05:00    | 18:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | WO       | WO       | 01:30              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | 07:00    | 14:30    | WO       | WO       | 00:30              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | 07:00    | 15:00    | WO       | WO       | 02:00              | OFFICIAL    |

  @FIT2975_14
  Scenario: Official IN/OUT Punches for WO, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -5 | 07:00    | 18:00    | WO       | WO       |                    |          |
      |   -4 | 05:00    | 15:00    | WO       | WO       | 07:00              | OFFICIAL |
      |   -3 | 05:00    | 18:00    | WO       | WO       |                    |          |
      |   -2 | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -1 | 07:00    | 18:00    | WO       | WO       |                    |          |

  @FIT2975_15
  Scenario: Official IN/OUT Punches for PH, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | 07:00    | 18:00    | PH       | PH       |                    | OFFICIAL    |
      |  -22 | 05:00    | 15:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -21 | 07:00    | 18:00    | PH       | PH       |                    |             |
      |  -20 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -19 | 05:00    | 18:00    | PH       | PH       |                    |             |
      |  -18 | 05:00    | 18:00    | PH       | PH       | 10:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | PH       | PH       | 04:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | PH       | PH       | 04:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | PH       | PH       | 03:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | PH       | PH       | 03:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | PH       | PH       | 01:30              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | PH       | PH       |                    |             |
      |  -09 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -08 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -07 | 07:00    | 16:00    | PH       | PH       |                    |             |
      |  -06 | 07:00    | 15:00    | PH       | PH       |                    |             |
      |  -05 | 07:00    | 14:30    | PH       | PH       | 00:30              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -02 | 05:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -01 | 07:00    | 15:00    | PH       | PH       | 02:00              | OFFICIAL    |

  @FIT2975_16
  Scenario: Official IN/OUT Punches for PH, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | 05:00    | 15:00    | PH       | PH       |                    |          |
      |   -5 | 07:00    | 18:00    | PH       | PH       |                    |          |
      |   -4 | 05:00    | 15:00    | PH       | PH       | 07:00              | OFFICIAL |
      |   -3 | 05:00    | 18:00    | PH       | PH       |                    |          |
      |   -2 | 05:00    | 15:00    | PH       | PH       |                    |          |
      |   -1 | 07:00    | 18:00    | PH       | PH       |                    |          |

  @FIT2975_17
  Scenario: Official IN/OUT Punches for WO/PH, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    | OFFICIAL    |
      |  -22 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -21 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:30              | OFFICIAL    |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 00:30              | OFFICIAL    |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | OFFICIAL    |

  @FIT2975_18
  Scenario: Official IN/OUT Punches for WO/PH, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -5 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |          |
      |   -4 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 07:00              | OFFICIAL |
      |   -3 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |          |
      |   -2 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -1 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |          |

  @FIT2975_19
  Scenario: Short Leave Punches for WO, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    | SHORT LEAVE |
      |  -22 | BA-WO | 05:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -21 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO | 05:00    | 18:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -17 | BA-WO | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -16 | BA-WO | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -15 | BA-WO | 07:00    | 18:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -14 | BA-WO | 07:00    | 18:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -13 | BA-WO | 05:00    | 15:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -12 | BA-WO | 05:00    | 15:00    | WO       | WO       | 01:30              | SHORT LEAVE |
      |  -11 | BA-WO | 07:00    | 17:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -10 | BA-WO | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO | 07:00    | 14:30    | WO       | WO       | 00:30              | SHORT LEAVE |
      |  -04 | BA-WO | 08:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -03 | BA-WO | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |

  @FIT2975_20
  Scenario: Short Leave Punches for WO, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -5 | 07:00    | 18:00    | WO       | WO       |                    |             |
      |   -4 | 05:00    | 15:00    | WO       | WO       | 07:00              | SHORT LEAVE |
      |   -3 | 05:00    | 18:00    | WO       | WO       |                    |             |
      |   -2 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -1 | 07:00    | 18:00    | WO       | WO       |                    |             |

  @FIT2975_21
  Scenario: Short Leave Punches for PH, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    | SHORT LEAVE |
      |  -22 | BA-PH | 05:00    | 15:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -21 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    |             |
      |  -20 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -19 | BA-PH | 05:00    | 18:00    | PH       | PH       |                    |             |
      |  -18 | BA-PH | 05:00    | 18:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -17 | BA-PH | 07:00    | 15:00    | PH       | PH       | 04:00              | SHORT LEAVE |
      |  -16 | BA-PH | 07:00    | 15:00    | PH       | PH       | 04:00              | SHORT LEAVE |
      |  -15 | BA-PH | 07:00    | 18:00    | PH       | PH       | 03:00              | SHORT LEAVE |
      |  -14 | BA-PH | 07:00    | 18:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -13 | BA-PH | 05:00    | 15:00    | PH       | PH       | 03:00              | SHORT LEAVE |
      |  -12 | BA-PH | 05:00    | 15:00    | PH       | PH       | 01:30              | SHORT LEAVE |
      |  -11 | BA-PH | 07:00    | 17:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -10 | BA-PH | 07:00    | 17:00    | PH       | PH       |                    |             |
      |  -09 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -08 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -07 | BA-PH | 07:00    | 16:00    | PH       | PH       |                    |             |
      |  -06 | BA-PH | 07:00    | 15:00    | PH       | PH       |                    |             |
      |  -05 | BA-PH | 07:00    | 14:30    | PH       | PH       | 00:30              | SHORT LEAVE |
      |  -04 | BA-PH | 08:00    | 15:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -03 | BA-PH | 07:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -02 | BA-PH | 05:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -01 | BA-PH | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |

  @FIT2975_22
  Scenario: Short Leave Punches for PH, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |   -5 | 07:00    | 18:00    | PH       | PH       |                    |             |
      |   -4 | 05:00    | 15:00    | PH       | PH       | 07:00              | SHORT LEAVE |
      |   -3 | 05:00    | 18:00    | PH       | PH       |                    |             |
      |   -2 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |   -1 | 07:00    | 18:00    | PH       | PH       |                    |             |

  @FIT2975_23
  Scenario: Short Leave Punches for WO/PH, No Break Configuration, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    | SHORT LEAVE |
      |  -22 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -21 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:30              | SHORT LEAVE |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 00:30              | SHORT LEAVE |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |

  @FIT2975_24
  Scenario: Short Leave Punches for WO/PH, Configured Break= yes, Overtime Policy with only official In/Out and Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Prior Shift      |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift     |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift       |      0000 |    2359 |      0000 | OT2        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -5 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |   -4 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 07:00              | SHORT LEAVE |
      |   -3 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |   -2 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -1 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |

  @FIT2975_25
  Scenario: Official IN/OUT Punches for WO, No Break Configuration, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | 07:00    | 18:00    | WO       | WO       |                    | OFFICIAL    |
      |  -22 | 05:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -21 | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | 05:00    | 18:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | WO       | WO       | 01:30              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | 07:00    | 14:30    | WO       | WO       | 00:30              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | 07:00    | 15:00    | WO       | WO       | 02:00              | OFFICIAL    |

  @FIT2975_26
  Scenario: Official IN/OUT Punches for WO, Configured Break= yes, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -5 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    |          |
      |   -4 | BA-WO | 05:00    | 15:00    | WO       | WO       | 07:00              | OFFICIAL |
      |   -3 | BA-WO | 05:00    | 18:00    | WO       | WO       |                    |          |
      |   -2 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -1 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    |          |

  @FIT2975_27
  Scenario: Official IN/OUT Punches for PH, No Break Configuration, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | 07:00    | 18:00    | PH       | PH       |                    | OFFICIAL    |
      |  -22 | 05:00    | 15:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -21 | 07:00    | 18:00    | PH       | PH       |                    |             |
      |  -20 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -19 | 05:00    | 18:00    | PH       | PH       |                    |             |
      |  -18 | 05:00    | 18:00    | PH       | PH       | 10:00              | OFFICIAL    |
      |  -17 | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |
      |  -16 | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |
      |  -15 | 07:00    | 18:00    | PH       | PH       | 03:00              | OFFICIAL    |
      |  -14 | 07:00    | 18:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -13 | 05:00    | 15:00    | PH       | PH       | 03:00              | OFFICIAL    |
      |  -12 | 05:00    | 15:00    | PH       | PH       | 01:30              | OFFICIAL    |
      |  -11 | 07:00    | 17:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -10 | 07:00    | 17:00    | PH       | PH       |                    |             |
      |  -09 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -08 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -07 | 07:00    | 16:00    | PH       | PH       |                    |             |
      |  -06 | 07:00    | 15:00    | PH       | PH       |                    |             |
      |  -05 | 07:00    | 14:30    | PH       | PH       | 00:30              | OFFICIAL    |
      |  -04 | 08:00    | 15:00    | PH       | PH       | 01:00              | OFFICIAL    |
      |  -03 | 07:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -02 | 05:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -01 | 07:00    | 15:00    | PH       | PH       | 02:00              | OFFICIAL    |

  @FIT2975_28
  Scenario: Official IN/OUT Punches for PH, Configured Break= yes, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |          |
      |   -5 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    |          |
      |   -4 | BA-PH | 05:00    | 15:00    | PH       | PH       | 07:00              | OFFICIAL |
      |   -3 | BA-PH | 05:00    | 18:00    | PH       | PH       |                    |          |
      |   -2 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |          |
      |   -1 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    |          |

  @FIT2975_29
  Scenario: Official IN/OUT Punches for WO/PH, No Break Configuration, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     2 |
      | OTDaily1Ur1 |         -1 |     100000 |     1 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     1 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     1 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     2 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     2 |
      | OTDaily1Ur1 |         -8 |     050000 |     2 |
      | OTDaily1Ur1 |         -8 |     060000 |     1 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     2 |
      | OTDaily1Ur1 |         -9 |     080000 |     1 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     2 |
      | OTDaily1Ur1 |        -10 |     170000 |     1 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     2 |
      | OTDaily1Ur1 |        -11 |     170000 |     1 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     2 |
      | OTDaily1Ur1 |        -12 |     073000 |     1 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     2 |
      | OTDaily1Ur1 |        -13 |     090000 |     1 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     2 |
      | OTDaily1Ur1 |        -14 |     170000 |     1 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     2 |
      | OTDaily1Ur1 |        -15 |     170000 |     1 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     2 |
      | OTDaily1Ur1 |        -18 |     160000 |     1 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     1 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     2 |
      | OTDaily1Ur1 |        -20 |     050000 |     1 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     2 |
      | OTDaily1Ur1 |        -21 |     070000 |     1 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     2 |
      | OTDaily1Ur1 |        -22 |     050000 |     1 |
      | OTDaily1Ur1 |        -22 |     060000 |     2 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     1 |
      | OTDaily1Ur1 |        -23 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Official Hours   | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Official Hours   | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Official Hours   | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Official Hours   | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    | OFFICIAL    |
      |  -22 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -21 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 10:00              | OFFICIAL    |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              | OFFICIAL    |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:30              | OFFICIAL    |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 00:30              | OFFICIAL    |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 01:00              | OFFICIAL    |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | OFFICIAL    |

  @FIT2975_30
  Scenario: Official IN/OUT Punches for WO/PH, Configured Break= yes, Overtime Policy with only Official In/Out Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Official In/Out Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     1 |
      | OTDaily1Ur1 |         -6 |     060000 |     2 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     1 |
      | OTDaily1Ur1 |         -5 |     180000 |     2 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     2 |
      | OTDaily1Ur1 |         -4 |     140000 |     1 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     1 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     2 |
      | OTDaily1Ur1 |         -2 |     050000 |     1 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     2 |
      | OTDaily1Ur1 |         -1 |     070000 |     1 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Official Hours   | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Official Hours   | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Official Hours   | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Official Hours   | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark   |
      |   -6 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -5 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |          |
      |   -4 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 07:00              | OFFICIAL |
      |   -3 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |          |
      |   -2 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |          |
      |   -1 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |          |

  @FIT2975_31
  Scenario: Short Leave Punches for WO, No Break Configuration, Overtime Policy with only Short Leave Configuration, Early-IN, Overstay, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |                |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    | SHORT LEAVE |
      |  -22 | BA-WO | 05:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -21 | BA-WO | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO | 05:00    | 18:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -17 | BA-WO | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -16 | BA-WO | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -15 | BA-WO | 07:00    | 18:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -14 | BA-WO | 07:00    | 18:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -13 | BA-WO | 05:00    | 15:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -12 | BA-WO | 05:00    | 15:00    | WO       | WO       | 01:30              | SHORT LEAVE |
      |  -11 | BA-WO | 07:00    | 17:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -10 | BA-WO | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO | 07:00    | 14:30    | WO       | WO       | 00:30              | SHORT LEAVE |
      |  -04 | BA-WO | 08:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -03 | BA-WO | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |

  @FIT2975_32
  Scenario: Short Leave Punches for WO, Configured Break= yes, Overtime Policy with only Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |                |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -5 | 07:00    | 18:00    | WO       | WO       |                    |             |
      |   -4 | 05:00    | 15:00    | WO       | WO       | 07:00              | SHORT LEAVE |
      |   -3 | 05:00    | 18:00    | WO       | WO       |                    |             |
      |   -2 | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -1 | 07:00    | 18:00    | WO       | WO       |                    |             |

  @FIT2975_33
  Scenario: Short Leave Punches for PH, No Break Configuration, Overtime Policy with only Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |          |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    | SHORT LEAVE |
      |  -22 | BA-PH | 05:00    | 15:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -21 | BA-PH | 07:00    | 18:00    | PH       | PH       |                    |             |
      |  -20 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -19 | BA-PH | 05:00    | 18:00    | PH       | PH       |                    |             |
      |  -18 | BA-PH | 05:00    | 18:00    | PH       | PH       | 10:00              | SHORT LEAVE |
      |  -17 | BA-PH | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |
      |  -16 | BA-PH | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |
      |  -15 | BA-PH | 07:00    | 18:00    | PH       | PH       | 03:00              | SHORT LEAVE |
      |  -14 | BA-PH | 07:00    | 18:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -13 | BA-PH | 05:00    | 15:00    | PH       | PH       | 03:00              | SHORT LEAVE |
      |  -12 | BA-PH | 05:00    | 15:00    | PH       | PH       | 01:30              | SHORT LEAVE |
      |  -11 | BA-PH | 07:00    | 17:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -10 | BA-PH | 07:00    | 17:00    | PH       | PH       |                    |             |
      |  -09 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -08 | BA-PH | 05:00    | 15:00    | PH       | PH       |                    |             |
      |  -07 | BA-PH | 07:00    | 16:00    | PH       | PH       |                    |             |
      |  -06 | BA-PH | 07:00    | 15:00    | PH       | PH       |                    |             |
      |  -05 | BA-PH | 07:00    | 14:30    | PH       | PH       | 00:30              | SHORT LEAVE |
      |  -04 | BA-PH | 08:00    | 15:00    | PH       | PH       | 01:00              | SHORT LEAVE |
      |  -03 | BA-PH | 07:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -02 | BA-PH | 05:00    | 15:00    | PH       | PH       | 04:00              |             |
      |  -01 | BA-PH | 07:00    | 15:00    | PH       | PH       | 02:00              | SHORT LEAVE |

  @FIT2975_34
  Scenario: Short Leave Punches for PH, Configured Break= yes, Overtime Policy with only Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |          |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |   -5 | 07:00    | 18:00    | PH       | PH       |                    |             |
      |   -4 | 05:00    | 15:00    | PH       | PH       | 07:00              | SHORT LEAVE |
      |   -3 | 05:00    | 18:00    | PH       | PH       |                    |             |
      |   -2 | 05:00    | 15:00    | PH       | PH       |                    |             |
      |   -1 | 07:00    | 18:00    | PH       | PH       |                    |             |

  @FIT2975_35
  Scenario: Short Leave Punches for WO/PH, No Break Configuration, Overtime Policy with only Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |    -23 |   -1 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -1 |     070000 |     5 |
      | OTDaily1Ur1 |         -1 |     080000 |     4 |
      | OTDaily1Ur1 |         -1 |     100000 |     3 |
      | OTDaily1Ur1 |         -1 |     150000 |     6 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     110000 |     6 |
      | OTDaily1Ur1 |         -2 |     140000 |     5 |
      | OTDaily1Ur1 |         -2 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     070000 |     3 |
      | OTDaily1Ur1 |         -3 |     110000 |     6 |
      | OTDaily1Ur1 |         -3 |     140000 |     5 |
      | OTDaily1Ur1 |         -3 |     150000 |     6 |
      | OTDaily1Ur1 |         -4 |     080000 |     3 |
      | OTDaily1Ur1 |         -4 |     110000 |     6 |
      | OTDaily1Ur1 |         -4 |     140000 |     5 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     110000 |     6 |
      | OTDaily1Ur1 |         -5 |     140000 |     5 |
      | OTDaily1Ur1 |         -5 |     143000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     110000 |     6 |
      | OTDaily1Ur1 |         -6 |     140000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     4 |
      | OTDaily1Ur1 |         -7 |     070000 |     5 |
      | OTDaily1Ur1 |         -7 |     110000 |     6 |
      | OTDaily1Ur1 |         -7 |     140000 |     5 |
      | OTDaily1Ur1 |         -7 |     160000 |     4 |
      | OTDaily1Ur1 |         -8 |     050000 |     4 |
      | OTDaily1Ur1 |         -8 |     060000 |     3 |
      | OTDaily1Ur1 |         -8 |     150000 |     6 |
      | OTDaily1Ur1 |         -9 |     050000 |     4 |
      | OTDaily1Ur1 |         -9 |     080000 |     3 |
      | OTDaily1Ur1 |         -9 |     150000 |     6 |
      | OTDaily1Ur1 |        -10 |     070000 |     5 |
      | OTDaily1Ur1 |        -10 |     160000 |     4 |
      | OTDaily1Ur1 |        -10 |     170000 |     3 |
      | OTDaily1Ur1 |        -11 |     070000 |     5 |
      | OTDaily1Ur1 |        -11 |     140000 |     4 |
      | OTDaily1Ur1 |        -11 |     170000 |     3 |
      | OTDaily1Ur1 |        -12 |     050000 |     5 |
      | OTDaily1Ur1 |        -12 |     060000 |     4 |
      | OTDaily1Ur1 |        -12 |     073000 |     3 |
      | OTDaily1Ur1 |        -12 |     150000 |     6 |
      | OTDaily1Ur1 |        -13 |     050000 |     5 |
      | OTDaily1Ur1 |        -13 |     060000 |     4 |
      | OTDaily1Ur1 |        -13 |     090000 |     3 |
      | OTDaily1Ur1 |        -13 |     150000 |     6 |
      | OTDaily1Ur1 |        -14 |     070000 |     5 |
      | OTDaily1Ur1 |        -14 |     160000 |     4 |
      | OTDaily1Ur1 |        -14 |     170000 |     3 |
      | OTDaily1Ur1 |        -14 |     180000 |     6 |
      | OTDaily1Ur1 |        -15 |     070000 |     5 |
      | OTDaily1Ur1 |        -15 |     140000 |     4 |
      | OTDaily1Ur1 |        -15 |     170000 |     3 |
      | OTDaily1Ur1 |        -15 |     180000 |     6 |
      | OTDaily1Ur1 |        -16 |     070000 |     5 |
      | OTDaily1Ur1 |        -16 |     080000 |     2 |
      | OTDaily1Ur1 |        -16 |     100000 |     3 |
      | OTDaily1Ur1 |        -16 |     150000 |     6 |
      | OTDaily1Ur1 |        -17 |     070000 |     5 |
      | OTDaily1Ur1 |        -17 |     080000 |     4 |
      | OTDaily1Ur1 |        -17 |     100000 |     1 |
      | OTDaily1Ur1 |        -17 |     150000 |     6 |
      | OTDaily1Ur1 |        -18 |     050000 |     5 |
      | OTDaily1Ur1 |        -18 |     060000 |     4 |
      | OTDaily1Ur1 |        -18 |     160000 |     2 |
      | OTDaily1Ur1 |        -18 |     180000 |     6 |
      | OTDaily1Ur1 |        -19 |     050000 |     3 |
      | OTDaily1Ur1 |        -19 |     120000 |       |
      | OTDaily1Ur1 |        -19 |     130000 |       |
      | OTDaily1Ur1 |        -19 |     180000 |     4 |
      | OTDaily1Ur1 |        -20 |     050000 |     3 |
      | OTDaily1Ur1 |        -20 |     120000 |       |
      | OTDaily1Ur1 |        -20 |     130000 |       |
      | OTDaily1Ur1 |        -20 |     150000 |     4 |
      | OTDaily1Ur1 |        -21 |     070000 |     3 |
      | OTDaily1Ur1 |        -21 |     120000 |       |
      | OTDaily1Ur1 |        -21 |     130000 |       |
      | OTDaily1Ur1 |        -21 |     180000 |     4 |
      | OTDaily1Ur1 |        -22 |     050000 |     3 |
      | OTDaily1Ur1 |        -22 |     060000 |     4 |
      | OTDaily1Ur1 |        -22 |     070000 |     5 |
      | OTDaily1Ur1 |        -22 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     070000 |     5 |
      | OTDaily1Ur1 |        -23 |     150000 |     6 |
      | OTDaily1Ur1 |        -23 |     160000 |     3 |
      | OTDaily1Ur1 |        -23 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 07:00 | 08:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |   -5 | 14:30 | 15:00 | 00:30            | 00:30           | Short Leave      | Approved |
      |   -6 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -7 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -8 |       |       |                  |                 |                  | No Data  |
      |   -9 |       |       |                  |                 |                  | No Data  |
      |  -10 | 16:00 | 16:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -11 | 14:00 | 15:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -12 | 06:00 | 07:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |  -13 | 06:00 | 09:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -14 | 16:00 | 17:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -15 | 14:00 | 17:00 | 03:00            | 03:00           | Short Leave      | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -16 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Official Hours   | Approved |
      |  -17 | 08:00 | 10:00 | 02:00            | 02:00           | Short Leave      | Approved |
      |  -18 | 06:00 | 16:00 | 10:00            | 10:00           | Short Leave      | Approved |
      |  -19 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -19 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -20 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -21 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |  -22 | 06:00 | 07:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 15:00 | 16:00 | 01:00            | 01:00           | Short Leave      | Approved |
      |  -23 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-19" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |  -23 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    | SHORT LEAVE |
      |  -22 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -21 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |  -20 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -19 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |  -18 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       | 10:00              | SHORT LEAVE |
      |  -17 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -16 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |
      |  -15 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -14 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -13 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 03:00              | SHORT LEAVE |
      |  -12 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 01:30              | SHORT LEAVE |
      |  -11 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -10 | BA-WO/PH | 07:00    | 17:00    | WO       | WO       |                    |             |
      |  -09 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -08 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |  -07 | BA-WO/PH | 07:00    | 16:00    | WO       | WO       |                    |             |
      |  -06 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       |                    |             |
      |  -05 | BA-WO/PH | 07:00    | 14:30    | WO       | WO       | 00:30              | SHORT LEAVE |
      |  -04 | BA-WO/PH | 08:00    | 15:00    | WO       | WO       | 01:00              | SHORT LEAVE |
      |  -03 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -02 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 04:00              |             |
      |  -01 | BA-WO/PH | 07:00    | 15:00    | WO       | WO       | 02:00              | SHORT LEAVE |

  @FIT2975_36
  Scenario: Short Leave Punches for WO/PH, Configured Break= yes, Overtime Policy with only Short Leave Configuration, 4 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | OTDaily1Ur1 |
    And Delete "BA" shift schedule
    And Delete "BA" shift
    And Delete Overtime Policy from TnA module
      | Name        |
      | OTPlcDaily1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue                             | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue                            | Validation         |
      | BA      | 07:00     | 15:00   | 04:00   | 08:00   | 11:00      | 12:00    | true                | true                    | Configured Break If Less, Else Actual Break Duration | true                     | Configured Break If Less, Else Actual Break Duration | Saved Successfully |
    And Create Shift Schedule "BA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | BA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "BA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | OTDaily1AtdPlc1 |                4 | true                      | true                        | true                 |                      1000 |                        3 | true                 |               1 |             900 | true                 | false            | true               | Saved Successfully |
    And Create NetWork Hours Policy "OTPlcDaily1"
      | WorkComponent                         | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift               |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                              |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Prior Shift      |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Within Shift     |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration Post Shift       |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Prior Shift  |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Official In/Out Duration Post Shift   |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName     | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | validation         |
      | OTPlcDaily1 | OTPlcDaily1    |                   |                    | True      | WO,PH,WO/PH |                | Daily 1    | false           | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily1"
      | WorkComponent                     | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays    |
      | Short Leave Duration Prior Shift  |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Within Shift |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
      | Short Leave Duration Post Shift   |      0000 |    2359 |      0000 | OT1        |   1.00 | WO,PH,WO/PH,FB,RD |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc   | OvertimePlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTDaily1Ur1 | True   |                | True      |                        4 | Only Overtime     | OTDaily1AtdPlc1 | OTPlcDaily1 | BA            | BA         | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Change Shift via API
      | userid      | FromDt | ToDt | shift-id | week-off | public-holiday |
      | OTDaily1Ur1 |     -6 |   -1 |          |        1 |              1 |
    And Set event via Event Set API
      | Userid      | event-date | event-time | Spfid |
      | OTDaily1Ur1 |         -6 |     050000 |     3 |
      | OTDaily1Ur1 |         -6 |     060000 |     4 |
      | OTDaily1Ur1 |         -6 |     070000 |     5 |
      | OTDaily1Ur1 |         -6 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     070000 |     5 |
      | OTDaily1Ur1 |         -5 |     150000 |     6 |
      | OTDaily1Ur1 |         -5 |     160000 |     3 |
      | OTDaily1Ur1 |         -5 |     180000 |     4 |
      | OTDaily1Ur1 |         -4 |     050000 |     5 |
      | OTDaily1Ur1 |         -4 |     060000 |     4 |
      | OTDaily1Ur1 |         -4 |     140000 |     3 |
      | OTDaily1Ur1 |         -4 |     150000 |     6 |
      | OTDaily1Ur1 |         -3 |     050000 |     3 |
      | OTDaily1Ur1 |         -3 |     120000 |       |
      | OTDaily1Ur1 |         -3 |     130000 |       |
      | OTDaily1Ur1 |         -3 |     180000 |     4 |
      | OTDaily1Ur1 |         -2 |     050000 |     3 |
      | OTDaily1Ur1 |         -2 |     120000 |       |
      | OTDaily1Ur1 |         -2 |     130000 |       |
      | OTDaily1Ur1 |         -2 |     150000 |     4 |
      | OTDaily1Ur1 |         -1 |     070000 |     3 |
      | OTDaily1Ur1 |         -1 |     120000 |       |
      | OTDaily1Ur1 |         -1 |     130000 |       |
      | OTDaily1Ur1 |         -1 |     180000 |     4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | OTDaily1Ur1 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | OTDaily1Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | OTDaily1Ur1 | admin    | Welcome OTDaily1Ur1 |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 07:00 | 07:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -1 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -2 | 15:00 | 15:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -3 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -4 | 06:00 | 14:00 | 08:00            | 07:00           | Short Leave      | Approved |
      |   -5 | 15:00 | 16:00 | 01:00            | 00:00           | Short Leave      | Approved |
      |   -5 | 18:00 | 18:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 05:00 | 05:00 | 00:00            | 00:00           | Short Leave      | Approved |
      |   -6 | 06:00 | 07:00 | 01:00            | 00:00           | Short Leave      | Approved |
    And Daily Attendance View for period "Date" on "-7" and "0" in ESS
      | Date | Shift    | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Remark      |
      |   -6 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -5 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
      |   -4 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       | 07:00              | SHORT LEAVE |
      |   -3 | BA-WO/PH | 05:00    | 18:00    | WO       | WO       |                    |             |
      |   -2 | BA-WO/PH | 05:00    | 15:00    | WO       | WO       |                    |             |
      |   -1 | BA-WO/PH | 07:00    | 18:00    | WO       | WO       |                    |             |
