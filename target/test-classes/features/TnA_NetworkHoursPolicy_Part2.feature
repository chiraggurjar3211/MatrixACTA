@tag
Feature: Network Hours Policy
  I want to use this template for my feature file

  @NWHP_135
  Scenario: Network Hrs Policy - Short Leave Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     103000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   04012024 |     110000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3     | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |              |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      2 | ByAutomation |        |              |        |              |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |              |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |      2 | ByAutomation |      2 | ByAutomation |      2 | ByAutomation |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 11:00    | 16:00    | 04:00    |

  @NWHP_136
  Scenario: Network Hrs Policy - Short Leave Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3     | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |              |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      2 | ByAutomation |        |              |        |              |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |      2 | ByAutomation |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |      2 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:30    | 16:00    | 02:30    |

  @NWHP_137
  Scenario: Network Hrs Policy - Short Leave Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      2 | ByAutomation |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      2 | ByAutomation |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_138
  Scenario: Network Hrs Policy - Short Leave Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |

  @NWHP_139
  Scenario: Network Hrs Policy - Short Leave Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_140
  Scenario: Network Hrs Policy - Short Leave Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Short Leave Duration |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_141
  Scenario: Network Hrs Policy - Short Leave Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_142
  Scenario: Network Hrs Policy - Short Leave Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_143
  Scenario: Network Hrs Policy - Short Leave Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_144
  Scenario: Network Hrs Policy - Short Leave Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Short Leave Duration |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |

  @NWHP_145
  Scenario: Network Hrs Policy - Short Leave Duration - ApplicableDays - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        05012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        06012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        07012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        05012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        06012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        07012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_146
  Scenario: Network Hrs Policy - Short Leave Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        05012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        06012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        07012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        05012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        06012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        07012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 10:00    | 18:00    |          |

  @NWHP_147
  Scenario: Network Hrs Policy - Short Leave Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |

  @NWHP_148
  Scenario: Network Hrs Policy - Short Leave Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      2 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_149
  Scenario: Network Hrs Policy - Short Leave Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |

  @NWHP_150
  Scenario: Network Hrs Policy - Short Leave Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent        | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Short Leave Duration |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Short Leave Duration |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     123000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     123000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     143000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      2 | ByAutomation |        |              |        |          |      2 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      2 | ByAutomation |      2 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |

  @NWHP_151
  Scenario: Network Hrs Policy - Official IN/OUT Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     103000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   04012024 |     110000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3     | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |              |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      1 | ByAutomation |        |              |        |              |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |              |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |      1 | ByAutomation |      1 | ByAutomation |      1 | ByAutomation |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 11:00    | 16:00    | 04:00    |

  @NWHP_152
  Scenario: Network Hrs Policy - Official IN/OUT Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3     | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |              |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      1 | ByAutomation |        |              |        |              |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |      1 | ByAutomation |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |      1 | ByAutomation |        |              |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:30    | 16:00    | 02:30    |

  @NWHP_153
  Scenario: Network Hrs Policy - Official IN/OUT Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      1 | ByAutomation |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      1 | ByAutomation |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_154
  Scenario: Network Hrs Policy - Official IN/OUT Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |

  @NWHP_155
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_156
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_157
  Scenario: Network Hrs Policy - Official IN/OUT Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_158
  Scenario: Network Hrs Policy - Official IN/OUT Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_159
  Scenario: Network Hrs Policy - Official IN/OUT Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_160
  Scenario: Network Hrs Policy - Official IN/OUT Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Official IN/OUT Duration |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |

  @NWHP_161
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ApplicableDays - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        05012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        06012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        07012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        05012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        06012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        07012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_162
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        04012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        05012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        06012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        07012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        04012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        05012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        06012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        07012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 10:00    | 18:00    |          |

  @NWHP_163
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |

  @NWHP_164
  Scenario: Network Hrs Policy - Official IN/OUT Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        02012024 |        |              |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChk |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        02012024 |        |              |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
      | NetWrkHrsPlcChN |        03012024 |      1 | ByAutomation |        |              |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_165
  Scenario: Network Hrs Policy - Official IN/OUT Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |

  @NWHP_166
  Scenario: Network Hrs Policy - Official IN/OUT Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent            | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Official IN/OUT Duration |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Official IN/OUT Duration |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | DurChkPerShrtLvEntry | ShrtLvChkInAtdPeriod | ShrtLvGrcForShiftLI | ShrtLvGrcForShiftEO | ShrtLvGrcForShiftBLI | ShrtLvGrcForShiftBEO | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | validation         |
      | NetWrkHrsPlcChk |                4 | False                | False                | False               | False               | False                | False                | False         | True                 | False            | False              | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc   | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | NetWrkHrsPlcChk |                          1 | admin        |    1 |
      | NetWrkHrsPlcChN |                          1 | admin        |    1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     123000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     123000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     143000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid          | Attendance-date | spfid1 | reason-1     | spfid2 | reason-2     | spfid3 | reason-3 | spfid4 | reason-4     | appliedBy       |
      | NetWrkHrsPlcChk |        01012024 |      1 | ByAutomation |        |              |        |          |      1 | ByAutomation | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |        01012024 |      1 | ByAutomation |      1 | ByAutomation |        |          |        |              | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |

  @NWHP_167
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     103000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     170000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 12:00             | 13:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 15:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 12:00             | 13:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 15:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 17:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |

  @NWHP_168
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 14:00             | 14:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 14:00             | 14:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |

  @NWHP_169
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_170
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |

  @NWHP_171
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_172
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Hourly Paid Leave Duration |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_173
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_174
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_175
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_176
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Hourly Paid Leave Duration |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 15:30             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 14:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 15:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 14:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |

  @NWHP_177
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ApplicableDays - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   05012024 | 05012024 | ZE         |                     1 |        05012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   06012024 | 06012024 | ZE         |                     1 |        06012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   07012024 | 07012024 | ZE         |                     1 |        07012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZE         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   05012024 | 05012024 | ZE         |                     1 |        05012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   06012024 | 06012024 | ZE         |                     1 |        06012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   07012024 | 07012024 | ZE         |                     1 |        07012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_178
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    And Apply Leave Application from leave module
      | userid          | ConsiInTermsOf | AtdDate    | FromDate   | ToDate     | FromTime | ToTime | Leave            | Validation                   |
      | NetWrkHrsPlcChk | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 04/01/2024 | 04/01/2024 | 04/01/2024 | 16:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 05/01/2024 | 05/01/2024 | 05/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 06/01/2024 | 06/01/2024 | 06/01/2024 | 15:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 07/01/2024 | 07/01/2024 | 07/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 04/01/2024 | 04/01/2024 | 04/01/2024 | 16:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 05/01/2024 | 05/01/2024 | 05/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 06/01/2024 | 06/01/2024 | 06/01/2024 | 15:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 07/01/2024 | 07/01/2024 | 07/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 10:00    | 18:00    |          |

  @NWHP_179
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application from leave module
      | userid          | ConsiInTermsOf | AtdDate    | FromDate   | ToDate     | FromTime | ToTime | Leave            | Validation                   |
      | NetWrkHrsPlcChk | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZE - ZE_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZE - ZE_NWHrsChk | No more absent records exist |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_180
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZE         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZE         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_181
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |

  @NWHP_182
  Scenario: Network Hrs Policy - Hourly Paid Leave Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZE      | ZE_NWHrsChk | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZE_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZE      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent              | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Paid Leave Duration |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Hourly Paid Leave Duration |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZE_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Credit_Debit_Encash Leave via API
      | userid          | entry-type | credit-mode | leave-code | period | month   | year | remark | hours  |
      | NetWrkHrsPlcChk |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
      | NetWrkHrsPlcChN |          0 |           0 | ZE         |      0 | January | 2024 | credit | 100:00 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     123000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     123000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     143000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 14:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZE         |                     1 |        01012024 | 14:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |

  @NWHP_183
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     103000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     103000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     170000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 12:00             | 13:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 15:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 12:00             | 13:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 15:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 17:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 01:00    |
      | 02/01/2024 | 10:00    | 16:00    | 03:00    |
      | 03/01/2024 | 10:30    | 16:00    | 03:30    |
      | 04/01/2024 | 10:00    | 17:00    | 04:00    |

  @NWHP_184
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 14:00             | 14:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 14:00             | 14:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 16:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 10:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 16:00    | 02:30    |

  @NWHP_185
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 11:00    | 18:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_186
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 15:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 11:00    | 18:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 12:00    | 18:00    | 01:00    |

  @NWHP_187
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_188
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Hourly Unpaid Leave Duration |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 11:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 11:00    | 18:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_189
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_190
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_191
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 12:00    | 18:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_192
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Hourly Unpaid Leave Duration |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 15:30             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 14:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 15:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 14:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 12:30    | 14:30    | 03:00    |

  @NWHP_193
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ApplicableDays - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   05012024 | 05012024 | ZF         |                     1 |        05012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   06012024 | 06012024 | ZF         |                     1 |        06012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   07012024 | 07012024 | ZF         |                     1 |        07012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 12:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   04012024 | 04012024 | ZF         |                     1 |        04012024 | 14:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   05012024 | 05012024 | ZF         |                     1 |        05012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   06012024 | 06012024 | ZF         |                     1 |        06012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   07012024 | 07012024 | ZF         |                     1 |        07012024 | 09:00             | 12:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 12:00    | 18:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 10:00    | 18:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_194
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    And Apply Leave Application from leave module
      | userid          | ConsiInTermsOf | AtdDate    | FromDate   | ToDate     | FromTime | ToTime | Leave            | Validation                   |
      | NetWrkHrsPlcChk | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 04/01/2024 | 04/01/2024 | 04/01/2024 | 16:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 05/01/2024 | 05/01/2024 | 05/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 06/01/2024 | 06/01/2024 | 06/01/2024 | 15:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 07/01/2024 | 07/01/2024 | 07/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 04/01/2024 | 04/01/2024 | 04/01/2024 | 16:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 05/01/2024 | 05/01/2024 | 05/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 06/01/2024 | 06/01/2024 | 06/01/2024 | 15:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 07/01/2024 | 07/01/2024 | 07/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 10:00    | 18:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 10:00    | 18:00    |          |

  @NWHP_195
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application from leave module
      | userid          | ConsiInTermsOf | AtdDate    | FromDate   | ToDate     | FromTime | ToTime | Leave            | Validation                   |
      | NetWrkHrsPlcChk | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChk | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 01/01/2024 | 01/01/2024 | 01/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 02/01/2024 | 02/01/2024 | 02/01/2024 | 17:00    | 18:00  | ZF - ZF_NWHrsChk | No more absent records exist |
      | NetWrkHrsPlcChN | Hourly         | 03/01/2024 | 03/01/2024 | 03/01/2024 | 09:00    | 10:00  | ZF - ZF_NWHrsChk | No more absent records exist |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_196
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChk |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 10:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   02012024 | 02012024 | ZF         |                     1 |        02012024 | 16:00             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   03012024 | 03012024 | ZF         |                     1 |        03012024 | 09:00             | 10:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 18:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 10:00    | 18:00    |          |

  @NWHP_197
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     093000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 09:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 17:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 17:30    | 02:00    |

  @NWHP_198
  Scenario: Network Hrs Policy - Hourly Unpaid Leave Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName   | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZF      | ZF_NWHrsChk | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "ZF_NWHrsChk" with Pro-rata "False"
      | LeaveID |
      | ZF      |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent                | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Hourly Unpaid Leave Duration |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Hourly Unpaid Leave Duration |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | LeaveGroup  | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | ZF_NWHrsChk | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     123000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     123000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     143000 |
    And Apply Leave Application via API
      | userid          | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChk |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 14:30             | 18:00           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 09:00             | 12:30           | SA        |
      | NetWrkHrsPlcChN |                  4 |   01012024 | 01012024 | ZF         |                     1 |        01012024 | 14:30             | 18:00           | SA        |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 12:30    | 14:30    | 16:00    |

  @NWHP_199
  Scenario: Network Hrs Policy - Adjusted Work Hours
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     170000 |
      | NetWrkHrsPlcChk |   07012024 |     110000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     170000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     120000 |
      | NetWrkHrsPlcChk |   08012024 |     150000 |
      | NetWrkHrsPlcChk |   08012024 |     173000 |
      | NetWrkHrsPlcChk |   09012024 |     100000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     150000 |
      | NetWrkHrsPlcChk |   09012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     170000 |
      | NetWrkHrsPlcChN |   07012024 |     110000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     170000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     120000 |
      | NetWrkHrsPlcChN |   08012024 |     150000 |
      | NetWrkHrsPlcChN |   08012024 |     173000 |
      | NetWrkHrsPlcChN |   09012024 |     100000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     150000 |
      | NetWrkHrsPlcChN |   09012024 |     170000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 17:00    | 02:00    |
      | 07/01/2024 | 11:00    | 17:00    | 03:00    |
      | 08/01/2024 | 10:00    | 17:30    | 03:30    |
      | 09/01/2024 | 10:00    | 17:00    | 04:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 17:00    | 02:00    |
      | 07/01/2024 | 11:00    | 17:00    | 03:00    |
      | 08/01/2024 | 10:00    | 17:30    | 03:30    |
      | 09/01/2024 | 10:00    | 17:00    | 04:00    |

  @NWHP_200
  Scenario: Network Hrs Policy - Adjusted Work Hours - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     170000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     143000 |
      | NetWrkHrsPlcChk |   08012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     090000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     170000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     143000 |
      | NetWrkHrsPlcChN |   08012024 |     160000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    |          |
      | 07/01/2024 | 10:00    | 16:00    | 02:00    |
      | 08/01/2024 | 10:00    | 16:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    |          |
      | 07/01/2024 | 10:00    | 16:00    | 02:00    |
      | 08/01/2024 | 10:00    | 16:00    | 02:30    |

  @NWHP_201
  Scenario: Network Hrs Policy - Adjusted Work Hours - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     170000 |
      | NetWrkHrsPlcChk |   07012024 |     110000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChk |   08012024 |     090000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     090000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     170000 |
      | NetWrkHrsPlcChN |   07012024 |     110000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   08012024 |     090000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     150000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    | 01:00    |
      | 07/01/2024 | 11:00    | 18:00    | 02:00    |
      | 08/01/2024 | 09:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    | 01:00    |
      | 07/01/2024 | 11:00    | 18:00    | 02:00    |
      | 08/01/2024 | 09:00    | 15:00    | 02:00    |

  @NWHP_202
  Scenario: Network Hrs Policy - Adjusted Work Hours - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     170000 |
      | NetWrkHrsPlcChk |   07012024 |     110000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChk |   08012024 |     090000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     150000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChk |   09012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     090000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     170000 |
      | NetWrkHrsPlcChN |   07012024 |     110000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   08012024 |     090000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     150000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   09012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    |          |
      | 07/01/2024 | 11:00    | 18:00    | 01:00    |
      | 08/01/2024 | 09:00    | 15:00    | 01:00    |
      | 09/01/2024 | 12:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:00    | 17:00    |          |
      | 07/01/2024 | 11:00    | 18:00    | 01:00    |
      | 08/01/2024 | 09:00    | 15:00    | 01:00    |
      | 09/01/2024 | 12:00    | 18:00    | 01:00    |

  @NWHP_203
  Scenario: Network Hrs Policy - Adjusted Work Hours - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     120000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     120000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 12:00    | 18:00    |          |
      | 09/01/2024 | 09:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 12:00    | 18:00    |          |
      | 09/01/2024 | 09:00    | 14:00    |          |

  @NWHP_204
  Scenario: Network Hrs Policy - Adjusted Work Hours - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Adjusted Work Hours |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     093000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     110000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     093000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     110000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:30    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    | 01:00    |
      | 08/01/2024 | 11:00    | 18:00    | 01:00    |
      | 09/01/2024 | 09:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:30    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    | 01:00    |
      | 08/01/2024 | 11:00    | 18:00    | 01:00    |
      | 09/01/2024 | 09:00    | 14:00    | 01:00    |

  @NWHP_205
  Scenario: Network Hrs Policy - Adjusted Work Hours - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     120000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     120000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    | 02:00    |
      | 08/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    | 02:00    |
      | 08/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_206
  Scenario: Network Hrs Policy - Adjusted Work Hours - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     120000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     120000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 12:00    | 18:00    | 02:00    |
      | 09/01/2024 | 09:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 12:00    | 18:00    | 02:00    |
      | 09/01/2024 | 09:00    | 14:00    | 03:00    |

  @NWHP_207
  Scenario: Network Hrs Policy - Adjusted Work Hours - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     120000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     120000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     120000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     120000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    | 01:00    |
      | 07/01/2024 | 09:00    | 16:00    | 02:00    |
      | 08/01/2024 | 12:00    | 18:00    | 02:00    |
      | 09/01/2024 | 09:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "09/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    | 01:00    |
      | 07/01/2024 | 09:00    | 16:00    | 02:00    |
      | 08/01/2024 | 12:00    | 18:00    | 02:00    |
      | 09/01/2024 | 09:00    | 14:00    | 02:00    |

  @NWHP_208
  Scenario: Network Hrs Policy - Adjusted Work Hours - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Adjusted Work Hours |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     153000 |
      | NetWrkHrsPlcChk |   08012024 |     123000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     153000 |
      | NetWrkHrsPlcChN |   08012024 |     123000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     143000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 15:30    | 02:30    |
      | 08/01/2024 | 12:30    | 14:30    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 15:30    | 02:30    |
      | 08/01/2024 | 12:30    | 14:30    | 03:00    |

  @NWHP_209
  Scenario: Network Hrs Policy - Adjusted Work Hours - ApplicableDays - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChk |   09012024 |     160000 |
      | NetWrkHrsPlcChk |   10012024 |     120000 |
      | NetWrkHrsPlcChk |   10012024 |     130000 |
      | NetWrkHrsPlcChk |   10012024 |     140000 |
      | NetWrkHrsPlcChk |   10012024 |     180000 |
      | NetWrkHrsPlcChk |   11012024 |     090000 |
      | NetWrkHrsPlcChk |   11012024 |     120000 |
      | NetWrkHrsPlcChk |   11012024 |     130000 |
      | NetWrkHrsPlcChk |   11012024 |     140000 |
      | NetWrkHrsPlcChk |   12012024 |     100000 |
      | NetWrkHrsPlcChk |   12012024 |     130000 |
      | NetWrkHrsPlcChk |   12012024 |     140000 |
      | NetWrkHrsPlcChk |   12012024 |     180000 |
      | NetWrkHrsPlcChk |   13012024 |     090000 |
      | NetWrkHrsPlcChk |   13012024 |     130000 |
      | NetWrkHrsPlcChk |   13012024 |     140000 |
      | NetWrkHrsPlcChk |   13012024 |     160000 |
      | NetWrkHrsPlcChk |   14012024 |     120000 |
      | NetWrkHrsPlcChk |   14012024 |     130000 |
      | NetWrkHrsPlcChk |   14012024 |     140000 |
      | NetWrkHrsPlcChk |   14012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   09012024 |     160000 |
      | NetWrkHrsPlcChN |   10012024 |     120000 |
      | NetWrkHrsPlcChN |   10012024 |     130000 |
      | NetWrkHrsPlcChN |   10012024 |     140000 |
      | NetWrkHrsPlcChN |   10012024 |     180000 |
      | NetWrkHrsPlcChN |   11012024 |     090000 |
      | NetWrkHrsPlcChN |   11012024 |     120000 |
      | NetWrkHrsPlcChN |   11012024 |     130000 |
      | NetWrkHrsPlcChN |   11012024 |     140000 |
      | NetWrkHrsPlcChN |   12012024 |     100000 |
      | NetWrkHrsPlcChN |   12012024 |     130000 |
      | NetWrkHrsPlcChN |   12012024 |     140000 |
      | NetWrkHrsPlcChN |   12012024 |     180000 |
      | NetWrkHrsPlcChN |   13012024 |     090000 |
      | NetWrkHrsPlcChN |   13012024 |     130000 |
      | NetWrkHrsPlcChN |   13012024 |     140000 |
      | NetWrkHrsPlcChN |   13012024 |     160000 |
      | NetWrkHrsPlcChN |   14012024 |     120000 |
      | NetWrkHrsPlcChN |   14012024 |     130000 |
      | NetWrkHrsPlcChN |   14012024 |     140000 |
      | NetWrkHrsPlcChN |   14012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "08/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 08/01/2024 | 10:00    | 18:00    | 01:00    |
      | 09/01/2024 | 09:00    | 16:00    |          |
      | 10/01/2024 | 12:00    | 18:00    | 03:00    |
      | 11/01/2024 | 09:00    | 14:00    |          |
      | 12/01/2024 | 10:00    | 18:00    | 01:00    |
      | 13/01/2024 | 09:00    | 16:00    |          |
      | 14/01/2024 | 12:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "08/01/2024" and "14/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 08/01/2024 | 10:00    | 18:00    | 01:00    |
      | 09/01/2024 | 09:00    | 16:00    |          |
      | 10/01/2024 | 12:00    | 18:00    | 03:00    |
      | 11/01/2024 | 09:00    | 14:00    |          |
      | 12/01/2024 | 10:00    | 18:00    | 01:00    |
      | 13/01/2024 | 09:00    | 16:00    |          |
      | 14/01/2024 | 12:00    | 18:00    | 03:00    |

  @NWHP_210
  Scenario: Network Hrs Policy - Adjusted Work Hours - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 07/01/2024 | 07/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 09/01/2024 | 09/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 11/01/2024 | 11/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 07/01/2024 | 07/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 09/01/2024 | 09/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 11/01/2024 | 11/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     170000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChk |   09012024 |     090000 |
      | NetWrkHrsPlcChk |   09012024 |     130000 |
      | NetWrkHrsPlcChk |   09012024 |     140000 |
      | NetWrkHrsPlcChk |   09012024 |     160000 |
      | NetWrkHrsPlcChk |   10012024 |     100000 |
      | NetWrkHrsPlcChk |   10012024 |     130000 |
      | NetWrkHrsPlcChk |   10012024 |     140000 |
      | NetWrkHrsPlcChk |   10012024 |     180000 |
      | NetWrkHrsPlcChk |   11012024 |     090000 |
      | NetWrkHrsPlcChk |   11012024 |     130000 |
      | NetWrkHrsPlcChk |   11012024 |     140000 |
      | NetWrkHrsPlcChk |   11012024 |     150000 |
      | NetWrkHrsPlcChk |   12012024 |     100000 |
      | NetWrkHrsPlcChk |   12012024 |     130000 |
      | NetWrkHrsPlcChk |   12012024 |     140000 |
      | NetWrkHrsPlcChk |   12012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     170000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   09012024 |     090000 |
      | NetWrkHrsPlcChN |   09012024 |     130000 |
      | NetWrkHrsPlcChN |   09012024 |     140000 |
      | NetWrkHrsPlcChN |   09012024 |     160000 |
      | NetWrkHrsPlcChN |   10012024 |     100000 |
      | NetWrkHrsPlcChN |   10012024 |     130000 |
      | NetWrkHrsPlcChN |   10012024 |     140000 |
      | NetWrkHrsPlcChN |   10012024 |     180000 |
      | NetWrkHrsPlcChN |   11012024 |     090000 |
      | NetWrkHrsPlcChN |   11012024 |     130000 |
      | NetWrkHrsPlcChN |   11012024 |     140000 |
      | NetWrkHrsPlcChN |   11012024 |     150000 |
      | NetWrkHrsPlcChN |   12012024 |     100000 |
      | NetWrkHrsPlcChN |   12012024 |     130000 |
      | NetWrkHrsPlcChN |   12012024 |     140000 |
      | NetWrkHrsPlcChN |   12012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "12/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 17:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |
      | 09/01/2024 | 09:00    | 16:00    |          |
      | 10/01/2024 | 10:00    | 18:00    |          |
      | 11/01/2024 | 09:00    | 15:00    |          |
      | 12/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "12/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 17:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |
      | 09/01/2024 | 09:00    | 16:00    |          |
      | 10/01/2024 | 10:00    | 18:00    |          |
      | 11/01/2024 | 09:00    | 15:00    |          |
      | 12/01/2024 | 10:00    | 18:00    |          |

  @NWHP_211
  Scenario: Network Hrs Policy - Adjusted Work Hours - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 07/01/2024 | 07/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 08/01/2024 | 08/01/2024 |          |        1 |              1 |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChN | 07/01/2024 | 07/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 08/01/2024 | 08/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     170000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     170000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 17:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 17:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |

  @NWHP_212
  Scenario: Network Hrs Policy - Adjusted Work Hours - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 07/01/2024 | 07/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 06/01/2024 | 06/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 07/01/2024 | 07/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     100000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   08012024 |     100000 |
      | NetWrkHrsPlcChk |   08012024 |     130000 |
      | NetWrkHrsPlcChk |   08012024 |     140000 |
      | NetWrkHrsPlcChk |   08012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     100000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     160000 |
      | NetWrkHrsPlcChN |   08012024 |     100000 |
      | NetWrkHrsPlcChN |   08012024 |     130000 |
      | NetWrkHrsPlcChN |   08012024 |     140000 |
      | NetWrkHrsPlcChN |   08012024 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "08/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 10:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 16:00    |          |
      | 08/01/2024 | 10:00    | 18:00    |          |

  @NWHP_213
  Scenario: Network Hrs Policy - Adjusted Work Hours - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     093000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     173000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     093000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     173000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:30    | 17:30    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 09:30    | 17:30    | 02:00    |

  @NWHP_214
  Scenario: Network Hrs Policy - Adjusted Work Hours - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName         | MaxPunchesToCons | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | NetWrkHrsPlcChk |                4 | True                   |               1 | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False              |             |                          | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | False            |           |                          | Saved Successfully |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent       | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Adjusted Work Hours |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Adjusted Work Hours |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | True      | All     | Daily 1    | True            | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AttendancePlc   | LateInPlc       | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      |                        4 | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | N-Punch                  | Both              | True      | True      | True      | True               | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     050000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     050000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     220000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     050000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     220000 |
      | NetWrkHrsPlcChk |   06012024 |     123000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     050000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     050000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     220000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     050000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     220000 |
      | NetWrkHrsPlcChN |   06012024 |     123000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     143000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "06/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 12:30    | 14:30    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "06/01/2024" and "06/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 06/01/2024 | 12:30    | 14:30    | 16:00    |

