@tag
Feature: TnA Short Lv - Official Hrs Restrictions
  I want to use this template for my feature file

  @SLOH_1
  Scenario: Duration Check Per Short Leave Entry = Disable - Short Lv Check In Atd Period = Disable -  Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     091500 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     200000 |
      | ShLvOffHrsRes |         -2 |     103000 |
      | ShLvOffHrsRes |         -2 |     110000 |
      | ShLvOffHrsRes |         -2 |     111000 |
      | ShLvOffHrsRes |         -2 |     163000 |
      | ShLvOffHrsRes |         -2 |     164000 |
      | ShLvOffHrsRes |         -2 |     200000 |
      | ShLvOffHrsRes |         -3 |     120000 |
      | ShLvOffHrsRes |         -3 |     130000 |
      | ShLvOffHrsRes |         -3 |     131000 |
      | ShLvOffHrsRes |         -3 |     163000 |
      | ShLvOffHrsRes |         -3 |     164000 |
      | ShLvOffHrsRes |         -3 |     200000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |              -2 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |              -3 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 09:00 | 10:30 | 01:30            | 01:30           | Short Leave      | Approved |
      |   -3 | 09:00 | 12:00 | 03:00            | 03:00           | Short Leave      | Approved |

  @SLOH_2
  Scenario: Duration Check Per Short Leave Entry = Disable - Short Lv Check In Atd Period = Disable -  Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     070000 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     174500 |
      | ShLvOffHrsRes |         -2 |     070000 |
      | ShLvOffHrsRes |         -2 |     110000 |
      | ShLvOffHrsRes |         -2 |     111000 |
      | ShLvOffHrsRes |         -2 |     163000 |
      | ShLvOffHrsRes |         -3 |     070000 |
      | ShLvOffHrsRes |         -3 |     130000 |
      | ShLvOffHrsRes |         -3 |     131000 |
      | ShLvOffHrsRes |         -3 |     150000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |              -2 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |              -3 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 17:45 | 18:00 | 00:15            | 00:15           | Short Leave      | Approved |
      |   -2 | 16:30 | 18:00 | 01:30            | 01:30           | Short Leave      | Approved |
      |   -3 | 15:00 | 18:00 | 03:00            | 03:00           | Short Leave      | Approved |

  @SLOH_3
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min <10 - Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     090700 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     200000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:07 | 00:07            | 00:00           | Short Leave      | Approved |

  @SLOH_4
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min <10 - Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     080000 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     175300 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 17:53 | 18:00 | 00:07            | 00:00           | Short Leave      | Approved |

  @SLOH_5
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min >10 & <30 - Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     091500 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     200000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |

  @SLOH_6
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min >10 & <30 - Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     080000 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     174500 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 17:45 | 18:00 | 00:15            | 00:15           | Short Leave      | Approved |

  @SLOH_7
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min >30 - - Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     094500 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     200000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 09:00 | 09:45 | 00:45            | 00:00           | Short Leave      | Approved |

  @SLOH_8
  Scenario: Duration Check Per Short Leave Entry = Enable - Min Duration 10 - Max Duration 30 - Application min >30 - - Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              30 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |         -1 |     080000 |
      | ShLvOffHrsRes |         -1 |     100000 |
      | ShLvOffHrsRes |         -1 |     101000 |
      | ShLvOffHrsRes |         -1 |     163000 |
      | ShLvOffHrsRes |         -1 |     164000 |
      | ShLvOffHrsRes |         -1 |     171500 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |              -1 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      |   -1 | 17:15 | 18:00 | 00:45            | 00:00           | Short Leave      | Approved |

  @SLOH_9
  Scenario: Short Lv Check In Atd Period = Enable - Max Minutes Allowed 60 min -  Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     093000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 01/01/2024 | 09:30    | 18:00    | PR       | PR       | SHORT LEAVE |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | SHORT LEAVE |
      | 03/01/2024 | 09:30    | 18:00    | AB       | PR       | SHORT LEAVE |

  @SLOH_10
  Scenario: Short Lv Check In Atd Period = Enable - Max Minutes Allowed 60 min -  Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     173000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | SHORT LEAVE |

  @SLOH_11
  Scenario: Short Lv Check In Atd Period = Enable - Max Minutes Allowed 60 min -  Short Leave In & Out Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:00    | 17:30    | PR       | AB       | 07:30      | SHORT LEAVE |

  @SLOH_12
  Scenario: Short Lv Check In Atd Period = Enable - Max Minutes Allowed 60 min -  Short Leave In & Out Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091500 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     174500 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     091500 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     174500 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      | 01/01/2024 | 17:45 | 18:00 | 00:15            | 00:15           | Short Leave      | Approved |
      | 02/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 09:00 | 09:15 | 00:15            | 00:15           | Short Leave      | Approved |
      | 03/01/2024 | 17:45 | 18:00 | 00:15            | 00:15           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:15    | 17:45    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:15    | 17:45    | AB       | AB       | 07:30      | SHORT LEAVE |

  @SLOH_13
  Scenario: Short Lv Check In Atd Period = Enable - Max Minutes Allowed 60 min -  Short Leave In & Out 4Punch Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                       99 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     123000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     123000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 12:30 | 14:00 | 01:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 12:30 | 14:00 | 01:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:00    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:00    | 18:00    | AB       | PR       | 07:30      | SHORT LEAVE |

  @SLOH_14
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave In
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     093000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     093000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |

  @SLOH_15
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave Out
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     173000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     173000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |

  @SLOH_16
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave In & Out Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
      | ShLvOffHrsRes |   04012024 |     093000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 17:30 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |

  @SLOH_17
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave In & Out Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     174500 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     091500 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     174500 |
      | ShLvOffHrsRes |   04012024 |     093000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
      | 17:45 | ShortLeave OUT  | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason       |
      | 09:30 | ShortLeave IN   | ByAutomation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason       |
      | 09:15 | ShortLeave IN   | ByAutomation |
      | 17:45 | ShortLeave OUT  | ByAutomation |

  @SLOH_18
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave In & Out 4Punch Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     123000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     123000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     123000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 12:30 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:30 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 12:30 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 12:30 | ShortLeave OUT  | Automation |

  @SLOH_19
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 -  Short Leave In & Out 4Punch Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                     99999 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091500 |
      | ShLvOffHrsRes |   01012024 |     123000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     174500 |
      | ShLvOffHrsRes |   02012024 |     093000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:15 | ShortLeave IN   | Automation |
      | 12:30 | ShortLeave OUT  | Automation |
      | 17:45 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 09:30 | ShortLeave IN   | Automation |

  @SLOH_20
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 - Max Minutes Allowed 60 min - Short Leave In & Out Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     173000 |
      | ShLvOffHrsRes |   03012024 |     093000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid4 | reason-4     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |
      | 03/01/2024 | 09:30    | 18:00    | AB       | PR       | 07:30      | SHORT LEAVE |

  @SLOH_21
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 - Max Minutes Allowed 60 min - Short Leave In & Out Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     091000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     175000 |
      | ShLvOffHrsRes |   03012024 |     091000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     175000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:10 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 17:50 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:10 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 17:50 | ShortLeave OUT  | Automation |

  @SLOH_22
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 - Max Minutes Allowed 60 min - Short Leave In & Out Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | True                 |                        60 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     092000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     174000 |
      | ShLvOffHrsRes |   03012024 |     092000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     130000 |
      | ShLvOffHrsRes |   04012024 |     140000 |
      | ShLvOffHrsRes |   04012024 |     174000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:20 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 17:40 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:20 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "04/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 17:40 | ShortLeave OUT  | Automation |

  @SLOH_23
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 3 - Max Minutes Allowed 60 min & Duration Check Per Short Leave Entry = Enable - Min Duration 20 - Max Duration 30 - Case1 Count check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              20 |              30 | True                 |                        60 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     092500 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     175000 |
      | ShLvOffHrsRes |   03012024 |     091000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     092500 |
      | ShLvOffHrsRes |   04012024 |     110000 |
      | ShLvOffHrsRes |   04012024 |     113000 |
      | ShLvOffHrsRes |   04012024 |     160000 |
      | ShLvOffHrsRes |   04012024 |     163000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
      | ShLvOffHrsRes |   05012024 |     090000 |
      | ShLvOffHrsRes |   05012024 |     110000 |
      | ShLvOffHrsRes |   05012024 |     113000 |
      | ShLvOffHrsRes |   05012024 |     160000 |
      | ShLvOffHrsRes |   05012024 |     163000 |
      | ShLvOffHrsRes |   05012024 |     173500 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        04012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        05012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:25 | 00:25            | 00:25           | Short Leave      | Approved |
      | 02/01/2024 | 17:50 | 18:00 | 00:10            | 00:00           | Short Leave      | Approved |
      | 03/01/2024 | 09:00 | 09:10 | 00:10            | 00:00           | Short Leave      | Approved |
      | 04/01/2024 | 09:00 | 09:25 | 00:25            | 00:25           | Short Leave      | Approved |
      | 05/01/2024 | 17:35 | 18:00 | 00:25            | 00:25           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:25    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE      |
      | 02/01/2024 | 09:00    | 17:50    | PR       | AB       | 07:50      | AB:Early-OUT     |
      | 03/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | AB:Less Work Hrs |
      | 04/01/2024 | 09:25    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE      |
      | 05/01/2024 | 09:00    | 17:35    | PR       | AB       | 07:35      | SHORT LEAVE      |

  @SLOH_24
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 4 - Max Minutes Allowed 60 min & Duration Check Per Short Leave Entry = Enable - Min Duration 20 - Max Duration 30 - Case2 Per Entry Limit check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              20 |              30 | True                 |                        60 |                        4 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     080000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     172500 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     173000 |
      | ShLvOffHrsRes |   04012024 |     092500 |
      | ShLvOffHrsRes |   04012024 |     110000 |
      | ShLvOffHrsRes |   04012024 |     113000 |
      | ShLvOffHrsRes |   04012024 |     160000 |
      | ShLvOffHrsRes |   04012024 |     163000 |
      | ShLvOffHrsRes |   04012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        04012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 17:25 | 18:00 | 00:35            | 00:00           | Short Leave      | Approved |
      | 03/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 04/01/2024 | 09:00 | 09:25 | 00:25            | 00:25           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark       |
      | 01/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE  |
      | 02/01/2024 | 08:00    | 17:25    | PR       | AB       | 08:25      | AB:Early-OUT |
      | 03/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE  |
      | 04/01/2024 | 09:25    | 18:00    | AB       | PR       | 07:35      | SHORT LEAVE  |

  @SLOH_25
  Scenario: Short Lv Check In Atd Period = Enable - Max Count Allowed 4 - Max Minutes Allowed 60 min & Duration Check Per Short Leave Entry = Enable - Min Duration 20 - Max Duration 30 - Case3 Atd period limit check
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              20 |              30 | True                 |                        60 |                        4 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     110000 |
      | ShLvOffHrsRes |   01012024 |     113000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     110000 |
      | ShLvOffHrsRes |   02012024 |     113000 |
      | ShLvOffHrsRes |   02012024 |     160000 |
      | ShLvOffHrsRes |   02012024 |     163000 |
      | ShLvOffHrsRes |   02012024 |     173000 |
      | ShLvOffHrsRes |   03012024 |     091000 |
      | ShLvOffHrsRes |   03012024 |     110000 |
      | ShLvOffHrsRes |   03012024 |     113000 |
      | ShLvOffHrsRes |   03012024 |     160000 |
      | ShLvOffHrsRes |   03012024 |     163000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
      | ShLvOffHrsRes |   04012024 |     090000 |
      | ShLvOffHrsRes |   04012024 |     110000 |
      | ShLvOffHrsRes |   04012024 |     113000 |
      | ShLvOffHrsRes |   04012024 |     160000 |
      | ShLvOffHrsRes |   04012024 |     163000 |
      | ShLvOffHrsRes |   04012024 |     173500 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        02012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
      | ShLvOffHrsRes |        03012024 |      2 | ByAutomation |        |              | ShLvOffHrsRes |
      | ShLvOffHrsRes |        04012024 |        |              |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 02/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
      | 03/01/2024 | 09:00 | 09:10 | 00:10            | 00:00           | Short Leave      | Approved |
      | 04/01/2024 | 17:35 | 18:00 | 00:25            | 00:25           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark           |
      | 01/01/2024 | 09:30    | 18:00    | PR       | PR       | 08:00      | SHORT LEAVE      |
      | 02/01/2024 | 09:00    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE      |
      | 03/01/2024 | 09:10    | 18:00    | PR       | AB       | 07:50      | AB:Less Work Hrs |
      | 04/01/2024 | 09:00    | 17:35    | PR       | AB       | 07:35      | SHORT LEAVE      |

  @SLOH_26
  Scenario: Consider Grace In Short Leave - For Shift Late-IN Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                    15 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | True                | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:15 | 09:30 | 00:15            | 00:15           | Short Leave      | Approved |

  @SLOH_27
  Scenario: Consider Grace In Short Leave - For Break Late-IN Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                  15 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | True                 | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     143000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid3 | reason-3     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 13:00 | 14:30 | 01:30            | 00:15           | Short Leave      | Approved |

  @SLOH_28
  Scenario: Consider Grace In Short Leave - For Shift Early-OUT Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                      15 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | True                | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 17:30 | 17:45 | 00:15            | 00:15           | Short Leave      | Approved |

  @SLOH_29
  Scenario: Consider Grace In Short Leave - For Break Early-OUT Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                    15 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | True                 | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     090000 |
      | ShLvOffHrsRes |   01012024 |     123000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 12:30 | 14:00 | 01:30            | 00:15           | Short Leave      | Approved |

  @SLOH_30
  Scenario: Short Leave Authorization Required = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | True          | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Pending |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Pending |
    When Approve Reject ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | Authorization-for | Verdict | remark        | ricID |
      | ShLvOffHrsRes |        01012024 |                 2 |       1 | ShortApproved | SA    |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |

  @SLOH_31
  Scenario: Short Leave Authorization Required = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |

  @SLOH_32
  Scenario: Add Short Leave Hours In Work Hours = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:30    | 17:30    | PR       | PR       | 08:00      | SHORT LEAVE |

  @SLOH_33
  Scenario: Add Short Leave Hours In Work Hours = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      2 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Short Leave      | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:30    | 17:30    | PR       | AB       | 07:00      | SHORT LEAVE |

  @SLOH_34
  Scenario: Official IN/OUT Authorization Required = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | True          | True                 | True             | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      1 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status  |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Official Hours   | Pending |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Pending |
    When Approve Reject ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | Authorization-for | Verdict | remark           | ricID |
      | ShLvOffHrsRes |        01012024 |                 1 |       1 | OfficialApproved | SA    |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Official Hours   | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |

  @SLOH_35
  Scenario: Official IN/OUT Authorization Required = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      1 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Official Hours   | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |

  @SLOH_36
  Scenario: Add Official Hours In Work Hours = Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | True               |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      1 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Official Hours   | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark   |
      | 01/01/2024 | 09:30    | 17:30    | PR       | PR       | 08:00      | OFFICIAL |

  @SLOH_37
  Scenario: Add Official Hours In Work Hours = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | False                | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      1 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Official Hours   | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark   |
      | 01/01/2024 | 09:30    | 17:30    | PR       | AB       | 07:00      | OFFICIAL |

  @SLOH_38
  Scenario: Short Leave Authorization Required = Enable & Official IN/OUT Authorization Required = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | True          | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Pending  |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |
    When Approve Reject ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | Authorization-for | Verdict | remark        | ricID |
      | ShLvOffHrsRes |        01012024 |                 2 |       1 | ShortApproved | SA    |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |

  @SLOH_39
  Scenario: Add Short Leave Hours In Work Hours = Enable & Add Official Hours In Work Hours = Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | False                |                 |                 | False                |                           |                          | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               | N-Punch                  | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     093000 |
      | ShLvOffHrsRes |   01012024 |     100000 |
      | ShLvOffHrsRes |   01012024 |     103000 |
      | ShLvOffHrsRes |   01012024 |     160000 |
      | ShLvOffHrsRes |   01012024 |     163000 |
      | ShLvOffHrsRes |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid        | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | appliedBy     |
      | ShLvOffHrsRes |        01012024 |      2 | ByAutomation |      1 | ByAutomation | ShLvOffHrsRes |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:30 | 00:30            | 00:30           | Short Leave      | Approved |
      | 01/01/2024 | 17:30 | 18:00 | 00:30            | 00:30           | Official Hours   | Approved |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark      |
      | 01/01/2024 | 09:30    | 17:30    | PR       | AB       | 07:30      | SHORT LEAVE |

  @SLOH_40
  Scenario: Range Based Short leave Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              60 | True                 |                       240 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Range Based Short Leave configuration for Attendance policy "ShLvOffHrsRes"
      | RangeFrom | RangeTo | Deduction |
      |        10 |      30 |         1 |
      |        31 |      60 |         2 |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
      | ShLvOffHrsRes |   02012024 |     092000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
      | ShLvOffHrsRes |   03012024 |     091500 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:45 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:20 | ShortLeave IN   | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "03/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 09:15 | ShortLeave IN   | Automation |

  @SLOH_41
  Scenario: Range Based Short leave Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | ShLvOffHrsRes |                4 | True                 |              10 |              60 | True                 |                       240 |                        3 | False               | False               | False                | False                | False         | True                 | False            | False              |                       | Saved Successfully |
    And Range Based Short Leave configuration for Attendance policy "ShLvOffHrsRes"
      | RangeFrom | RangeTo | Deduction |
      |        10 |      30 |         1 |
      |        31 |      60 |         2 |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     174000 |
      | ShLvOffHrsRes |   02012024 |     091500 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     180000 |
    And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    When ShortLeave OfficialInOut Application from ESS on AttendanceDate= "01/01/2024" then validate "Saved Successfully"
      | Time  | SpecialFunction | Reason     |
      | 09:45 | ShortLeave IN   | Automation |
      | 17:40 | ShortLeave OUT  | Automation |
    And ShortLeave OfficialInOut Application from ESS on AttendanceDate= "02/01/2024" then validate "Available Short Leave Count is less"
      | Time  | SpecialFunction | Reason     |
      | 09:15 | ShortLeave IN   | Automation |
    Then Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 09:00 | 09:45 | 00:45            | 00:45           | Short Leave      | Approved |
      | 01/01/2024 | 17:40 | 18:00 | 00:20            | 00:20           | Short Leave      | Approved |

  @SLOH_42
  Scenario: Auto Attendance Correction - Short Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | AutoAtdCorrectShrtLv | validation         |
      | ShLvOffHrsRes |                4 | False                | False                | False         | True                 | False            | True               | True                 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc     | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark     |
      | 01/01/2024 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 01/01/2024 | 09:45    | 18:00    | PR       | PR       | SHORT LEAVE |

      @SLOH_43
  Scenario: Auto Attendance Correction - Official
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Late-In Policy
      | Name          | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | ShLvOffHrsRes | True             |        30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | AutoAtdCorrectOfficialHrs | validation         |
      | ShLvOffHrsRes |                4 | False                | False                | False         | True                 | False            | True               | True                 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | LateInPlc     | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes | ShLvOffHrsRes | ZC            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     094500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     180000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 01/01/2024 | 09:45    | 18:00    | AB       | PR       | AB:Late-IN	 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 01/01/2024 | 09:45    | 18:00    | PR       | PR       | OFFICIAL |
      
      @SLOH_44
  Scenario: Auto Attendance Correction - Short Leave 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID        |
      | ShLvOffHrsRes |
    And Delete "ZC" shift schedule
    And Delete "ZC" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | GrcTimeforBrkLateIN | OverlapBrkLateIn | GrcTimeforBrkEarlyOut | OverlapBrkEarlyOut | Validation         |
      | ZC      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | False               | False             | False             | False              |                     0 | False              |                       0 | False                |                   0 | False            |                     0 | False              | Saved Successfully |
    And Create Shift Schedule "ZC" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZC      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZC"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod |MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | AutoAtdCorrectShrtLv | validation         |
      | ShLvOffHrsRes |                4 | False                | True                 | 999                      | 2                        | False         | True                 | False            | True               | True                 | Saved Successfully |
    And Create user from user configuration
      | userid        | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc     | ShiftSchedule | Validation         |
      | ShLvOffHrsRes | True   | True      | True      | True      | True      | True               |                        4 | ShLvOffHrsRes  | ZC            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    And Set event via Event Set API
      | Userid        | event-date | event-time |
      | ShLvOffHrsRes |   01012024 |     092500 |
      | ShLvOffHrsRes |   01012024 |     130000 |
      | ShLvOffHrsRes |   01012024 |     140000 |
      | ShLvOffHrsRes |   01012024 |     175000 |
      | ShLvOffHrsRes |   02012024 |     090000 |
      | ShLvOffHrsRes |   02012024 |     130000 |
      | ShLvOffHrsRes |   02012024 |     140000 |
      | ShLvOffHrsRes |   02012024 |     175000 |
      | ShLvOffHrsRes |   03012024 |     090000 |
      | ShLvOffHrsRes |   03012024 |     130000 |
      | ShLvOffHrsRes |   03012024 |     140000 |
      | ShLvOffHrsRes |   03012024 |     175000 |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark     |
      | 01/01/2024 | 09:25    | 17:50    | PR       | AB       | AB:Early-OUT |
      | 02/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |
      | 03/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID        |
      | ShLvOffHrsRes |
    Then Daily Attendance View for userid "ShLvOffHrsRes" and period "Month" on "January" and "2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark      |
      | 01/01/2024 | 09:25    | 17:50    | PR       | PR       | SHORT LEAVE |
      | 02/01/2024 | 09:00    | 17:50    | PR       | PR       | SHORT LEAVE |
      | 03/01/2024 | 09:00    | 17:50    | PR       | AB       | AB:Early-OUT |
      And Set Password via API
      | Userid        | user-verified-for-password | new-password | type |
      | ShLvOffHrsRes |                          1 | admin        |    1 |
      And Logout from Cosec Web
    And Login with user
      | username      | password | Validation            |
      | ShLvOffHrsRes | admin    | Welcome ShLvOffHrsRes |
    And Verify ShortLeave Or Official InOut Application from ESS login
      | Date       | Start | End   | Applied Duration | Posted Duration | Special Function | Status   |
      | 01/01/2024 | 17:50 | 18:00 | 00:10            | 00:35           | Short Leave      | Approved |
      | 02/01/2024 | 17:50 | 18:00 | 00:10            | 00:10           | Short Leave      | Approved |