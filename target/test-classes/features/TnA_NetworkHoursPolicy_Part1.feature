@tag
Feature: Network Hours Policy
  I want to use this template for my feature file

  @NWHP_1
  Scenario: Network Hrs Policy - Work Hours Within Shift
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 08:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 08:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 07:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 06:30    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    |
      | 02/01/2024 | 08:00    | 18:00    | 08:00    |
      | 03/01/2024 | 09:00    | 19:00    | 08:00    |
      | 04/01/2024 | 10:00    | 18:00    | 07:00    |
      | 05/01/2024 | 09:00    | 18:00    | 06:30    |

  @NWHP_2
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeFrom - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 07:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 06:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 05:30    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    |
      | 03/01/2024 | 09:00    | 19:00    | 07:00    |
      | 04/01/2024 | 10:00    | 18:00    | 06:00    |
      | 05/01/2024 | 09:00    | 18:00    | 05:30    |

  @NWHP_3
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeFrom - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0400 |    1200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 04:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 04:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 04:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 03:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 02:30    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 04:00    |
      | 02/01/2024 | 08:00    | 18:00    | 04:00    |
      | 03/01/2024 | 09:00    | 19:00    | 04:00    |
      | 04/01/2024 | 10:00    | 18:00    | 03:00    |
      | 05/01/2024 | 09:00    | 18:00    | 02:30    |

  @NWHP_4
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeTo - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0700 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 07:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 07:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 06:30    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    |
      | 03/01/2024 | 09:00    | 19:00    | 07:00    |
      | 04/01/2024 | 10:00    | 18:00    | 07:00    |
      | 05/01/2024 | 09:00    | 18:00    | 06:30    |

  @NWHP_5
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeTo - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0500 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 05:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 05:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 05:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 05:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 05:00    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 05:00    |
      | 02/01/2024 | 08:00    | 18:00    | 05:00    |
      | 03/01/2024 | 09:00    | 19:00    | 05:00    |
      | 04/01/2024 | 10:00    | 18:00    | 05:00    |
      | 05/01/2024 | 09:00    | 18:00    | 05:00    |

  @NWHP_6
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeTo - Case3
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0100 |    0700 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 06:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 06:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 06:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 06:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 05:30    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 06:00    |
      | 02/01/2024 | 08:00    | 18:00    | 06:00    |
      | 03/01/2024 | 09:00    | 19:00    | 06:00    |
      | 04/01/2024 | 10:00    | 18:00    | 06:00    |
      | 05/01/2024 | 09:00    | 18:00    | 05:30    |

  @NWHP_7
  Scenario: Network Hrs Policy - Work Hours Within Shift - RangeTo - Case4
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0200 |    0600 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 04:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 04:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 04:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 04:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 04:00    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 04:00    |
      | 02/01/2024 | 08:00    | 18:00    | 04:00    |
      | 03/01/2024 | 09:00    | 19:00    | 04:00    |
      | 04/01/2024 | 10:00    | 18:00    | 04:00    |
      | 05/01/2024 | 09:00    | 18:00    | 04:00    |

  @NWHP_8
  Scenario: Network Hrs Policy - Work Hours Within Shift - ConsiderAs - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    |          | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    |          | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    |          | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    |          | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 19:00    |          |
      | 04/01/2024 | 10:00    | 18:00    |          |
      | 05/01/2024 | 09:00    | 18:00    |          |

  @NWHP_9
  Scenario: Network Hrs Policy - Work Hours Within Shift - ConsiderAs - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Work Hours Within Shift |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     153000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     100000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     153000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 02:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 02:00    | 01:00       |
      | 03/01/2024 | 09:00    | 19:00    | 02:00    | 01:00       |
      | 04/01/2024 | 10:00    | 18:00    | 02:00    | 01:00       |
      | 05/01/2024 | 09:00    | 18:00    | 02:00    | 02:30       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 02:00    |
      | 02/01/2024 | 08:00    | 18:00    | 02:00    |
      | 03/01/2024 | 09:00    | 19:00    | 02:00    |
      | 04/01/2024 | 10:00    | 18:00    | 02:00    |
      | 05/01/2024 | 09:00    | 18:00    | 02:00    |

  @NWHP_10
  Scenario: Network Hrs Policy - Work Hours Within Shift - MinDurReq - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0500 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150100 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150100 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 08:00    | 01:00       |
      | 03/01/2024 | 09:00    | 14:30    |          | 01:00       |
      | 04/01/2024 | 09:00    | 15:01    | 05:01    | 01:00       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    |
      | 02/01/2024 | 08:00    | 18:00    | 08:00    |
      | 03/01/2024 | 09:00    | 14:30    |          |
      | 04/01/2024 | 09:00    | 15:01    | 05:01    |

  @NWHP_11
  Scenario: Network Hrs Policy - Work Hours Within Shift - MinDurReq - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0200 |    1000 | Work       |      0500 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150100 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170100 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150100 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170100 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 06:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 06:00    | 01:00       |
      | 03/01/2024 | 09:00    | 14:30    |          | 01:00       |
      | 04/01/2024 | 09:00    | 15:01    |          | 01:00       |
      | 05/01/2024 | 09:00    | 17:01    | 05:01    | 01:00       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 06:00    |
      | 02/01/2024 | 08:00    | 18:00    | 06:00    |
      | 03/01/2024 | 09:00    | 14:30    |          |
      | 04/01/2024 | 09:00    | 15:01    |          |
      | 05/01/2024 | 09:00    | 17:01    | 05:01    |

  @NWHP_12
  Scenario: Network Hrs Policy - Work Hours Within Shift - MinDurReq - Case3
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0700 | Work       |      0500 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150100 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170100 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150100 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170100 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    | 01:00       |
      | 03/01/2024 | 09:00    | 14:30    |          | 01:00       |
      | 04/01/2024 | 09:00    | 15:01    | 05:01    | 01:00       |
      | 05/01/2024 | 09:00    | 17:01    | 07:00    | 01:00       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 07:00    |
      | 02/01/2024 | 08:00    | 18:00    | 07:00    |
      | 03/01/2024 | 09:00    | 14:30    |          |
      | 04/01/2024 | 09:00    | 15:01    | 05:01    |
      | 05/01/2024 | 09:00    | 17:01    | 07:00    |

  @NWHP_13
  Scenario: Network Hrs Policy - Work Hours Within Shift - MinDurReq - Case4
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Work Hours Within Shift |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     113000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170100 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     113000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170100 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 10:00    |          |             |
      | 02/01/2024 | 09:00    | 11:30    | 02:30    |             |
      | 03/01/2024 | 09:00    | 17:00    | 03:00    | 01:00       |
      | 04/01/2024 | 09:00    | 18:00    | 03:00    | 01:00       |
      | 05/01/2024 | 09:00    | 17:01    | 03:00    | 01:00       |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 10:00    |          |
      | 02/01/2024 | 09:00    | 11:30    | 02:30    |
      | 03/01/2024 | 09:00    | 17:00    | 03:00    |
      | 04/01/2024 | 09:00    | 18:00    | 03:00    |
      | 05/01/2024 | 09:00    | 17:01    | 03:00    |

  @NWHP_14
  Scenario: Network Hrs Policy - Work Hours Within Shift - MinDurReq - Case5
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
      | ZE      | 09:00     | 22:00   | 06:00   | 12:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Work Hours Within Shift |      0300 |    1000 | Work       |      0300 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     220000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     220000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 22:00    | 10:00    |
      | 02/01/2024 | 09:00    | 20:00    | 10:00    |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 22:00    | 10:00    |
      | 02/01/2024 | 09:00    | 20:00    | 10:00    |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |

  @NWHP_15
  Scenario: Network Hrs Policy - Work Hours Within Shift - ApplicableDays - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     090000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |
      | 04/01/2024 | 09:00    | 18:00    |          |
      | 05/01/2024 | 09:00    | 18:00    | 08:00    |
      | 06/01/2024 | 09:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 18:00    | 08:00    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |
      | 04/01/2024 | 09:00    | 18:00    |          |
      | 05/01/2024 | 09:00    | 18:00    | 08:00    |
      | 06/01/2024 | 09:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 18:00    | 08:00    |

  @NWHP_16
  Scenario: Network Hrs Policy - Work Hours Within Shift - ApplicableDays - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     090000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     090000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     180000 |
      | NetWrkHrsPlcChN |   07012024 |     090000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    | 08:00    |
      | 03/01/2024 | 09:00    | 18:00    |          |
      | 04/01/2024 | 09:00    | 18:00    | 08:00    |
      | 05/01/2024 | 09:00    | 18:00    |          |
      | 06/01/2024 | 09:00    | 18:00    | 08:00    |
      | 07/01/2024 | 09:00    | 18:00    |          |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    | 08:00    |
      | 03/01/2024 | 09:00    | 18:00    |          |
      | 04/01/2024 | 09:00    | 18:00    | 08:00    |
      | 05/01/2024 | 09:00    | 18:00    |          |
      | 06/01/2024 | 09:00    | 18:00    | 08:00    |
      | 07/01/2024 | 09:00    | 18:00    |          |

  @NWHP_17
  Scenario: Network Hrs Policy - Work Hours Within Shift - ApplicableDays - Case3
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 08:00    |

  @NWHP_18
  Scenario: Network Hrs Policy - Work Hours Within Shift - ApplicableDays - Case4
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 | RD       |          |                |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     090000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     090000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 08:00    |
      | 02/01/2024 | 09:00    | 20:00    | 10:00    |
      | 03/01/2024 | 09:00    | 21:00    | 10:00    |
      | 04/01/2024 | 09:00    | 18:00    |          |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 09:00    |
      | 02/01/2024 | 09:00    | 20:00    | 10:00    |
      | 03/01/2024 | 09:00    | 21:00    | 10:00    |
      | 04/01/2024 | 09:00    | 18:00    |          |

  @NWHP_19
  Scenario: Network Hrs Policy - Work Hours Within Shift - Factor - Case1
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 16:00    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 16:00    |

  @NWHP_20
  Scenario: Network Hrs Policy - Work Hours Within Shift - Factor - Case2
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
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Work Hours Within Shift |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 18:30    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 18:30    |

  @NWHP_21
  Scenario: Network Hrs Policy - Break Hours
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 01:00    | 01:00       |
      | 02/01/2024 | 09:00    | 18:00    | 03:00    | 03:00       |
      | 03/01/2024 | 09:00    | 18:00    | 03:30    | 03:30       |

  @NWHP_22
  Scenario: Network Hrs Policy - Break Hours - RangeFrom - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 09:00    | 18:00    | 02:00    | 03:00       |
      | 03/01/2024 | 09:00    | 18:00    | 02:30    | 03:30       |

  @NWHP_23
  Scenario: Network Hrs Policy - Break Hours - RangeTo - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 01:00    | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 02:00    | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 02:00    | 03:00       |

  @NWHP_24
  Scenario: Network Hrs Policy - Break Hours - RangeTo - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 01:00    | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 01:00    | 03:00       |
      | 04/01/2024 | 09:00    | 18:00    | 01:00    | 04:00       |

  @NWHP_25
  Scenario: Network Hrs Policy - Break Hours - ConsiderAs - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    |          | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    |          | 03:00       |
      | 04/01/2024 | 09:00    | 18:00    |          | 04:00       |

  @NWHP_26
  Scenario: Network Hrs Policy - Break Hours - ConsiderAs - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Break Hours   |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     133000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 00:30       |
      | 02/01/2024 | 08:00    | 18:00    | 01:00    | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 01:00    | 03:00       |
      | 04/01/2024 | 09:00    | 18:00    | 01:00    | 04:00       |

  @NWHP_27
  Scenario: Network Hrs Policy - Break Hours - MinDurReq - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 08:00    | 18:00    | 02:00    | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 03:00    | 03:00       |

  @NWHP_28
  Scenario: Network Hrs Policy - Break Hours - MinDurReq - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 09:00    | 18:00    |          | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 02:00    | 03:00       |
      | 04/01/2024 | 09:00    | 18:00    | 03:00    | 04:00       |

  @NWHP_29
  Scenario: Network Hrs Policy - Break Hours - MinDurReq - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    | 01:00    | 01:00       |
      | 02/01/2024 | 09:00    | 18:00    | 02:00    | 02:00       |
      | 03/01/2024 | 09:00    | 18:00    | 02:00    | 03:00       |
      | 04/01/2024 | 09:00    | 18:00    | 02:00    | 04:00       |

  @NWHP_30
  Scenario: Network Hrs Policy - Break Hours - MinDurReq - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Break Hours   |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     143000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     093000 |
      | NetWrkHrsPlcChk |   04012024 |     173000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work | Break Hours |
      | 01/01/2024 | 09:00    | 18:00    |          | 01:00       |
      | 02/01/2024 | 09:00    | 18:00    | 02:30    | 02:30       |
      | 03/01/2024 | 09:00    | 18:00    | 03:00    | 07:00       |
      | 04/01/2024 | 09:00    | 18:00    | 03:00    | 08:00       |

  @NWHP_31
  Scenario: Network Hrs Policy - Break Hours - ApplicableDays - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     100000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     120000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 01:00    |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 03:00    |
      | 04/01/2024 | 09:00    | 18:00    |          |
      | 05/01/2024 | 09:00    | 18:00    | 01:00    |
      | 06/01/2024 | 09:00    | 18:00    |          |
      | 07/01/2024 | 09:00    | 18:00    | 03:00    |

  @NWHP_32
  Scenario: Network Hrs Policy - Break Hours - ApplicableDays - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 04/01/2024 | 04/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 06/01/2024 | 06/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     090000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     090000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     090000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   06012024 |     180000 |
      | NetWrkHrsPlcChk |   07012024 |     090000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    | 01:00    |
      | 03/01/2024 | 09:00    | 18:00    |          |
      | 04/01/2024 | 09:00    | 18:00    | 02:00    |
      | 05/01/2024 | 09:00    | 18:00    |          |
      | 06/01/2024 | 09:00    | 18:00    | 03:00    |
      | 07/01/2024 | 09:00    | 18:00    |          |

  @NWHP_33
  Scenario: Network Hrs Policy - Break Hours - ApplicableDays - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 |          |        1 |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChk | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    | 01:00    |

  @NWHP_34
  Scenario: Network Hrs Policy - Break Hours - ApplicableDays - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Change Shift via API
      | userid          | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | NetWrkHrsPlcChk | 01/01/2024 | 01/01/2024 | FB       |          |                |
      | NetWrkHrsPlcChk | 02/01/2024 | 02/01/2024 | RD       |          |                |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     090000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    |          |
      | 02/01/2024 | 09:00    | 18:00    |          |
      | 03/01/2024 | 09:00    | 18:00    |          |

  @NWHP_35
  Scenario: Network Hrs Policy - Break Hours - Factor - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 02:00    |

  @NWHP_36
  Scenario: Network Hrs Policy - Break Hours - Factor - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Break Hours   |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Break Hours   |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID          |
      | NetWrkHrsPlcChk |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:00    | 18:00    | 16:00    |

  @NWHP_37
  Scenario: Network Hrs Policy - Early-IN
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     060000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     053000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     060000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     053000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 06:00    | 18:00    | 03:00    |
      | 03/01/2024 | 05:30    | 18:00    | 03:30    |
    And Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 06:00    | 18:00    | 03:00    |
      | 03/01/2024 | 05:30    | 18:00    | 03:30    |

  @NWHP_38
  Scenario: Network Hrs Policy - Early-IN - RangeFrom - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     060000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     053000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     060000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     053000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 06:00    | 18:00    | 02:00    |
      | 03/01/2024 | 05:30    | 18:00    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 06:00    | 18:00    | 02:00    |
      | 03/01/2024 | 05:30    | 18:00    | 02:30    |

  @NWHP_39
  Scenario: Network Hrs Policy - Early-IN - RangeTo - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 18:00    | 02:00    |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 18:00    | 02:00    |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |

  @NWHP_40
  Scenario: Network Hrs Policy - Early-IN - RangeTo - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    | 01:00    |
      | 03/01/2024 | 06:00    | 18:00    | 01:00    |
      | 04/01/2024 | 05:00    | 18:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    | 01:00    |
      | 03/01/2024 | 06:00    | 18:00    | 01:00    |
      | 04/01/2024 | 05:00    | 18:00    | 01:00    |

  @NWHP_41
  Scenario: Network Hrs Policy - Early-IN - ConsiderAs - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    |          |
      | 03/01/2024 | 06:00    | 18:00    |          |
      | 04/01/2024 | 05:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    |          |
      | 03/01/2024 | 06:00    | 18:00    |          |
      | 04/01/2024 | 05:00    | 18:00    |          |

  @NWHP_42
  Scenario: Network Hrs Policy - Early-IN - ConsiderAs - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN      |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     083000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     083000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:30    | 18:00    |          |
      | 02/01/2024 | 07:00    | 20:00    | 01:00    |
      | 03/01/2024 | 06:00    | 18:00    | 01:00    |
      | 04/01/2024 | 05:00    | 20:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:30    | 18:00    |          |
      | 02/01/2024 | 07:00    | 20:00    | 01:00    |
      | 03/01/2024 | 06:00    | 18:00    | 01:00    |
      | 04/01/2024 | 05:00    | 20:00    | 01:00    |

  @NWHP_43
  Scenario: Network Hrs Policy - Early-IN - MinDurReq - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    | 02:00    |
      | 03/01/2024 | 06:00    | 20:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 18:00    | 02:00    |
      | 03/01/2024 | 06:00    | 20:00    | 03:00    |

  @NWHP_44
  Scenario: Network Hrs Policy - Early-IN - MinDurReq - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |
      | 04/01/2024 | 05:00    | 20:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |
      | 04/01/2024 | 05:00    | 20:00    | 03:00    |

  @NWHP_45
  Scenario: Network Hrs Policy - Early-IN - MinDurReq - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 20:00    | 02:00    |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |
      | 04/01/2024 | 05:00    | 20:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 20:00    | 02:00    |
      | 03/01/2024 | 06:00    | 18:00    | 02:00    |
      | 04/01/2024 | 05:00    | 20:00    | 02:00    |

  @NWHP_46
  Scenario: Network Hrs Policy - Early-IN - MinDurReq - Case4
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
      | ZE      | 12:00     | 21:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Early-IN      |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     110000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     210000 |
      | NetWrkHrsPlcChk |   02012024 |     093000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     220000 |
      | NetWrkHrsPlcChk |   03012024 |     050000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     110000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     210000 |
      | NetWrkHrsPlcChN |   02012024 |     093000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     220000 |
      | NetWrkHrsPlcChN |   03012024 |     050000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 11:00    | 21:00    |          |
      | 02/01/2024 | 09:30    | 22:00    | 02:30    |
      | 03/01/2024 | 05:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 11:00    | 21:00    |          |
      | 02/01/2024 | 09:30    | 22:00    | 02:30    |
      | 03/01/2024 | 05:00    | 21:00    | 03:00    |

  @NWHP_47
  Scenario: Network Hrs Policy - Early-IN - ApplicableDays - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     060000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     050000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     200000 |
      | NetWrkHrsPlcChk |   06012024 |     070000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     200000 |
      | NetWrkHrsPlcChk |   07012024 |     060000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     060000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     050000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     200000 |
      | NetWrkHrsPlcChN |   06012024 |     070000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     200000 |
      | NetWrkHrsPlcChN |   07012024 |     060000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 06:00    | 18:00    | 03:00    |
      | 04/01/2024 | 05:00    | 20:00    |          |
      | 05/01/2024 | 08:00    | 20:00    | 01:00    |
      | 06/01/2024 | 07:00    | 20:00    |          |
      | 07/01/2024 | 06:00    | 18:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    | 01:00    |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 06:00    | 18:00    | 03:00    |
      | 04/01/2024 | 05:00    | 20:00    |          |
      | 05/01/2024 | 08:00    | 20:00    | 01:00    |
      | 06/01/2024 | 07:00    | 20:00    |          |
      | 07/01/2024 | 06:00    | 18:00    | 03:00    |

  @NWHP_48
  Scenario: Network Hrs Policy - Early-IN - ApplicableDays - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     070000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChk |   06012024 |     060000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     200000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     070000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   06012024 |     060000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     200000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 18:00    |          |
      | 04/01/2024 | 07:00    | 20:00    | 02:00    |
      | 05/01/2024 | 08:00    | 18:00    |          |
      | 06/01/2024 | 06:00    | 20:00    | 03:00    |
      | 07/01/2024 | 08:00    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 18:00    |          |
      | 04/01/2024 | 07:00    | 20:00    | 02:00    |
      | 05/01/2024 | 08:00    | 18:00    |          |
      | 06/01/2024 | 06:00    | 20:00    | 03:00    |
      | 07/01/2024 | 08:00    | 18:00    |          |

  @NWHP_49
  Scenario: Network Hrs Policy - Early-IN - ApplicableDays - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     200000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     200000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 20:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 20:00    | 01:00    |

  @NWHP_50
  Scenario: Network Hrs Policy - Early-IN - ApplicableDays - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     200000 |
      | NetWrkHrsPlcChk |   02012024 |     070000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     200000 |
      | NetWrkHrsPlcChN |   02012024 |     070000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    |          |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 20:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    |          |
      | 02/01/2024 | 07:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 20:00    |          |

  @NWHP_51
  Scenario: Network Hrs Policy - Early-IN - Factor - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 20:00    | 02:00    |

  @NWHP_52
  Scenario: Network Hrs Policy - Early-IN - Factor - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Early-IN      |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     020000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     200000 |
      | NetWrkHrsPlcChN |   01012024 |     020000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     200000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 02:00    | 20:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 02:00    | 20:00    | 16:00    |

  @NWHP_53
  Scenario: Network Hrs Policy - Overstay
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 21:00    | 03:00    |
      | 03/01/2024 | 08:00    | 21:30    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 21:00    | 03:00    |
      | 03/01/2024 | 08:00    | 21:30    | 03:30    |

  @NWHP_54
  Scenario: Network Hrs Policy - Overstay - RangeFrom - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 21:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:30    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 21:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:30    | 02:30    |

  @NWHP_55
  Scenario: Network Hrs Policy - Overstay - RangeTo - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |

  @NWHP_56
  Scenario: Network Hrs Policy - Overstay - RangeTo - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 21:00    | 01:00    |
      | 04/01/2024 | 08:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 21:00    | 01:00    |
      | 04/01/2024 | 08:00    | 22:00    | 01:00    |

  @NWHP_57
  Scenario: Network Hrs Policy - Overstay - ConsiderAs - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    |          |
      | 04/01/2024 | 08:00    | 22:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    |          |
      | 04/01/2024 | 08:00    | 22:00    |          |

  @NWHP_58
  Scenario: Network Hrs Policy - Overstay - ConsiderAs - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay      |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     183000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     183000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:30    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 21:00    | 01:00    |
      | 04/01/2024 | 08:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 18:30    |          |
      | 02/01/2024 | 08:00    | 20:00    | 01:00    |
      | 03/01/2024 | 08:00    | 21:00    | 01:00    |
      | 04/01/2024 | 08:00    | 22:00    | 01:00    |

  @NWHP_59
  Scenario: Network Hrs Policy - Overstay - MinDurReq - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 03:00    |

  @NWHP_60
  Scenario: Network Hrs Policy - Overstay - MinDurReq - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |
      | 04/01/2024 | 08:00    | 22:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |
      | 04/01/2024 | 08:00    | 22:00    | 03:00    |

  @NWHP_61
  Scenario: Network Hrs Policy - Overstay - MinDurReq - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |
      | 04/01/2024 | 08:00    | 22:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    | 02:00    |
      | 03/01/2024 | 08:00    | 21:00    | 02:00    |
      | 04/01/2024 | 08:00    | 22:00    | 02:00    |

  @NWHP_62
  Scenario: Network Hrs Policy - Overstay - MinDurReq - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Overstay      |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     203000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     010000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     203000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     010000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:30    | 02:30    |
      | 03/01/2024 | 08:00    | 01:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:30    | 02:30    |
      | 03/01/2024 | 08:00    | 01:00    | 03:00    |

  @NWHP_63
  Scenario: Network Hrs Policy - Overstay - ApplicableDays - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     200000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     200000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    | 03:00    |
      | 04/01/2024 | 08:00    | 22:00    |          |
      | 05/01/2024 | 08:00    | 19:00    | 01:00    |
      | 06/01/2024 | 08:00    | 20:00    |          |
      | 07/01/2024 | 08:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 01:00    |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 21:00    | 03:00    |
      | 04/01/2024 | 08:00    | 22:00    |          |
      | 05/01/2024 | 08:00    | 19:00    | 01:00    |
      | 06/01/2024 | 08:00    | 20:00    |          |
      | 07/01/2024 | 08:00    | 21:00    | 03:00    |

  @NWHP_64
  Scenario: Network Hrs Policy - Overstay - ApplicableDays - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     210000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     210000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 19:00    | 01:00    |
      | 03/01/2024 | 08:00    | 19:00    |          |
      | 04/01/2024 | 08:00    | 20:00    | 02:00    |
      | 05/01/2024 | 08:00    | 19:00    |          |
      | 06/01/2024 | 08:00    | 21:00    | 03:00    |
      | 07/01/2024 | 08:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 19:00    | 01:00    |
      | 03/01/2024 | 08:00    | 19:00    |          |
      | 04/01/2024 | 08:00    | 20:00    | 02:00    |
      | 05/01/2024 | 08:00    | 19:00    |          |
      | 06/01/2024 | 08:00    | 21:00    | 03:00    |
      | 07/01/2024 | 08:00    | 19:00    |          |

  @NWHP_65
  Scenario: Network Hrs Policy - Overstay - ApplicableDays - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 19:00    |          |
      | 03/01/2024 | 08:00    | 19:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 19:00    |          |
      | 03/01/2024 | 08:00    | 19:00    | 01:00    |

  @NWHP_66
  Scenario: Network Hrs Policy - Overstay - ApplicableDays - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    |          |
      | 02/01/2024 | 08:00    | 20:00    |          |
      | 03/01/2024 | 08:00    | 19:00    |          |

  @NWHP_67
  Scenario: Network Hrs Policy - Overstay - Factor - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 19:00    | 02:00    |

  @NWHP_68
  Scenario: Network Hrs Policy - Overstay - Factor - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Overstay      |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Overstay      |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     010000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     010000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 01:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 01:00    | 16:00    |

  @NWHP_69
  Scenario: Network Hrs Policy - Late-IN
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     120000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 12:00    | 21:00    | 03:00    |
      | 03/01/2024 | 12:30    | 21:30    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 12:00    | 21:00    | 03:00    |
      | 03/01/2024 | 12:30    | 21:30    | 03:30    |

  @NWHP_70
  Scenario: Network Hrs Policy - Late-IN - RangeFrom - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     120000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 12:00    | 21:00    | 02:00    |
      | 03/01/2024 | 12:30    | 21:30    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 12:00    | 21:00    | 02:00    |
      | 03/01/2024 | 12:30    | 21:30    | 02:30    |

  @NWHP_71
  Scenario: Network Hrs Policy - Late-IN - RangeTo - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |

  @NWHP_72
  Scenario: Network Hrs Policy - Late-IN - RangeTo - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |

  @NWHP_73
  Scenario: Network Hrs Policy - Late-IN - ConsiderAs - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    |          |
      | 04/01/2024 | 13:00    | 22:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    |          |
      | 04/01/2024 | 13:00    | 22:00    |          |

  @NWHP_74
  Scenario: Network Hrs Policy - Late-IN - ConsiderAs - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN       |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     183000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     183000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:30    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:30    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |

  @NWHP_75
  Scenario: Network Hrs Policy - Late-IN - MinDurReq - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |

  @NWHP_76
  Scenario: Network Hrs Policy - Late-IN - MinDurReq - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 03:00    |

  @NWHP_77
  Scenario: Network Hrs Policy - Late-IN - MinDurReq - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 02:00    |

  @NWHP_78
  Scenario: Network Hrs Policy - Late-IN - MinDurReq - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Late-IN       |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     113000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     203000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     113000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     203000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:30    | 20:30    | 02:30    |
      | 03/01/2024 | 16:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:30    | 20:30    | 02:30    |
      | 03/01/2024 | 16:00    | 21:00    | 03:00    |

  @NWHP_79
  Scenario: Network Hrs Policy - Late-IN - ApplicableDays - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     110000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     200000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     110000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     200000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
      | 04/01/2024 | 13:00    | 22:00    |          |
      | 05/01/2024 | 10:00    | 19:00    | 01:00    |
      | 06/01/2024 | 11:00    | 20:00    |          |
      | 07/01/2024 | 12:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
      | 04/01/2024 | 13:00    | 22:00    |          |
      | 05/01/2024 | 10:00    | 19:00    | 01:00    |
      | 06/01/2024 | 11:00    | 20:00    |          |
      | 07/01/2024 | 12:00    | 21:00    | 03:00    |

  @NWHP_80
  Scenario: Network Hrs Policy - Late-IN - ApplicableDays - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     120000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     210000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     110000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     120000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     210000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |
      | 04/01/2024 | 11:00    | 20:00    |          |
      | 05/01/2024 | 10:00    | 19:00    |          |
      | 06/01/2024 | 12:00    | 21:00    |          |
      | 07/01/2024 | 10:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |
      | 04/01/2024 | 11:00    | 20:00    |          |
      | 05/01/2024 | 10:00    | 19:00    |          |
      | 06/01/2024 | 12:00    | 21:00    |          |
      | 07/01/2024 | 10:00    | 19:00    |          |

  @NWHP_81
  Scenario: Network Hrs Policy - Late-IN - ApplicableDays - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |

  @NWHP_82
  Scenario: Network Hrs Policy - Late-IN - ApplicableDays - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |

  @NWHP_83
  Scenario: Network Hrs Policy - Late-IN - Factor - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 02:00    |

  @NWHP_84
  Scenario: Network Hrs Policy - Late-IN - Factor - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Late-IN       |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Late-IN       |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Late-In Policy
      | Name            | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True             |       600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | LateInPlc       | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     160000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   01012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 16:00    | 21:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 16:00    | 21:00    | 16:00    |

  @NWHP_85
  Scenario: Network Hrs Policy - Early-OUT
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 15:00    | 03:00    |
      | 03/01/2024 | 08:00    | 14:30    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 15:00    | 03:00    |
      | 03/01/2024 | 08:00    | 14:30    | 03:30    |

  @NWHP_86
  Scenario: Network Hrs Policy - Early-OUT - RangeFrom - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:00    | 02:00    |
      | 03/01/2024 | 08:00    | 14:30    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:00    | 02:00    |
      | 03/01/2024 | 08:00    | 14:30    | 02:30    |

  @NWHP_87
  Scenario: Network Hrs Policy - Early-OUT - RangeTo - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_88
  Scenario: Network Hrs Policy - Early-OUT - RangeTo - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_89
  Scenario: Network Hrs Policy - Early-OUT - ConsiderAs - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_90
  Scenario: Network Hrs Policy - Early-OUT - ConsiderAs - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT     |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_91
  Scenario: Network Hrs Policy - Early-OUT - MinDurReq - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |

  @NWHP_92
  Scenario: Network Hrs Policy - Early-OUT - MinDurReq - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_93
  Scenario: Network Hrs Policy - Early-OUT - MinDurReq - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_94
  Scenario: Network Hrs Policy - Early-OUT - MinDurReq - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Early-OUT     |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 08:00    | 11:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 08:00    | 11:00    | 03:00    |

  @NWHP_95
  Scenario: Network Hrs Policy - Early-OUT - ApplicableDays - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 08:00    | 17:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 08:00    | 15:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 08:00    | 17:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 08:00    | 15:00    | 03:00    |

  @NWHP_96
  Scenario: Network Hrs Policy - Early-OUT - ApplicableDays - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 08:00    | 17:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 08:00    | 17:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |
      | 04/01/2024 | 08:00    | 16:00    |          |
      | 05/01/2024 | 08:00    | 17:00    |          |
      | 06/01/2024 | 08:00    | 15:00    |          |
      | 07/01/2024 | 08:00    | 17:00    |          |

  @NWHP_97
  Scenario: Network Hrs Policy - Early-OUT - ApplicableDays - Case3
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChN | 02/01/2024 | 02/01/2024 |          |          |              1 |
      | NetWrkHrsPlcChN | 03/01/2024 | 03/01/2024 |          |        1 |              1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |

  @NWHP_98
  Scenario: Network Hrs Policy - Early-OUT - ApplicableDays - Case4
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |

  @NWHP_99
  Scenario: Network Hrs Policy - Early-OUT - Factor - Case1
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 02:00    |

  @NWHP_100
  Scenario: Network Hrs Policy - Early-OUT - Factor - Case2
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
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-OUT     |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Early-OUT     |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create Early-Out Policy
      | Name            | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | NetWrkHrsPlcChk | True               |         600 |                          | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | EarlyOutPlc     | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     110000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     110000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 11:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 11:00    | 16:00    |

  @NWHP_101
  Scenario: Network Hrs Policy - In-Grace
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     120000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 12:00    | 21:00    | 03:00    |
      | 03/01/2024 | 12:30    | 21:30    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 12:00    | 21:00    | 03:00    |
      | 03/01/2024 | 12:30    | 21:30    | 03:30    |

  @NWHP_102
  Scenario: Network Hrs Policy - In-Grace - RangeFrom - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     120000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     210000 |
      | NetWrkHrsPlcChk |   03012024 |     123000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     213000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     120000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     210000 |
      | NetWrkHrsPlcChN |   03012024 |     123000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     213000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 12:00    | 21:00    | 02:00    |
      | 03/01/2024 | 12:30    | 21:30    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 12:00    | 21:00    | 02:00    |
      | 03/01/2024 | 12:30    | 21:30    | 02:30    |

  @NWHP_103
  Scenario: Network Hrs Policy - In-Grace - RangeTo - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |

  @NWHP_104
  Scenario: Network Hrs Policy - In-Grace - RangeTo - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |

  @NWHP_105
  Scenario: Network Hrs Policy - In-Grace - ConsiderAs - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    |          |
      | 04/01/2024 | 13:00    | 22:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    |          |
      | 04/01/2024 | 13:00    | 22:00    |          |

  @NWHP_106
  Scenario: Network Hrs Policy - In-Grace - ConsiderAs - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | In-Grace      |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     183000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     183000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:30    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:30    |          |
      | 02/01/2024 | 11:00    | 20:00    | 01:00    |
      | 03/01/2024 | 12:00    | 21:00    | 01:00    |
      | 04/01/2024 | 13:00    | 22:00    | 01:00    |

  @NWHP_107
  Scenario: Network Hrs Policy - In-Grace - MinDurReq - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |

  @NWHP_108
  Scenario: Network Hrs Policy - In-Grace - MinDurReq - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 03:00    |

  @NWHP_109
  Scenario: Network Hrs Policy - In-Grace - MinDurReq - Case3
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    | 02:00    |
      | 03/01/2024 | 12:00    | 21:00    | 02:00    |
      | 04/01/2024 | 13:00    | 22:00    | 02:00    |

  @NWHP_110
  Scenario: Network Hrs Policy - In-Grace - MinDurReq - Case4
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | In-Grace      |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     113000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     203000 |
      | NetWrkHrsPlcChk |   03012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     113000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     203000 |
      | NetWrkHrsPlcChN |   03012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:30    | 20:30    | 02:30    |
      | 03/01/2024 | 16:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:30    | 20:30    | 02:30    |
      | 03/01/2024 | 16:00    | 21:00    | 03:00    |

  @NWHP_111
  Scenario: Network Hrs Policy - In-Grace - ApplicableDays - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     120000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     210000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     220000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     110000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     200000 |
      | NetWrkHrsPlcChk |   07012024 |     120000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     120000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     210000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     220000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     110000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     200000 |
      | NetWrkHrsPlcChN |   07012024 |     120000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
      | 04/01/2024 | 13:00    | 22:00    |          |
      | 05/01/2024 | 10:00    | 19:00    | 01:00    |
      | 06/01/2024 | 11:00    | 20:00    |          |
      | 07/01/2024 | 12:00    | 21:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 01:00    |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 12:00    | 21:00    | 03:00    |
      | 04/01/2024 | 13:00    | 22:00    |          |
      | 05/01/2024 | 10:00    | 19:00    | 01:00    |
      | 06/01/2024 | 11:00    | 20:00    |          |
      | 07/01/2024 | 12:00    | 21:00    | 03:00    |

  @NWHP_112
  Scenario: Network Hrs Policy - In-Grace - ApplicableDays - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChk |   04012024 |     110000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     200000 |
      | NetWrkHrsPlcChk |   05012024 |     100000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     190000 |
      | NetWrkHrsPlcChk |   06012024 |     120000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     210000 |
      | NetWrkHrsPlcChk |   07012024 |     100000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   04012024 |     110000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     200000 |
      | NetWrkHrsPlcChN |   05012024 |     100000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     190000 |
      | NetWrkHrsPlcChN |   06012024 |     120000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     210000 |
      | NetWrkHrsPlcChN |   07012024 |     100000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    | 01:00    |
      | 03/01/2024 | 10:00    | 19:00    |          |
      | 04/01/2024 | 11:00    | 20:00    | 02:00    |
      | 05/01/2024 | 10:00    | 19:00    |          |
      | 06/01/2024 | 12:00    | 21:00    | 03:00    |
      | 07/01/2024 | 10:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    | 01:00    |
      | 03/01/2024 | 10:00    | 19:00    |          |
      | 04/01/2024 | 11:00    | 20:00    | 02:00    |
      | 05/01/2024 | 10:00    | 19:00    |          |
      | 06/01/2024 | 12:00    | 21:00    | 03:00    |
      | 07/01/2024 | 10:00    | 19:00    |          |

  @NWHP_113
  Scenario: Network Hrs Policy - In-Grace - ApplicableDays - Case3
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     100000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     190000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     100000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     190000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 10:00    | 19:00    |          |
      | 03/01/2024 | 10:00    | 19:00    | 01:00    |

  @NWHP_114
  Scenario: Network Hrs Policy - In-Grace - ApplicableDays - Case4
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
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           |                       |                    | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           |                       |                    | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChk |   02012024 |     110000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     200000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   02012024 |     110000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     200000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    |          |
      | 02/01/2024 | 11:00    | 20:00    |          |
      | 03/01/2024 | 10:00    | 19:00    |          |

  @NWHP_115
  Scenario: Network Hrs Policy - In-Grace - Factor - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     190000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     190000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 10:00    | 19:00    | 02:00    |

  @NWHP_116
  Scenario: Network Hrs Policy - In-Grace - Factor - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                   500 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | In-Grace      |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     160000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   01012024 |     180000 |
      | NetWrkHrsPlcChk |   01012024 |     210000 |
      | NetWrkHrsPlcChN |   01012024 |     160000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     210000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 16:00    | 21:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 16:00    | 21:00    | 16:00    |

  @NWHP_117
  Scenario: Network Hrs Policy - In-Grace - General case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                    60 | False              | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | In-Grace      |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     094500 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     180000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     180000 |
      | NetWrkHrsPlcChk |   04012024 |     100100 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     180000 |
      | NetWrkHrsPlcChk |   05012024 |     085900 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180000 |
      | NetWrkHrsPlcChN |   01012024 |     093000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     180000 |
      | NetWrkHrsPlcChN |   02012024 |     094500 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     180000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     180000 |
      | NetWrkHrsPlcChN |   04012024 |     100100 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     180000 |
      | NetWrkHrsPlcChN |   05012024 |     085900 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    | 00:30    |
      | 02/01/2024 | 09:45    | 18:00    | 00:45    |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |
      | 04/01/2024 | 10:01    | 18:00    |          |
      | 05/01/2024 | 08:59    | 18:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 09:30    | 18:00    | 00:30    |
      | 02/01/2024 | 09:45    | 18:00    | 00:45    |
      | 03/01/2024 | 10:00    | 18:00    | 01:00    |
      | 04/01/2024 | 10:01    | 18:00    |          |
      | 05/01/2024 | 08:59    | 18:00    |          |

  @NWHP_118
  Scenario: Network Hrs Policy - Out-Grace
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 15:00    | 03:00    |
      | 03/01/2024 | 08:00    | 14:30    | 03:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 15:00    | 03:00    |
      | 03/01/2024 | 08:00    | 14:30    | 03:30    |

  @NWHP_119
  Scenario: Network Hrs Policy - Out-Grace - RangeFrom - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0100 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     150000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     143000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     150000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     143000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:00    | 02:00    |
      | 03/01/2024 | 08:00    | 14:30    | 02:30    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:00    | 02:00    |
      | 03/01/2024 | 08:00    | 14:30    | 02:30    |

  @NWHP_120
  Scenario: Network Hrs Policy - Out-Grace - RangeTo - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |

  @NWHP_121
  Scenario: Network Hrs Policy - Out-Grace - RangeTo - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_122
  Scenario: Network Hrs Policy - Out-Grace - ConsiderAs - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    |          |
      | 04/01/2024 | 08:00    | 14:00    |          |

  @NWHP_123
  Scenario: Network Hrs Policy - Out-Grace - ConsiderAs - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0100 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Out-Grace     |      0200 |    1000 | No Work    |      0000 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    |          |
      | 02/01/2024 | 08:00    | 16:00    | 01:00    |
      | 03/01/2024 | 08:00    | 15:00    | 01:00    |
      | 04/01/2024 | 08:00    | 14:00    | 01:00    |

  @NWHP_124
  Scenario: Network Hrs Policy - Out-Grace - MinDurReq - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |

  @NWHP_125
  Scenario: Network Hrs Policy - Out-Grace - MinDurReq - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0100 |    1000 | Work       |      0200 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 03:00    |

  @NWHP_126
  Scenario: Network Hrs Policy - Out-Grace - MinDurReq - Case3
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    0200 | Work       |      0100 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    | 02:00    |
      | 03/01/2024 | 08:00    | 15:00    | 02:00    |
      | 04/01/2024 | 08:00    | 14:00    | 02:00    |

  @NWHP_127
  Scenario: Network Hrs Policy - Out-Grace - MinDurReq - Case4
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    0300 | Work       |      0200 |    1.0 | Check All      |
      | Out-Grace     |      0300 |    1000 | No Work    |      0300 |        | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     153000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     090000 |
      | NetWrkHrsPlcChk |   03012024 |     100000 |
      | NetWrkHrsPlcChk |   03012024 |     110000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     153000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     090000 |
      | NetWrkHrsPlcChN |   03012024 |     100000 |
      | NetWrkHrsPlcChN |   03012024 |     110000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 08:00    | 11:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "04/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 15:30    | 02:30    |
      | 03/01/2024 | 08:00    | 11:00    | 03:00    |

  @NWHP_128
  Scenario: Network Hrs Policy - Out-Grace - ApplicableDays - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    1.0 | Mo,We,Fr,Su    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     150000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     120000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     160000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     150000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     150000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     120000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     160000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     150000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 08:00    | 17:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 08:00    | 15:00    | 03:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 01:00    |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 15:00    | 03:00    |
      | 04/01/2024 | 08:00    | 14:00    |          |
      | 05/01/2024 | 08:00    | 17:00    | 01:00    |
      | 06/01/2024 | 08:00    | 16:00    |          |
      | 07/01/2024 | 08:00    | 15:00    | 03:00    |

  @NWHP_129
  Scenario: Network Hrs Policy - Out-Grace - ApplicableDays - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    1.0 | WO,WO/PH,PH    |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     160000 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     170000 |
      | NetWrkHrsPlcChk |   06012024 |     080000 |
      | NetWrkHrsPlcChk |   06012024 |     130000 |
      | NetWrkHrsPlcChk |   06012024 |     140000 |
      | NetWrkHrsPlcChk |   06012024 |     150000 |
      | NetWrkHrsPlcChk |   07012024 |     080000 |
      | NetWrkHrsPlcChk |   07012024 |     130000 |
      | NetWrkHrsPlcChk |   07012024 |     140000 |
      | NetWrkHrsPlcChk |   07012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     160000 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     170000 |
      | NetWrkHrsPlcChN |   06012024 |     080000 |
      | NetWrkHrsPlcChN |   06012024 |     130000 |
      | NetWrkHrsPlcChN |   06012024 |     140000 |
      | NetWrkHrsPlcChN |   06012024 |     150000 |
      | NetWrkHrsPlcChN |   07012024 |     080000 |
      | NetWrkHrsPlcChN |   07012024 |     130000 |
      | NetWrkHrsPlcChN |   07012024 |     140000 |
      | NetWrkHrsPlcChN |   07012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 08:00    | 17:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 08:00    | 17:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 08:00    | 17:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "07/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    | 01:00    |
      | 03/01/2024 | 08:00    | 17:00    |          |
      | 04/01/2024 | 08:00    | 16:00    | 02:00    |
      | 05/01/2024 | 08:00    | 17:00    |          |
      | 06/01/2024 | 08:00    | 15:00    | 03:00    |
      | 07/01/2024 | 08:00    | 17:00    |          |

  @NWHP_130
  Scenario: Network Hrs Policy - Out-Grace - ApplicableDays - Case3
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    1.0 | WO/PH          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     170000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     170000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    | 01:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 17:00    |          |
      | 03/01/2024 | 08:00    | 17:00    | 01:00    |

  @NWHP_131
  Scenario: Network Hrs Policy - Out-Grace - ApplicableDays - Case4
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
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
      | FB      | Field Break |           |         |         |         |            |          |                          |                           |                         |                      | Saved Successfully |
      | RD      | Rest Day    |           |         |         |         |            |          |                          |                           |                         |                      | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    1.0 | FB,RD          |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     080000 |
      | NetWrkHrsPlcChk |   01012024 |     130000 |
      | NetWrkHrsPlcChk |   01012024 |     140000 |
      | NetWrkHrsPlcChk |   01012024 |     170000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     160000 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     160000 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    |          |
      | 02/01/2024 | 08:00    | 16:00    |          |
      | 03/01/2024 | 08:00    | 17:00    |          |

  @NWHP_132
  Scenario: Network Hrs Policy - Out-Grace - Factor - Case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    2.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     170000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 02:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:00    | 02:00    |

  @NWHP_133
  Scenario: Network Hrs Policy - Out-Grace - Factor - Case2
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                     500 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    0300 | Work       |      0000 |    2.0 | Check All      |
      | Out-Grace     |      0300 |    1000 | Work       |      0000 |    2.5 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     090000 |
      | NetWrkHrsPlcChk |   01012024 |     100000 |
      | NetWrkHrsPlcChk |   01012024 |     110000 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     090000 |
      | NetWrkHrsPlcChN |   01012024 |     100000 |
      | NetWrkHrsPlcChN |   01012024 |     110000 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 11:00    | 16:00    |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 11:00    | 16:00    |

  @NWHP_134
  Scenario: Network Hrs Policy - Out-Grace - General case1
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
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | ZE      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | True                     | Actual Break Duration     |                      60 | False                | Saved Successfully |
    And Create Shift Schedule "ZE" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | ZE      |               7 |
    And Configure Off Day Configuration in Shift Schedule "ZE"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NetWrkHrsPlcChk"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Out-Grace     |      0000 |    1000 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName         | NetWorkPlcName  | validation         |
      | NetWrkHrsPlcChk | NetWrkHrsPlcChk | Saved Successfully |
    And Create user from user configuration
      | userid          | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | OvertimePlc     | ShiftSchedule | Validation         |
      | NetWrkHrsPlcChk | True   | True      | True      | True      | True      | True               |                        4 | NetWrkHrsPlcChk | ZE            | Saved Successfully |
      | NetWrkHrsPlcChN | True   | True      | True      | True      | True      | True               | N-Punch                  | NetWrkHrsPlcChk | ZE            | Saved Successfully |
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
      | NetWrkHrsPlcChk |   01012024 |     173000 |
      | NetWrkHrsPlcChk |   02012024 |     080000 |
      | NetWrkHrsPlcChk |   02012024 |     130000 |
      | NetWrkHrsPlcChk |   02012024 |     140000 |
      | NetWrkHrsPlcChk |   02012024 |     171500 |
      | NetWrkHrsPlcChk |   03012024 |     080000 |
      | NetWrkHrsPlcChk |   03012024 |     130000 |
      | NetWrkHrsPlcChk |   03012024 |     140000 |
      | NetWrkHrsPlcChk |   03012024 |     170000 |
      | NetWrkHrsPlcChk |   04012024 |     080000 |
      | NetWrkHrsPlcChk |   04012024 |     130000 |
      | NetWrkHrsPlcChk |   04012024 |     140000 |
      | NetWrkHrsPlcChk |   04012024 |     165900 |
      | NetWrkHrsPlcChk |   05012024 |     080000 |
      | NetWrkHrsPlcChk |   05012024 |     130000 |
      | NetWrkHrsPlcChk |   05012024 |     140000 |
      | NetWrkHrsPlcChk |   05012024 |     180100 |
      | NetWrkHrsPlcChN |   01012024 |     080000 |
      | NetWrkHrsPlcChN |   01012024 |     130000 |
      | NetWrkHrsPlcChN |   01012024 |     140000 |
      | NetWrkHrsPlcChN |   01012024 |     173000 |
      | NetWrkHrsPlcChN |   02012024 |     080000 |
      | NetWrkHrsPlcChN |   02012024 |     130000 |
      | NetWrkHrsPlcChN |   02012024 |     140000 |
      | NetWrkHrsPlcChN |   02012024 |     171500 |
      | NetWrkHrsPlcChN |   03012024 |     080000 |
      | NetWrkHrsPlcChN |   03012024 |     130000 |
      | NetWrkHrsPlcChN |   03012024 |     140000 |
      | NetWrkHrsPlcChN |   03012024 |     170000 |
      | NetWrkHrsPlcChN |   04012024 |     080000 |
      | NetWrkHrsPlcChN |   04012024 |     130000 |
      | NetWrkHrsPlcChN |   04012024 |     140000 |
      | NetWrkHrsPlcChN |   04012024 |     165900 |
      | NetWrkHrsPlcChN |   05012024 |     080000 |
      | NetWrkHrsPlcChN |   05012024 |     130000 |
      | NetWrkHrsPlcChN |   05012024 |     140000 |
      | NetWrkHrsPlcChN |   05012024 |     180100 |
    Then Daily Attendance View for userid "NetWrkHrsPlcChk" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    | 00:30    |
      | 02/01/2024 | 08:00    | 17:15    | 00:45    |
      | 03/01/2024 | 08:00    | 17:00    | 01:00    |
      | 04/01/2024 | 08:00    | 16:59    |          |
      | 05/01/2024 | 08:00    | 18:01    |          |
    Then Daily Attendance View for userid "NetWrkHrsPlcChN" and period "Date" on "01/01/2024" and "05/01/2024"
      | Date       | First IN | Last OUT | Net-Work |
      | 01/01/2024 | 08:00    | 17:30    | 00:30    |
      | 02/01/2024 | 08:00    | 17:15    | 00:45    |
      | 03/01/2024 | 08:00    | 17:00    | 01:00    |
      | 04/01/2024 | 08:00    | 16:59    |          |
      | 05/01/2024 | 08:00    | 18:01    |          |

 