@NWHP_215
  Scenario: Network Hrs Policy - Award Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |             -10 |         10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |          -10 |     10|     
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 |  
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0330 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0330 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 03:00    |
      |   -2 | 09:00    | 18:00    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 03:00    |
      |   -2 | 09:00    | 18:00    | 03:30    |

  @NWHP_216
  Scenario: Network Hrs Policy - Award Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0330 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0330 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:30    |

  @NWHP_217
  Scenario: Network Hrs Policy - Award Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |         -10 |      10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | N1      |         -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:00    |

  @NWHP_218
  Scenario: Network Hrs Policy - Award Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |          -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     150000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     150000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    | 01:00    |
      |   -3 | 09:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    | 01:00    |
      |   -3 | 09:00    | 18:00    | 01:00    |

  @NWHP_219
  Scenario: Network Hrs Policy - Award Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |        -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    |          |
      |   -3 | 09:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    |          |
      |   -3 | 09:00    | 18:00    |          |

  @NWHP_220
  Scenario: Network Hrs Policy - Award Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Award Duration |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0030 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0030 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    | 01:00    |
      |   -3 | 09:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    | 01:00    |
      |   -3 | 09:00    | 18:00    | 01:00    |

  @NWHP_221
  Scenario: Network Hrs Policy - Award Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 03:00    |

  @NWHP_222
  Scenario: Network Hrs Policy - Award Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |         -10 |         10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |        -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    | 02:00    |
      |   -3 | 09:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    | 02:00    |
      |   -3 | 09:00    | 18:00    | 03:00    |

  @NWHP_223
  Scenario: Network Hrs Policy - Award Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |           -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 |  
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 |      
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0300 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0400 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:00    |
      |   -3 | 09:00    | 18:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    | 02:00    |
      |   -3 | 09:00    | 18:00    | 02:00    |

  @NWHP_224
  Scenario: Network Hrs Policy - Award Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Award Duration |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0230 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0700 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0230 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0700 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:30    |
      |   -2 | 09:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 02:30    |
      |   -2 | 09:00    | 18:00    | 03:00    |

  #@NWHP_225
  #Scenario: Network Hrs Policy - Award Duration - ApplicableDays - Case1
  #Given Open Cosec Web
  #And Login with user
  #| username | password | Validation           |
  #| sa       | admin    | Welcome System Admin |
  #And Delete user via API
  #| UserID          |
  #| NetWrkHrsPlcChk |
  #And Delete Overtime Policy from TnA module
  #| Name            |
  #| NetWrkHrsPlcChk |
  #And Delete Project from Job Processing and Costing
  #| ProjectName |
  #| NWHrsChk    |
  #And Delete Phase from Job Processing and Costing
  #| PhaseName |
  #| NWHrsChk  |
  #And Delete Job from Job Processing and Costing
  #| JobCode |
  #| N1      |
  #And Delete "ZE" shift schedule
  #And Delete "ZE" shift
  #And Create shift in Shift Configuration
  #| ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
  #| ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
  #And Create Shift Schedule "ZE" with Start Date "01/01/2010"
  #| ShiftID | RepeatShiftDays |
  #| ZE      |               7 |
  #And Configure Off Day Configuration in Shift Schedule "ZE"
  #| OffDay1 |
  #| None    |
  #And Create NetWork Hours Policy "NetWrkHrsPlcChk"
  #| WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
  #| Award Duration |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
  #And Create Overtime Policy
  #| PlcName         | NetWorkPlcName  | validation         |
  #| NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
  #And Create user from user configuration
  #| userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
  #| NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
  #And Create Job from Job Processing and Costing
  #| Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | ChangeDate |
  #| N1   | N1   |     01012024 |   20012024 |        0050000 | Saved Successfully | 01/01/2024 |
  #And Create Phase from Job Processing and Costing
  #| Name     | Description | Validation         |
  #| NWHrsChk | NWHrsChk    | Saved Successfully |
  #And Create Project "NWHrsChk" with StartDate "01012024" and EndDate "20012024" from Job Processing and Costing
  #| CodeOfPhaseConfig | Phase    | StartDate | EndDate  | ChangeDate |
  #| NWHrsChk          | NWHrsChk |  01012024 | 20012024 | 01/01/2024 |
  #And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
  #| JobCode | StartDate | EndDate  | ChangeDate |
  #| N1      |  01012024 | 20012024 | 01/01/2024 |
  #And Run Shift Process for Month = "January" and Year = "2024"
  #| UserID          |
  #| NetWrkHrsPlcChk |
  #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
  #| UserID          |
  #| NetWrkHrsPlcChk |
  #When Set event via Event Set API
  #| Userid          | event-date | event-time |
  #| NetWrkHrsPlcChk |   01012024 |     090000 |
  #| NetWrkHrsPlcChk |   01012024 |     130000 |
  #| NetWrkHrsPlcChk |   01012024 |     140000 |
  #| NetWrkHrsPlcChk |   01012024 |     180000 |
  #| NetWrkHrsPlcChk |   02012024 |     090000 |
  #| NetWrkHrsPlcChk |   02012024 |     130000 |
  #| NetWrkHrsPlcChk |   02012024 |     140000 |
  #| NetWrkHrsPlcChk |   02012024 |     180000 |
  #| NetWrkHrsPlcChk |   03012024 |     090000 |
  #| NetWrkHrsPlcChk |   03012024 |     130000 |
  #| NetWrkHrsPlcChk |   03012024 |     140000 |
  #| NetWrkHrsPlcChk |   03012024 |     180000 |
  #| NetWrkHrsPlcChk |   04012024 |     090000 |
  #| NetWrkHrsPlcChk |   04012024 |     130000 |
  #| NetWrkHrsPlcChk |   04012024 |     140000 |
  #| NetWrkHrsPlcChk |   04012024 |     180000 |
  #| NetWrkHrsPlcChk |   05012024 |     090000 |
  #| NetWrkHrsPlcChk |   05012024 |     130000 |
  #| NetWrkHrsPlcChk |   05012024 |     140000 |
  #| NetWrkHrsPlcChk |   05012024 |     180000 |
  #| NetWrkHrsPlcChk |   06012024 |     090000 |
  #| NetWrkHrsPlcChk |   06012024 |     130000 |
  #| NetWrkHrsPlcChk |   06012024 |     140000 |
  #| NetWrkHrsPlcChk |   06012024 |     180000 |
  #| NetWrkHrsPlcChk |   07012024 |     090000 |
  #| NetWrkHrsPlcChk |   07012024 |     130000 |
  #| NetWrkHrsPlcChk |   07012024 |     140000 |
  #| NetWrkHrsPlcChk |   07012024 |     180000 |
  #And Apply Timesheet Correction Application from SA login
  #| userid          | attendance-date | job-code | Validation         |
  #| NetWrkHrsPlcChk |        01012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        02012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        03012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        04012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        05012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        06012024 | N1       | Saved Successfully |
  #| NetWrkHrsPlcChk |        07012024 | N1       | Saved Successfully |
  #And Assign Award Penalty Hours from SA login
  #| Userid          | Date     | AdjustmentType | Hours | Remark       | Validation         |
  #| NetWrkHrsPlcChk | 01012024 | Award          |  0100 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 02012024 | Award          |  0200 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 03012024 | Award          |  0300 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 04012024 | Award          |  0400 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 05012024 | Award          |  0100 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 06012024 | Award          |  0200 | AwardGranted | Saved Successfully |
  #| NetWrkHrsPlcChk | 07012024 | Award          |  0300 | AwardGranted | Saved Successfully |
  #And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "01012024" To "31012024"
  #| UserID          |
  #| NetWrkHrsPlcChk |
  #Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01012024" and "07012024"
  #| Date       | First IN | Last OUT | Net-Work |
  #| 01/01/2024 | 09:00    | 18:00    | 01:00    |
  #| 02/01/2024 | 09:00    | 18:00    |          |
  #| 03/01/2024 | 09:00    | 18:00    | 03:00    |
  #| 04/01/2024 | 09:00    | 18:00    |          |
  #| 05/01/2024 | 09:00    | 18:00    | 01:00    |
  #| 06/01/2024 | 09:00    | 18:00    |          |
  #| 07/01/2024 | 09:00    | 18:00    | 03:00    |
  @NWHP_226
  Scenario: Network Hrs Policy - Award Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |     -1 |   -1 |          |        1 |                |
      | NetWrkHrsPlcChk |     -3 |   -3 |          |          |              1 |
      | NetWrkHrsPlcChk |     -5 |   -5 |          |        1 |              1 |
      | NetWrkHrsPlcChN |     -1 |   -1 |          |        1 |                |
      | NetWrkHrsPlcChN |     -3 |   -3 |          |          |              1 |
      | NetWrkHrsPlcChN |     -5 |   -5 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChk |         -4 |     090000 |
      | NetWrkHrsPlcChk |         -4 |     130000 |
      | NetWrkHrsPlcChk |         -4 |     140000 |
      | NetWrkHrsPlcChk |         -4 |     180000 |
      | NetWrkHrsPlcChk |         -5 |     090000 |
      | NetWrkHrsPlcChk |         -5 |     130000 |
      | NetWrkHrsPlcChk |         -5 |     140000 |
      | NetWrkHrsPlcChk |         -5 |     180000 |
      | NetWrkHrsPlcChk |         -6 |     090000 |
      | NetWrkHrsPlcChk |         -6 |     130000 |
      | NetWrkHrsPlcChk |         -6 |     140000 |
      | NetWrkHrsPlcChk |         -6 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
      | NetWrkHrsPlcChN |         -4 |     090000 |
      | NetWrkHrsPlcChN |         -4 |     130000 |
      | NetWrkHrsPlcChN |         -4 |     140000 |
      | NetWrkHrsPlcChN |         -4 |     180000 |
      | NetWrkHrsPlcChN |         -5 |     090000 |
      | NetWrkHrsPlcChN |         -5 |     130000 |
      | NetWrkHrsPlcChN |         -5 |     140000 |
      | NetWrkHrsPlcChN |         -5 |     180000 |
      | NetWrkHrsPlcChN |         -6 |     090000 |
      | NetWrkHrsPlcChN |         -6 |     130000 |
      | NetWrkHrsPlcChN |         -6 |     140000 |
      | NetWrkHrsPlcChN |         -6 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -4 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -5 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -6 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -4 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -5 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -6 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -4 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -5 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -6 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -4 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -5 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -6 | Award          |  0100 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    |          |
      |   -3 | 09:00    | 18:00    | 01:00    |
      |   -4 | 09:00    | 18:00    |          |
      |   -5 | 09:00    | 18:00    | 01:00    |
      |   -6 | 09:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    | 01:00    |
      |   -2 | 09:00    | 18:00    |          |
      |   -3 | 09:00    | 18:00    | 01:00    |
      |   -4 | 09:00    | 18:00    |          |
      |   -5 | 09:00    | 18:00    | 01:00    |
      |   -6 | 09:00    | 18:00    |          |

  @NWHP_227
  Scenario: Network Hrs Policy - Award Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |         10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |      0 |    0 |          |        1 |                |
      | NetWrkHrsPlcChk |     -1 |   -1 |          |          |              1 |
      | NetWrkHrsPlcChk |     -2 |   -2 |          |        1 |              1 |
      | NetWrkHrsPlcChN |      0 |    0 |          |        1 |                |
      | NetWrkHrsPlcChN |     -1 |   -1 |          |          |              1 |
      | NetWrkHrsPlcChN |     -2 |   -2 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    |          |
      |   -1 | 09:00    | 18:00    |          |
      |   -2 | 09:00    | 18:00    | 01:00    |

  @NWHP_228
  Scenario: Network Hrs Policy - Award Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |      0 |    0 | FB       |          |                |
      | NetWrkHrsPlcChk |     -1 |   -1 | RD       |          |                |
      | NetWrkHrsPlcChN |      0 |    0 | FB       |          |                |
      | NetWrkHrsPlcChN |     -1 |   -1 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Award          |  0200 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Award          |  0100 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 01:00    |
      |   -1 | 09:00    | 18:00    | 02:00    |
      |   -2 | 09:00    | 18:00    |          |

  @NWHP_229
  Scenario: Network Hrs Policy - Award Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |           -10 |         10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |         10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |         10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0100 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 02:00    |

  @NWHP_230
  Scenario: Network Hrs Policy - Award Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent  | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Award Duration |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Award Duration |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |           -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark       | Validation         |
      | NetWrkHrsPlcChk |    0 | Award          |  0700 | AwardGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Award          |  0700 | AwardGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 16:00    |

  @NWHP_231
  Scenario: Network Hrs Policy - Penalty Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |         10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0330 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0330 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 05:00    |
      |   -2 | 09:00    | 18:00    | 04:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 05:00    |
      |   -2 | 09:00    | 18:00    | 04:30    |

  @NWHP_232
  Scenario: Network Hrs Policy - Penalty Duration - RangeFrom - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |           -10 |      10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |        -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0330 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0330 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 05:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 05:30    |

  @NWHP_233
  Scenario: Network Hrs Policy - Penalty Duration - RangeTo - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |         -10 |      10 |      
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |

  @NWHP_234
  Scenario: Network Hrs Policy - Penalty Duration - RangeTo - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |           -10 |      10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |         -10 |      10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | N1      |         -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     150000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     150000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |

  @NWHP_235
  Scenario: Network Hrs Policy - Penalty Duration - ConsiderAs - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |         -10 |      10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | N1      |       -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |
      |   -3 | 09:00    | 18:00    | 08:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |
      |   -3 | 09:00    | 18:00    | 08:00    |

  @NWHP_236
  Scenario: Network Hrs Policy - Penalty Duration - ConsiderAs - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0030 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0030 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-4" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |

  @NWHP_237
  Scenario: Network Hrs Policy - Penalty Duration - MinDurReq - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |           -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 05:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 05:00    |

  @NWHP_238
  Scenario: Network Hrs Policy - Penalty Duration - MinDurReq - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 |    
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 |  
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |
      |   -3 | 09:00    | 18:00    | 05:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |
      |   -3 | 09:00    | 18:00    | 05:00    |

  @NWHP_239
  Scenario: Network Hrs Policy - Penalty Duration - MinDurReq - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |        -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |
      |   -3 | 09:00    | 18:00    | 06:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 06:00    |
      |   -3 | 09:00    | 18:00    | 06:00    |

  @NWHP_240
  Scenario: Network Hrs Policy - Penalty Duration - MinDurReq - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Penalty Duration        |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0230 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0230 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 05:30    |
      |   -2 | 09:00    | 18:00    | 05:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 05:30    |
      |   -2 | 09:00    | 18:00    | 05:00    |

  #@NWHP_241
  #Scenario: Network Hrs Policy - Penalty Duration - ApplicableDays - Case1
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Delete user via API
      #| UserID          |
      #| NetWrkHrsPlcChk |
      #| NetWrkHrsPlcChN |
    #And Delete Overtime Policy from TnA module
      #| Name            |
      #| NetWrkHrsPlcChk |
    #And Delete Project from Job Processing and Costing
      #| ProjectName |
      #| NWHrsChk    |
    #And Delete Phase from Job Processing and Costing
      #| PhaseName |
      #| NWHrsChk  |
    #And Delete Job from Job Processing and Costing
      #| JobCode |
      #| N1      |
    #And Delete "ZE" shift schedule
    #And Delete "ZE" shift
    #And Create shift in Shift Configuration
      #| ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      #| ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    #And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      #| ShiftID | RepeatShiftDays |
      #| ZE      |               7 |
    #And Configure Off Day Configuration in Shift Schedule "ZE"
      #| OffDay1 |
      #| None    |
    #And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      #| WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      #| Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Penalty Duration        |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    #And Create Overtime Policy
      #| PlcName         | NetWorkPlcName  | validation         |
      #| NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    #And Create user from user configuration
      #| userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      #| NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      #| NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    #And Create Job from Job Processing and Costing
      #| Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | ChangeDate |
      #| N1   | N1   |     01012024 |   20012024 |        0050000 | Saved Successfully | 01/01/2024 |
    #And Create Phase from Job Processing and Costing
      #| Name     | Description | Validation         |
      #| NWHrsChk | NWHrsChk    | Saved Successfully |
    #And Create Project "NWHrsChk" with StartDate "01012024" and EndDate "20012024" from Job Processing and Costing
      #| CodeOfPhaseConfig | Phase    | StartDate | EndDate  | ChangeDate |
      #| NWHrsChk          | NWHrsChk |  01012024 | 20012024 | 01/01/2024 |
    #And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      #| JobCode | StartDate | EndDate  | ChangeDate |
      #| N1      |  01012024 | 20012024 | 01/01/2024 |
    #And Run Shift Process for Month = "January" and Year = "2024"
      #| UserID          |
      #| NetWrkHrsPlcChk |
      #| NetWrkHrsPlcChN |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      #| UserID          |
      #| NetWrkHrsPlcChk |
      #| NetWrkHrsPlcChN |
    #When Set event via Event Set API
      #| Userid          | event-date | event-time |
      #| NetWrkHrsPlcChk |   01012024 |     090000 |
      #| NetWrkHrsPlcChk |   01012024 |     130000 |
      #| NetWrkHrsPlcChk |   01012024 |     140000 |
      #| NetWrkHrsPlcChk |   01012024 |     180000 |
      #| NetWrkHrsPlcChk |   02012024 |     090000 |
      #| NetWrkHrsPlcChk |   02012024 |     130000 |
      #| NetWrkHrsPlcChk |   02012024 |     140000 |
      #| NetWrkHrsPlcChk |   02012024 |     180000 |
      #| NetWrkHrsPlcChk |   03012024 |     090000 |
      #| NetWrkHrsPlcChk |   03012024 |     130000 |
      #| NetWrkHrsPlcChk |   03012024 |     140000 |
      #| NetWrkHrsPlcChk |   03012024 |     180000 |
      #| NetWrkHrsPlcChk |   04012024 |     090000 |
      #| NetWrkHrsPlcChk |   04012024 |     130000 |
      #| NetWrkHrsPlcChk |   04012024 |     140000 |
      #| NetWrkHrsPlcChk |   04012024 |     180000 |
      #| NetWrkHrsPlcChk |   05012024 |     090000 |
      #| NetWrkHrsPlcChk |   05012024 |     130000 |
      #| NetWrkHrsPlcChk |   05012024 |     140000 |
      #| NetWrkHrsPlcChk |   05012024 |     180000 |
      #| NetWrkHrsPlcChk |   06012024 |     090000 |
      #| NetWrkHrsPlcChk |   06012024 |     130000 |
      #| NetWrkHrsPlcChk |   06012024 |     140000 |
      #| NetWrkHrsPlcChk |   06012024 |     180000 |
      #| NetWrkHrsPlcChk |   07012024 |     090000 |
      #| NetWrkHrsPlcChk |   07012024 |     130000 |
      #| NetWrkHrsPlcChk |   07012024 |     140000 |
      #| NetWrkHrsPlcChk |   07012024 |     180000 |
      #| NetWrkHrsPlcChN |   01012024 |     090000 |
      #| NetWrkHrsPlcChN |   01012024 |     130000 |
      #| NetWrkHrsPlcChN |   01012024 |     140000 |
      #| NetWrkHrsPlcChN |   01012024 |     180000 |
      #| NetWrkHrsPlcChN |   02012024 |     090000 |
      #| NetWrkHrsPlcChN |   02012024 |     130000 |
      #| NetWrkHrsPlcChN |   02012024 |     140000 |
      #| NetWrkHrsPlcChN |   02012024 |     180000 |
      #| NetWrkHrsPlcChN |   03012024 |     090000 |
      #| NetWrkHrsPlcChN |   03012024 |     130000 |
      #| NetWrkHrsPlcChN |   03012024 |     140000 |
      #| NetWrkHrsPlcChN |   03012024 |     180000 |
      #| NetWrkHrsPlcChN |   04012024 |     090000 |
      #| NetWrkHrsPlcChN |   04012024 |     130000 |
      #| NetWrkHrsPlcChN |   04012024 |     140000 |
      #| NetWrkHrsPlcChN |   04012024 |     180000 |
      #| NetWrkHrsPlcChN |   05012024 |     090000 |
      #| NetWrkHrsPlcChN |   05012024 |     130000 |
      #| NetWrkHrsPlcChN |   05012024 |     140000 |
      #| NetWrkHrsPlcChN |   05012024 |     180000 |
      #| NetWrkHrsPlcChN |   06012024 |     090000 |
      #| NetWrkHrsPlcChN |   06012024 |     130000 |
      #| NetWrkHrsPlcChN |   06012024 |     140000 |
      #| NetWrkHrsPlcChN |   06012024 |     180000 |
      #| NetWrkHrsPlcChN |   07012024 |     090000 |
      #| NetWrkHrsPlcChN |   07012024 |     130000 |
      #| NetWrkHrsPlcChN |   07012024 |     140000 |
      #| NetWrkHrsPlcChN |   07012024 |     180000 |
    #And Apply Timesheet Correction Application from SA login
      #| userid          | attendance-date | job-code | Validation         |
      #| NetWrkHrsPlcChk |        01012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        02012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        03012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        04012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        05012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        06012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChk |        07012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        01012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        02012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        03012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        04012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        05012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        06012024 | N1       | Saved Successfully |
      #| NetWrkHrsPlcChN |        07012024 | N1       | Saved Successfully |
    #And Assign Award Penalty Hours from SA login
      #| Userid          | Date     | AdjustmentType | Hours | Remark         | Validation         |
      #| NetWrkHrsPlcChk | 01012024 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 02012024 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 03012024 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 04012024 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 05012024 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 06012024 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChk | 07012024 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 01012024 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 02012024 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 03012024 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 04012024 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 05012024 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 06012024 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      #| NetWrkHrsPlcChN | 07012024 | Penalty        |  0300 | PenaltyGranted | Saved Successfully |
    #And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "01012024" To "31012024"
      #| UserID          |
      #| NetWrkHrsPlcChk |
      #| NetWrkHrsPlcChN |
    #Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01012024" and "07012024"
      #| Date       | First IN | Last OUT | Net-Work |
      #| 01/01/2024 | 09:00    | 18:00    | 07:00    |
      #| 02/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 03/01/2024 | 09:00    | 18:00    | 05:00    |
      #| 04/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 05/01/2024 | 09:00    | 18:00    | 07:00    |
      #| 06/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 07/01/2024 | 09:00    | 18:00    | 05:00    |
    #Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01012024" and "07012024"
      #| Date       | First IN | Last OUT | Net-Work |
      #| 01/01/2024 | 09:00    | 18:00    | 07:00    |
      #| 02/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 03/01/2024 | 09:00    | 18:00    | 05:00    |
      #| 04/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 05/01/2024 | 09:00    | 18:00    | 07:00    |
      #| 06/01/2024 | 09:00    | 18:00    | 08:00    |
      #| 07/01/2024 | 09:00    | 18:00    | 05:00    |

  @NWHP_242
  Scenario: Network Hrs Policy - Penalty Duration - ApplicableDays - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |           -10 |      10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 |     
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |     -1 |   -1 |          |        1 |                |
      | NetWrkHrsPlcChk |     -3 |   -3 |          |          |              1 |
      | NetWrkHrsPlcChk |     -5 |   -5 |          |        1 |              1 |
      | NetWrkHrsPlcChN |     -1 |   -1 |          |        1 |                |
      | NetWrkHrsPlcChN |     -3 |   -3 |          |          |              1 |
      | NetWrkHrsPlcChN |     -5 |   -5 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChk |         -3 |     090000 |
      | NetWrkHrsPlcChk |         -3 |     130000 |
      | NetWrkHrsPlcChk |         -3 |     140000 |
      | NetWrkHrsPlcChk |         -3 |     180000 |
      | NetWrkHrsPlcChk |         -4 |     090000 |
      | NetWrkHrsPlcChk |         -4 |     130000 |
      | NetWrkHrsPlcChk |         -4 |     140000 |
      | NetWrkHrsPlcChk |         -4 |     180000 |
      | NetWrkHrsPlcChk |         -5 |     090000 |
      | NetWrkHrsPlcChk |         -5 |     130000 |
      | NetWrkHrsPlcChk |         -5 |     140000 |
      | NetWrkHrsPlcChk |         -5 |     180000 |
      | NetWrkHrsPlcChk |         -6 |     090000 |
      | NetWrkHrsPlcChk |         -6 |     130000 |
      | NetWrkHrsPlcChk |         -6 |     140000 |
      | NetWrkHrsPlcChk |         -6 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
      | NetWrkHrsPlcChN |         -3 |     090000 |
      | NetWrkHrsPlcChN |         -3 |     130000 |
      | NetWrkHrsPlcChN |         -3 |     140000 |
      | NetWrkHrsPlcChN |         -3 |     180000 |
      | NetWrkHrsPlcChN |         -4 |     090000 |
      | NetWrkHrsPlcChN |         -4 |     130000 |
      | NetWrkHrsPlcChN |         -4 |     140000 |
      | NetWrkHrsPlcChN |         -4 |     180000 |
      | NetWrkHrsPlcChN |         -5 |     090000 |
      | NetWrkHrsPlcChN |         -5 |     130000 |
      | NetWrkHrsPlcChN |         -5 |     140000 |
      | NetWrkHrsPlcChN |         -5 |     180000 |
      | NetWrkHrsPlcChN |         -6 |     090000 |
      | NetWrkHrsPlcChN |         -6 |     130000 |
      | NetWrkHrsPlcChN |         -6 |     140000 |
      | NetWrkHrsPlcChN |         -6 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -4 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -5 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -6 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -3 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -4 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -5 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -6 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -3 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -4 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -5 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -6 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -3 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -4 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -5 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -6 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |
      |   -4 | 09:00    | 18:00    | 08:00    |
      |   -5 | 09:00    | 18:00    | 07:00    |
      |   -6 | 09:00    | 18:00    | 08:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-6" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 07:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |
      |   -3 | 09:00    | 18:00    | 07:00    |
      |   -4 | 09:00    | 18:00    | 08:00    |
      |   -5 | 09:00    | 18:00    | 07:00    |
      |   -6 | 09:00    | 18:00    | 08:00    |

  @NWHP_243
  Scenario: Network Hrs Policy - Penalty Duration - ApplicableDays - Case3
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully |  
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | N1      |         -10 |      10 |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |      0 |    0 |          |        1 |                |
      | NetWrkHrsPlcChk |     -1 |   -1 |          |          |              1 |
      | NetWrkHrsPlcChk |     -2 |   -2 |          |        1 |              1 |
      | NetWrkHrsPlcChN |      0 |    0 |          |        1 |                |
      | NetWrkHrsPlcChN |     -1 |   -1 |          |          |              1 |
      | NetWrkHrsPlcChN |     -2 |   -2 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 08:00    |
      |   -1 | 09:00    | 18:00    | 08:00    |
      |   -2 | 09:00    | 18:00    | 07:00    |

  @NWHP_244
  Scenario: Network Hrs Policy - Penalty Duration - ApplicableDays - Case4
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |            -10 |      10 |        0050000 | Saved Successfully | 
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |        -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |         -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Change Shift via API
      | userid          | FromDt | ToDt | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk |      0 |    0 | FB       |          |                |
      | NetWrkHrsPlcChk |     -1 |   -1 | RD       |          |                |
      | NetWrkHrsPlcChN |      0 |    0 | FB       |          |                |
      | NetWrkHrsPlcChN |     -1 |   -1 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChk |         -1 |     090000 |
      | NetWrkHrsPlcChk |         -1 |     130000 |
      | NetWrkHrsPlcChk |         -1 |     140000 |
      | NetWrkHrsPlcChk |         -1 |     180000 |
      | NetWrkHrsPlcChk |         -2 |     090000 |
      | NetWrkHrsPlcChk |         -2 |     130000 |
      | NetWrkHrsPlcChk |         -2 |     140000 |
      | NetWrkHrsPlcChk |         -2 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
      | NetWrkHrsPlcChN |         -1 |     090000 |
      | NetWrkHrsPlcChN |         -1 |     130000 |
      | NetWrkHrsPlcChN |         -1 |     140000 |
      | NetWrkHrsPlcChN |         -1 |     180000 |
      | NetWrkHrsPlcChN |         -2 |     090000 |
      | NetWrkHrsPlcChN |         -2 |     130000 |
      | NetWrkHrsPlcChN |         -2 |     140000 |
      | NetWrkHrsPlcChN |         -2 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChk |              -2 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -1 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |              -2 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChk |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -1 | Penalty        |  0200 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |   -2 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 07:00    |
      |   -1 | 09:00    | 18:00    | 06:00    |
      |   -2 | 09:00    | 18:00    | 08:00    |

  @NWHP_245
  Scenario: Network Hrs Policy - Penalty Duration - Factor - Case1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Penalty Duration        |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | N1   | N1   |           -10 |      10 |        0050000 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate | 
      | NWHrsChk          | NWHrsChk |         -10 |      10 | 
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | N1      |        -10 |      10 |    
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0100 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 06:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 06:00    |

  @NWHP_246
  Scenario: Network Hrs Policy - Penalty Duration - Factor - Case2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Delete Overtime Policy from TnA module
      | Name            |
      | NetWrkHrsPlcChk |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | NWHrsChk    |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | NWHrsChk  |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | N1      |
    And Delete "ZE" shift schedule
    And Delete "ZE" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    3.0 | Check All      |
      | Penalty Duration        |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Penalty Duration        |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | JobCosting | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | Enabled    | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         | 
      | N1   | N1   |          -10 |      10 |        0050000 | Saved Successfully |    
    And Create Phase from Job Processing and Costing
      | Name     | Description | Validation         |
      | NWHrsChk | NWHrsChk    | Saved Successfully |
    And Create Project "NWHrsChk" with StartDate "-10" and EndDate "10" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase    | StartDate | EndDate |
      | NWHrsChk          | NWHrsChk |        -10 |      10 |
    And Set Job Configuration in Phase "NWHrsChk" of Project "NWHrsChk" from Job Processing and Costing
      | JobCode | StartDate | EndDate | 
      | N1      |       -10 |      10 | 
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |          0 |     090000 |
      | NetWrkHrsPlcChk |          0 |     130000 |
      | NetWrkHrsPlcChk |          0 |     140000 |
      | NetWrkHrsPlcChk |          0 |     180000 |
      | NetWrkHrsPlcChN |          0 |     090000 |
      | NetWrkHrsPlcChN |          0 |     130000 |
      | NetWrkHrsPlcChN |          0 |     140000 |
      | NetWrkHrsPlcChN |          0 |     180000 |
    And Apply Timesheet Correction Application from SA login
      | userid          | attendance-date | job-code | Validation         |
      | NetWrkHrsPlcChk |               0 | N1       | Saved Successfully |
      | NetWrkHrsPlcChN |               0 | N1       | Saved Successfully |
    And Assign Award Penalty Hours from SA login
      | Userid          | Date | AdjustmentType | Hours | Remark         | Validation         |
      | NetWrkHrsPlcChk |    0 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
      | NetWrkHrsPlcChN |    0 | Penalty        |  0400 | PenaltyGranted | Saved Successfully |
    And Run Daily Attendance Process with Reprocess Attendance Events = "False" and Include Denied Events= "False" for Date= "-30" To "0"
      | UserID          |
      | NetWrkHrsPlcChk |
      | NetWrkHrsPlcChN |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 15:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "0" and "0"
      | Date | First IN | Last OUT | Net-Work |
      |    0 | 09:00    | 18:00    | 15:30    |
