@T&A
Feature: Attendance Policy Parameters - Deduct Out Time, Always Mark First Punch As IN Punch, Auto Shift Correction
  I want to use this template for my feature file

  @AtdPlcParamCase1
  Scenario: Deduct Out Time= Always/Beyond/If Greater Than configuration in Attendance Policy, (N-Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AN" shift schedule
    And Delete "AN" shift
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime   | DeductOutTimeMinutes | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | DurChkPerShrtLvEntry | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdPlcParam1 | N-Punch          | Always          |                      |              1 | true                      | true                        | true                 | true                 | true                 | true               | Saved Successfully |
      | AtdPlcParam2 | N-Punch          | Beyond          |                   15 |              1 | true                      | true                        | true                 | true                 | true                 | true               | Saved Successfully |
      | AtdPlcParam3 | N-Punch          | If Greater Than |                   15 |              1 | true                      | true                        | true                 | true                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AN      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AN" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AN      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AN"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AN            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
      | AtdPlc_Ur2 | True   |            | True      | AtdPlcParam2  |             |           |             |                   | AN            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
      | AtdPlc_Ur3 | True   |            | True      | AtdPlcParam3  |             |           |             |                   | AN            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |         -1 |     090000 |
      | AtdPlc_Ur1 |         -1 |     100000 |
      | AtdPlc_Ur1 |         -1 |     103000 |
      | AtdPlc_Ur1 |         -1 |     120000 |
      | AtdPlc_Ur1 |         -1 |     150000 |
      | AtdPlc_Ur1 |         -1 |     160000 |
      | AtdPlc_Ur1 |         -1 |     160500 |
      | AtdPlc_Ur1 |         -1 |     210000 |
      | AtdPlc_Ur2 |         -1 |     090000 |
      | AtdPlc_Ur2 |         -1 |     100000 |
      | AtdPlc_Ur2 |         -1 |     103000 |
      | AtdPlc_Ur2 |         -1 |     120000 |
      | AtdPlc_Ur2 |         -1 |     150000 |
      | AtdPlc_Ur2 |         -1 |     160000 |
      | AtdPlc_Ur2 |         -1 |     160500 |
      | AtdPlc_Ur2 |         -1 |     210000 |
      | AtdPlc_Ur3 |         -1 |     090000 |
      | AtdPlc_Ur3 |         -1 |     100000 |
      | AtdPlc_Ur3 |         -1 |     103000 |
      | AtdPlc_Ur3 |         -1 |     120000 |
      | AtdPlc_Ur3 |         -1 |     150000 |
      | AtdPlc_Ur3 |         -1 |     160000 |
      | AtdPlc_Ur3 |         -1 |     160500 |
      | AtdPlc_Ur3 |         -1 |     210000 |
    Then Verify N-Punch details from N-Punch View page
      | UserId     | AttendanceDate | GrossWorkHours | TotalOutTime | N-PunchWorkHours | ExtraWorkHours | AuthorizedOvertime | Status |
      | AtdPlc_Ur1 |             -1 | 12:00          | 03:35        | 08:25            | 03:00          |                    | PR-PR  |
      | AtdPlc_Ur2 |             -1 | 12:00          | 03:00        | 09:00            | 03:00          |                    | PR-PR  |
      | AtdPlc_Ur3 |             -1 | 12:00          | 03:30        | 08:30            | 03:00          |                    | PR-PR  |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work |
      |   -1 | AN-Normal | 09:00    | 21:00    | PR       | PR       | 08:25      | 03:00      |
    And Daily Attendance View for userid "AtdPlc_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work |
      |   -1 | AN-Normal | 09:00    | 21:00    | PR       | PR       | 09:00      | 03:00      |
    And Daily Attendance View for userid "AtdPlc_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work |
      |   -1 | AN-Normal | 09:00    | 21:00    | PR       | PR       | 08:30      | 03:00      |

  @AtdPlcParamCase2
  Scenario: Auto Shift Correction = Enable configuration in Attendance Policy, (2, 4 and N-Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AQ" shift
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | AutoShiftCorr | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | DurChkPerShrtLvEntry | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdPlcParam1 |                2 |               |                | true          | true                      | true                        | true                 | true                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AQ      | 06:00     | 14:00   | 03:00   | 07:00   | 11:00      | 12:00    | Saved Successfully |
      | AO      | 14:00     | 22:00   | 03:00   | 07:00   | 16:00      | 17:00    | Saved Successfully |
      | AP      | 22:00     | 06:00   | 03:00   | 07:00   | 04:00      | 05:00    | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AQ      |               7 |
      | AO      |               7 |
      | AP      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdPlc_Ur2 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdPlc_Ur3 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 09/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 16/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    And Daily Attendance View for userid "AtdPlc_Ur2" and period "Date" on "01/04/2024" and "17/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 10/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 17/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    And Daily Attendance View for userid "AtdPlc_Ur3" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 09/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 16/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01042024 |     220000 |
      | AtdPlc_Ur1 |   02042024 |     060000 |
      | AtdPlc_Ur1 |   09042024 |     060000 |
      | AtdPlc_Ur1 |   09042024 |     140000 |
      | AtdPlc_Ur1 |   16042024 |     140000 |
      | AtdPlc_Ur1 |   16042024 |     220000 |
      | AtdPlc_Ur2 |   01042024 |     140000 |
      | AtdPlc_Ur2 |   01042024 |     160000 |
      | AtdPlc_Ur2 |   01042024 |     170000 |
      | AtdPlc_Ur2 |   01042024 |     220000 |
      | AtdPlc_Ur2 |   10042024 |     220000 |
      | AtdPlc_Ur2 |   11042024 |     040000 |
      | AtdPlc_Ur2 |   11042024 |     050000 |
      | AtdPlc_Ur2 |   11042024 |     060000 |
      | AtdPlc_Ur2 |   17042024 |     060000 |
      | AtdPlc_Ur2 |   17042024 |     110000 |
      | AtdPlc_Ur2 |   17042024 |     120000 |
      | AtdPlc_Ur2 |   17042024 |     140000 |
      | AtdPlc_Ur3 |   01042024 |     140000 |
      | AtdPlc_Ur3 |   01042024 |     153000 |
      | AtdPlc_Ur3 |   01042024 |     160000 |
      | AtdPlc_Ur3 |   01042024 |     163000 |
      | AtdPlc_Ur3 |   01042024 |     170000 |
      | AtdPlc_Ur3 |   01042024 |     220000 |
      | AtdPlc_Ur3 |   09042024 |     220000 |
      | AtdPlc_Ur3 |   09042024 |     230000 |
      | AtdPlc_Ur3 |   09042024 |     233000 |
      | AtdPlc_Ur3 |   10042024 |     030000 |
      | AtdPlc_Ur3 |   10042024 |     033000 |
      | AtdPlc_Ur3 |   10042024 |     060000 |
      | AtdPlc_Ur3 |   16042024 |     060000 |
      | AtdPlc_Ur3 |   16042024 |     103000 |
      | AtdPlc_Ur3 |   16042024 |     110000 |
      | AtdPlc_Ur3 |   16042024 |     123000 |
      | AtdPlc_Ur3 |   16042024 |     130000 |
      | AtdPlc_Ur3 |   16042024 |     140000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AP-Normal | 22:00    | 06:00    | PR       | PR       | 08:00      |
      | 09/04/2024 | AQ-Normal | 06:00    | 14:00    | PR       | PR       | 08:00      |
      | 16/04/2024 | AO-Normal | 14:00    | 22:00    | PR       | PR       | 08:00      |
    And Daily Attendance View for userid "AtdPlc_Ur2" and period "Date" on "01/04/2024" and "17/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AO-Normal | 14:00    | 22:00    | PR       | PR       | 07:00      |
      | 10/04/2024 | AP-Normal | 22:00    | 06:00    | PR       | PR       | 07:00      |
      | 17/04/2024 | AQ-Normal | 06:00    | 14:00    | PR       | PR       | 07:00      |
    And Daily Attendance View for userid "AtdPlc_Ur3" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AO-Normal | 14:00    | 22:00    | PR       | PR       | 07:00      |
      | 09/04/2024 | AP-Normal | 22:00    | 06:00    | PR       | PR       | 07:00      |
      | 16/04/2024 | AQ-Normal | 06:00    | 14:00    | PR       | PR       | 07:00      |

  @AtdPlcParamCase3
  Scenario: Auto Shift Correction = Disable configuration in Attendance Policy, (2, 4 and N-Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AQ" shift
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | AutoShiftCorr | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | DurChkPerShrtLvEntry | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdPlcParam1 |                4 |               |                | false         | true                      | true                        | true                 | true                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AQ      | 06:00     | 14:00   | 03:00   | 07:00   | 11:00      | 12:00    | Saved Successfully |
      | AO      | 14:00     | 22:00   | 03:00   | 07:00   | 16:00      | 17:00    | Saved Successfully |
      | AP      | 22:00     | 06:00   | 03:00   | 07:00   | 04:00      | 05:00    | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AQ      |               7 |
      | AO      |               7 |
      | AP      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdPlc_Ur2 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdPlc_Ur3 | True   |            | True      | AtdPlcParam1  |             |           |             |                   | AO            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 09/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 16/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    And Daily Attendance View for userid "AtdPlc_Ur2" and period "Date" on "01/04/2024" and "17/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 10/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 17/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    And Daily Attendance View for userid "AtdPlc_Ur3" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours |
      | 01/04/2024 | AQ-Normal |          |          | AB       | AB       |            |
      | 09/04/2024 | AO-Normal |          |          | AB       | AB       |            |
      | 16/04/2024 | AP-Normal |          |          | AB       | AB       |            |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01042024 |     220000 |
      | AtdPlc_Ur1 |   02042024 |     060000 |
      | AtdPlc_Ur1 |   09042024 |     060000 |
      | AtdPlc_Ur1 |   09042024 |     140000 |
      | AtdPlc_Ur1 |   16042024 |     140000 |
      | AtdPlc_Ur1 |   16042024 |     220000 |
      | AtdPlc_Ur2 |   01042024 |     140000 |
      | AtdPlc_Ur2 |   01042024 |     160000 |
      | AtdPlc_Ur2 |   01042024 |     170000 |
      | AtdPlc_Ur2 |   01042024 |     220000 |
      | AtdPlc_Ur2 |   10042024 |     220000 |
      | AtdPlc_Ur2 |   11042024 |     040000 |
      | AtdPlc_Ur2 |   11042024 |     050000 |
      | AtdPlc_Ur2 |   11042024 |     060000 |
      | AtdPlc_Ur2 |   17042024 |     060000 |
      | AtdPlc_Ur2 |   17042024 |     110000 |
      | AtdPlc_Ur2 |   17042024 |     120000 |
      | AtdPlc_Ur2 |   17042024 |     140000 |
      | AtdPlc_Ur3 |   01042024 |     140000 |
      | AtdPlc_Ur3 |   01042024 |     153000 |
      | AtdPlc_Ur3 |   01042024 |     160000 |
      | AtdPlc_Ur3 |   01042024 |     163000 |
      | AtdPlc_Ur3 |   01042024 |     170000 |
      | AtdPlc_Ur3 |   01042024 |     220000 |
      | AtdPlc_Ur3 |   09042024 |     220000 |
      | AtdPlc_Ur3 |   09042024 |     230000 |
      | AtdPlc_Ur3 |   09042024 |     233000 |
      | AtdPlc_Ur3 |   10042024 |     030000 |
      | AtdPlc_Ur3 |   10042024 |     033000 |
      | AtdPlc_Ur3 |   10042024 |     060000 |
      | AtdPlc_Ur3 |   16042024 |     060000 |
      | AtdPlc_Ur3 |   16042024 |     103000 |
      | AtdPlc_Ur3 |   16042024 |     110000 |
      | AtdPlc_Ur3 |   16042024 |     123000 |
      | AtdPlc_Ur3 |   16042024 |     130000 |
      | AtdPlc_Ur3 |   16042024 |     140000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark              |
      | 01/04/2024 | AQ-Normal |          | 22:00    | AB       | AB       |            | Punches Not In Pair |
      | 02/04/2024 | AQ-Normal | 06:00    |          | IN       | AB       |            | Punches Not In Pair |
      | 08/04/2024 | AO-Normal |          | 06:00    | AB       | AB       |            | Punches Not In Pair |
      | 09/04/2024 | AO-Normal | 14:00    |          | IN       | AB       |            | Punches Not In Pair |
      | 15/04/2024 | AP-Normal |          | 14:00    | AB       | AB       |            | Punches Not In Pair |
      | 16/04/2024 | AP-Normal | 22:00    |          | IN       | AB       |            | Punches Not In Pair |
    And Daily Attendance View for userid "AtdPlc_Ur2" and period "Date" on "01/04/2024" and "17/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Remark               |
      | 01/04/2024 | AQ-Normal | 14:00    | 22:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 10/04/2024 | AO-Normal | 22:00    | 06:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 16/04/2024 | AP-Normal | 06:00    | 14:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 17/04/2024 | AP-Normal |          |          | AB       | AB       |            |            | No Punches Available |
    And Daily Attendance View for userid "AtdPlc_Ur3" and period "Date" on "01/04/2024" and "16/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Remark               |
      | 01/04/2024 | AQ-Normal | 14:00    | 22:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 09/04/2024 | AO-Normal | 22:00    | 06:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 15/04/2024 | AP-Normal | 06:00    | 14:00    | AB       | PR       | 07:00      | 07:00      | AB:Late-IN           |
      | 16/04/2024 | AP-Normal |          |          | AB       | AB       |            |            | No Punches Available |

  #shift6789
  @AtdPlcParamCase4
  Scenario: Scenario 1 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AQ      | 08:00     | 16:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AR      | 09:00     | 17:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     060000 |
      | AtdPlc_Ur1 |   01012024 |     130000 |
      | AtdPlc_Ur1 |   02012024 |     061400 |
      | AtdPlc_Ur1 |   02012024 |     130000 |
      | AtdPlc_Ur1 |   03012024 |     062600 |
      | AtdPlc_Ur1 |   03012024 |     130000 |
      | AtdPlc_Ur1 |   04012024 |     063000 |
      | AtdPlc_Ur1 |   04012024 |     130000 |
      | AtdPlc_Ur1 |   05012024 |     063500 |
      | AtdPlc_Ur1 |   05012024 |     130000 |
      | AtdPlc_Ur1 |   06012024 |     063000 |
      | AtdPlc_Ur1 |   06012024 |     130000 |
      | AtdPlc_Ur1 |   08012024 |     070000 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     071400 |
      | AtdPlc_Ur1 |   09012024 |     140000 |
      | AtdPlc_Ur1 |   10012024 |     071600 |
      | AtdPlc_Ur1 |   10012024 |     140000 |
      | AtdPlc_Ur1 |   11012024 |     072600 |
      | AtdPlc_Ur1 |   11012024 |     140000 |
      | AtdPlc_Ur1 |   12012024 |     073000 |
      | AtdPlc_Ur1 |   12012024 |     140000 |
      | AtdPlc_Ur1 |   13012024 |     073500 |
      | AtdPlc_Ur1 |   13012024 |     140000 |
      | AtdPlc_Ur1 |   15012024 |     080000 |
      | AtdPlc_Ur1 |   15012024 |     140000 |
      | AtdPlc_Ur1 |   16012024 |     081400 |
      | AtdPlc_Ur1 |   16012024 |     140000 |
      | AtdPlc_Ur1 |   16012024 |     150000 |
      | AtdPlc_Ur1 |   17012024 |     081600 |
      | AtdPlc_Ur1 |   17012024 |     140000 |
      | AtdPlc_Ur1 |   17012024 |     150000 |
      | AtdPlc_Ur1 |   18012024 |     081600 |
      | AtdPlc_Ur1 |   18012024 |     140000 |
      | AtdPlc_Ur1 |   19012024 |     083500 |
      | AtdPlc_Ur1 |   19012024 |     150000 |
      | AtdPlc_Ur1 |   20012024 |     090000 |
      | AtdPlc_Ur1 |   20012024 |     150000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 06:00    | 13:00    | PR       | AB       |         |           | 07:00      |            | 07:00    |             |                    |                     | AB:Early-OUT           |
      | 02/01/2024 | AO-Normal | 06:14    | 13:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AO-Normal | 06:26    | 13:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |
      | 04/01/2024 | AO-Normal | 06:30    | 13:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 05/01/2024 | AO-Normal | 06:35    | 13:00    | AB       | AB       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Early-OUT           |
      | 06/01/2024 | AO-Normal | 06:30    | 13:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal | 07:00    | 13:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |
      | 09/01/2024 | AP-Normal | 07:14    | 14:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 10/01/2024 | AP-Normal | 07:16    | 14:00    | PR       | AB       | 00:01   |           | 06:44      |            | 06:45    |             |                    |                     | AB:Early-OUT           |
      | 11/01/2024 | AP-Normal | 07:26    | 14:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |
      | 12/01/2024 | AP-Normal | 07:30    | 14:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 13/01/2024 | AO-Normal | 07:35    | 14:00    | AB       | PR       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Late-IN             |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal | 08:00    | 14:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |
      | 16/01/2024 | AQ-Normal | 08:14    | 15:00    | PR       | IN       |         |           | 05:46      |            | 05:46    |             |                    |                     |                        |
      | 17/01/2024 | AQ-Normal | 08:16    | 15:00    | PR       | IN       | 00:01   |           | 05:44      |            | 05:45    |             |                    |                     |                        |
      | 18/01/2024 | AQ-Normal | 08:16    | 14:00    | PR       | AB       | 00:01   |           | 05:44      |            | 05:45    |             |                    |                     | AB:Early-OUT           |
      | 19/01/2024 | AP-Normal | 08:35    | 15:00    | AB       | PR       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Late-IN             |
      | 20/01/2024 | AR-Normal | 09:00    | 15:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |

  #shift671415
  @AtdPlcParamCase5
  Scenario: Scenario 2 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority                  | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              5 | true                      | true          | true                        | true            | 00:30             | 00:30              | Late-OUT (Previous Shift) | 16:00              | true                  | false               | Flexible for 24 Hrs |                      |                 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AQ      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AR      | 15:00     | 23:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   02012024 |     070000 |
      | AtdPlc_Ur1 |   02012024 |     152900 |
      | AtdPlc_Ur1 |   03012024 |     070000 |
      | AtdPlc_Ur1 |   03012024 |     153000 |
      | AtdPlc_Ur1 |   04012024 |     070000 |
      | AtdPlc_Ur1 |   04012024 |     154000 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   05012024 |     132900 |
      | AtdPlc_Ur1 |   06012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     133000 |
      | AtdPlc_Ur1 |   08012024 |     060000 |
      | AtdPlc_Ur1 |   08012024 |     063100 |
      | AtdPlc_Ur1 |   08012024 |     133100 |
      | AtdPlc_Ur1 |   09012024 |     142000 |
      | AtdPlc_Ur1 |   09012024 |     220000 |
      | AtdPlc_Ur1 |   10012024 |     143500 |
      | AtdPlc_Ur1 |   10012024 |     221000 |
      | AtdPlc_Ur1 |   11012024 |     152500 |
      | AtdPlc_Ur1 |   11012024 |     230000 |
      | AtdPlc_Ur1 |   12012024 |     141400 |
      | AtdPlc_Ur1 |   12012024 |     220000 |
      | AtdPlc_Ur1 |   13012024 |     141400 |
      | AtdPlc_Ur1 |   13012024 |     215500 |
      | AtdPlc_Ur1 |   15012024 |     141400 |
      | AtdPlc_Ur1 |   15012024 |     220500 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal | 07:00    | 15:29    | PR       | PR       |         |           | 08:29      | 00:29      | 08:29    |             |                    |                     |                        |
      | 03/01/2024 | AP-Normal | 07:00    | 15:30    | PR       | PR       |         |           | 08:30      | 00:30      | 08:30    |             |                    |                     |                        |
      | 04/01/2024 | AP-Normal | 07:00    | 15:40    | PR       | PR       |         |           | 08:40      | 00:40      | 08:40    |             |                    |                     |                        |
      | 05/01/2024 | AO-Normal | 06:00    | 13:29    | PR       | AB       |         |           | 07:29      |            | 07:29    |             |                    |                     | AB:Early-OUT           |
      | 06/01/2024 | AO-Normal | 06:00    | 13:30    | PR       | AB       |         |           | 07:30      |            | 07:30    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AO-Normal | 06:00    | 13:31    | AB       | IN       |         |           | 00:31      |            | 00:31    |             |                    |                     | Punches Not In Pair    |
      | 09/01/2024 | AQ-Normal | 14:20    | 22:00    | PR       | AB       | 00:05   |           | 07:40      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 10/01/2024 | AQ-Normal | 14:35    | 22:10    | AB       | PR       |         |           | 07:35      | 00:10      | 07:35    |             |                    |                     | AB:Late-IN             |
      | 11/01/2024 | AR-Normal | 15:25    | 23:00    | PR       | AB       | 00:10   |           | 07:35      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 12/01/2024 | AQ-Normal | 14:14    | 22:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 13/01/2024 | AQ-Normal | 14:14    | 21:55    | PR       | PR       |         |           | 07:41      |            | 07:41    |             |                    |                     |                        |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal | 14:14    | 22:05    | PR       | PR       |         |           | 07:51      | 00:05      | 07:51    |             |                    |                     |                        |

  #4web1
  @AtdPlcParamCase6
  Scenario: Scenario 3, UserID- 4web1 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AQ      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AO      | 22:00     | 06:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AQ      |               7 |
      | AP      |               7 |
      | AO      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     221400 |
      | AtdPlc_Ur1 |   02012024 |     060000 |
      | AtdPlc_Ur1 |   02012024 |     221600 |
      | AtdPlc_Ur1 |   03012024 |     060000 |
      | AtdPlc_Ur1 |   03012024 |     222600 |
      | AtdPlc_Ur1 |   04012024 |     060000 |
      | AtdPlc_Ur1 |   04012024 |     223500 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     141400 |
      | AtdPlc_Ur1 |   06012024 |     220000 |
      | AtdPlc_Ur1 |   07012024 |     141600 |
      | AtdPlc_Ur1 |   07012024 |     220000 |
      | AtdPlc_Ur1 |   08012024 |     142600 |
      | AtdPlc_Ur1 |   08012024 |     220000 |
      | AtdPlc_Ur1 |   09012024 |     143500 |
      | AtdPlc_Ur1 |   09012024 |     220000 |
      | AtdPlc_Ur1 |   13012024 |     061400 |
      | AtdPlc_Ur1 |   13012024 |     140000 |
      | AtdPlc_Ur1 |   14012024 |     061600 |
      | AtdPlc_Ur1 |   14012024 |     140000 |
      | AtdPlc_Ur1 |   15012024 |     061600 |
      | AtdPlc_Ur1 |   15012024 |     140000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 22:14    | 06:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 02/01/2024 | AO-Normal | 22:16    | 06:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 03/01/2024 | AO-Normal | 22:26    | 06:00    | AB       | PR       |         |           | 07:34      |            | 07:34    |             |                    |                     | AB:Late-IN             |
      | 04/01/2024 | AO-Normal | 22:35    | 06:00    | AB       | PR       |         |           | 07:25      |            | 07:25    |             |                    |                     | AB:Late-IN             |
      | 05/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AP-Normal | 14:14    | 22:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 07/01/2024 | AP-Normal | 14:16    | 22:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 08/01/2024 | AP-Normal | 14:26    | 22:00    | AB       | PR       |         |           | 07:34      |            | 07:34    |             |                    |                     | AB:Late-IN             |
      | 09/01/2024 | AP-Normal | 14:35    | 22:00    | AB       | PR       |         |           | 07:25      |            | 07:25    |             |                    |                     | AB:Late-IN             |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AQ-Normal | 06:14    | 14:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 14/01/2024 | AQ-Normal | 06:16    | 14:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 15/01/2024 | AQ-Normal | 06:16    | 14:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |

  #4web2
  @AtdPlcParamCase7
  Scenario: Scenario 3, UserID- 4web2 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AQ      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AO      | 22:00     | 06:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "22/12/2023"
      | ShiftID | RepeatShiftDays |
      | AQ      |               7 |
      | AP      |               7 |
      | AO      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   06012024 |     141600 |
      | AtdPlc_Ur1 |   06012024 |     220000 |
      | AtdPlc_Ur1 |   07012024 |     141600 |
      | AtdPlc_Ur1 |   07012024 |     220500 |
      | AtdPlc_Ur1 |   08012024 |     141600 |
      | AtdPlc_Ur1 |   08012024 |     215500 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AP-Normal | 14:16    | 22:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 07/01/2024 | AP-Normal | 14:16    | 22:05    | PR       | AB       | 00:01   |           | 07:49      | 00:05      | 07:50    |             |                    |                     | AB:Less Work Hrs       |
      | 08/01/2024 | AP-Normal | 14:16    | 21:55    | PR       | AB       | 00:01   |           | 07:39      |            | 07:40    |             |                    |                     | AB:Less Work Hrs       |

  #0041
  @AtdPlcParamCase8
  Scenario: Scenario 5 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AQ      | 18:00     | 02:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AR      | 08:00     | 16:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AS      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/12/2023"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
      | AS      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   02012024 |     064400 |
      | AtdPlc_Ur1 |   02012024 |     130000 |
      | AtdPlc_Ur1 |   03012024 |     065900 |
      | AtdPlc_Ur1 |   03012024 |     130000 |
      | AtdPlc_Ur1 |   04012024 |     065200 |
      | AtdPlc_Ur1 |   06012024 |     061400 |
      | AtdPlc_Ur1 |   06012024 |     130000 |
      | AtdPlc_Ur1 |   07012024 |     061500 |
      | AtdPlc_Ur1 |   07012024 |     130000 |
      | AtdPlc_Ur1 |   08012024 |     061600 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     062400 |
      | AtdPlc_Ur1 |   09012024 |     130000 |
      | AtdPlc_Ur1 |   10012024 |     062600 |
      | AtdPlc_Ur1 |   10012024 |     130000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal | 06:44    | 13:00    | AB       | AB       |         |           | 06:16      |            | 06:16    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AO-Normal | 06:59    | 13:00    | AB       | AB       |         |           | 06:01      |            | 06:01    |             |                    |                     | AB:Early-OUT           |
      | 04/01/2024 | AS-Normal | 06:52    |          | IN       | AB       |         |           |            | 00:08      |          |             |                    |                     | Punches Not In Pair    |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal | 06:14    | 13:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-Normal | 06:15    | 13:00    | PR       | AB       |         |           | 06:45      |            | 06:45    |             |                    |                     | AB:Early-OUT           |
      | 08/01/2024 | AO-Normal | 06:16    | 13:00    | PR       | AB       | 00:01   |           | 06:44      |            | 06:45    |             |                    |                     | AB:Early-OUT           |
      | 09/01/2024 | AO-Normal | 06:24    | 13:00    | PR       | AB       | 00:09   |           | 06:36      |            | 06:45    |             |                    |                     | AB:Early-OUT           |
      | 10/01/2024 | AO-Normal | 06:26    | 13:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |

  #shiftm1m2m3
  @AtdPlcParamCase9
  Scenario: Scenario 6 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 12:00   | 03:00   | 06:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 10:00     | 18:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AQ      | 17:00     | 03:00   | 05:00   | 10:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     054500 |
      | AtdPlc_Ur1 |   01012024 |     120000 |
      | AtdPlc_Ur1 |   02012024 |     055500 |
      | AtdPlc_Ur1 |   02012024 |     120000 |
      | AtdPlc_Ur1 |   03012024 |     061400 |
      | AtdPlc_Ur1 |   03012024 |     120000 |
      | AtdPlc_Ur1 |   04012024 |     094500 |
      | AtdPlc_Ur1 |   04012024 |     180000 |
      | AtdPlc_Ur1 |   05012024 |     095500 |
      | AtdPlc_Ur1 |   05012024 |     180000 |
      | AtdPlc_Ur1 |   06012024 |     100500 |
      | AtdPlc_Ur1 |   06012024 |     180000 |
      | AtdPlc_Ur1 |   08012024 |     101600 |
      | AtdPlc_Ur1 |   08012024 |     180000 |
      | AtdPlc_Ur1 |   09012024 |     103100 |
      | AtdPlc_Ur1 |   09012024 |     180000 |
      | AtdPlc_Ur1 |   10012024 |     171400 |
      | AtdPlc_Ur1 |   11012024 |     030000 |
      | AtdPlc_Ur1 |   11012024 |     171600 |
      | AtdPlc_Ur1 |   12012024 |     030000 |
      | AtdPlc_Ur1 |   12012024 |     175500 |
      | AtdPlc_Ur1 |   13012024 |     030000 |
      | AtdPlc_Ur1 |   13012024 |     180500 |
      | AtdPlc_Ur1 |   14012024 |     030000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 05:45    | 12:00    | PR       | PR       |         |           | 06:15      | 00:15      | 06:00    |             |                    |                     |                        |
      | 02/01/2024 | AO-Normal | 05:55    | 12:00    | PR       | PR       |         |           | 06:05      | 00:05      | 06:00    |             |                    |                     |                        |
      | 03/01/2024 | AO-Normal | 06:14    | 12:00    | PR       | PR       |         |           | 05:46      |            | 05:46    |             |                    |                     |                        |
      | 04/01/2024 | AP-Normal | 09:45    | 18:00    | PR       | PR       |         |           | 08:15      | 00:15      | 08:00    |             |                    |                     |                        |
      | 05/01/2024 | AP-Normal | 09:55    | 18:00    | PR       | PR       |         |           | 08:05      | 00:05      | 08:00    |             |                    |                     |                        |
      | 06/01/2024 | AP-Normal | 10:05    | 18:00    | PR       | PR       |         |           | 07:55      |            | 07:55    |             |                    |                     |                        |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal | 10:16    | 18:00    | PR       | AB       | 00:01   |           | 07:44      |            | 07:45    |             |                    |                     | AB:Less Work Hrs       |
      | 09/01/2024 | AP-Normal | 10:31    | 18:00    | AB       | PR       |         |           | 07:29      |            | 07:29    |             |                    |                     | AB:Late-IN             |
      | 10/01/2024 | AQ-Normal | 17:14    | 03:00    | PR       | PR       |         |           | 09:46      |            | 09:46    |             | 01:00              |                     |                        |
      | 11/01/2024 | AQ-Normal | 17:16    | 03:00    | PR       | AB       | 00:01   |           | 09:44      |            | 09:45    |             | 01:00              |                     | AB:Less Work Hrs       |
      | 12/01/2024 | AQ-Normal | 17:55    | 03:00    | AB       | PR       |         |           | 09:05      |            | 09:05    |             | 00:30              |                     | AB:Late-IN             |
      | 13/01/2024 | AQ-Normal | 18:05    | 03:00    | AB       | PR       |         |           | 08:55      |            | 08:55    |             | 00:30              |                     | AB:Late-IN             |

  #shiftm1m2m3late
  @AtdPlcParamCase10
  Scenario: Scenario 7 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority                  | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              5 | true                      | true          | true                        | true            | 00:30             | 00:30              | Late-OUT (Previous Shift) | 16:00              | true                  | false               | Flexible for 24 Hrs |                      |                 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 12:00   | 03:00   | 06:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AP      | 10:00     | 18:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
      | AQ      | 17:00     | 03:00   | 05:00   | 10:00   |            |          | true                | true               |                    15 | false              |                       5 | false                | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     060000 |
      | AtdPlc_Ur1 |   01012024 |     100000 |
      | AtdPlc_Ur1 |   02012024 |     060000 |
      | AtdPlc_Ur1 |   02012024 |     110000 |
      | AtdPlc_Ur1 |   03012024 |     060000 |
      | AtdPlc_Ur1 |   03012024 |     114500 |
      | AtdPlc_Ur1 |   04012024 |     060000 |
      | AtdPlc_Ur1 |   04012024 |     115000 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   05012024 |     121400 |
      | AtdPlc_Ur1 |   06012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     121600 |
      | AtdPlc_Ur1 |   08012024 |     060000 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     100000 |
      | AtdPlc_Ur1 |   09012024 |     174500 |
      | AtdPlc_Ur1 |   10012024 |     100000 |
      | AtdPlc_Ur1 |   10012024 |     105000 |
      | AtdPlc_Ur1 |   10012024 |     175000 |
      | AtdPlc_Ur1 |   11012024 |     100000 |
      | AtdPlc_Ur1 |   11012024 |     180000 |
      | AtdPlc_Ur1 |   12012024 |     100000 |
      | AtdPlc_Ur1 |   12012024 |     181000 |
      | AtdPlc_Ur1 |   13012024 |     100000 |
      | AtdPlc_Ur1 |   14012024 |     000000 |
      | AtdPlc_Ur1 |   15012024 |     030000 |
      | AtdPlc_Ur1 |   15012024 |     100000 |
      | AtdPlc_Ur1 |   21012024 |     030000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 06:00    | 10:00    | PR       | AB       |         |           | 04:00      |            | 04:00    |             |                    |                     | AB:Early-OUT           |
      | 02/01/2024 | AO-Normal | 06:00    | 11:00    | PR       | AB       |         |           | 05:00      |            | 05:00    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AO-Normal | 06:00    | 11:45    | PR       | AB       |         | 00:10     | 05:45      |            | 05:55    |             |                    |                     | AB:Less Work Hrs       |
      | 04/01/2024 | AO-Normal | 06:00    | 11:50    | PR       | AB       |         | 00:05     | 05:50      |            | 05:55    |             |                    |                     | AB:Less Work Hrs       |
      | 05/01/2024 | AO-Normal | 06:00    | 12:14    | PR       | PR       |         |           | 06:14      | 00:14      | 06:14    |             |                    |                     |                        |
      | 06/01/2024 | AO-Normal | 06:00    | 12:16    | PR       | PR       |         |           | 06:16      | 00:16      | 06:16    |             |                    |                     |                        |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AO-Normal | 06:00    | 13:00    | PR       | PR       |         |           | 07:00      | 01:00      | 07:00    |             |                    |                     |                        |
      | 09/01/2024 | AP-Normal | 10:00    | 17:45    | PR       | AB       |         | 00:10     | 07:45      |            | 07:55    |             |                    |                     | AB:Less Work Hrs       |
      | 10/01/2024 | AP-Normal | 10:00    | 17:50    | AB       | IN       |         |           | 00:50      |            | 00:50    |             |                    |                     | Punches Not In Pair    |
      | 11/01/2024 | AP-Normal | 10:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 08:00    |             |                    |                     |                        |
      | 12/01/2024 | AP-Normal | 10:00    | 18:10    | PR       | PR       |         |           | 08:10      | 00:10      | 08:10    |             |                    |                     |                        |
      | 13/01/2024 | AP-Normal | 10:00    | 00:00    | PR       | PR       |         |           | 14:00      | 06:00      | 14:00    |             | 05:30              |                     |                        |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AO-Normal | 03:00    | 10:00    | PR       | AB       |         |           | 07:00      | 03:00      | 04:00    |             |                    |                     | AB:Early-OUT           |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AO-WO     | 03:00    |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                        |

  #shift6789
  @AtdPlcParamCase11
  Scenario: Scenario 8 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 08:00     | 16:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AR      | 09:00     | 17:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     060000 |
      | AtdPlc_Ur1 |   01012024 |     130000 |
      | AtdPlc_Ur1 |   02012024 |     061400 |
      | AtdPlc_Ur1 |   02012024 |     130000 |
      | AtdPlc_Ur1 |   03012024 |     062600 |
      | AtdPlc_Ur1 |   03012024 |     130000 |
      | AtdPlc_Ur1 |   04012024 |     063000 |
      | AtdPlc_Ur1 |   04012024 |     130000 |
      | AtdPlc_Ur1 |   05012024 |     063500 |
      | AtdPlc_Ur1 |   05012024 |     130000 |
      | AtdPlc_Ur1 |   06012024 |     063000 |
      | AtdPlc_Ur1 |   06012024 |     130000 |
      | AtdPlc_Ur1 |   08012024 |     070000 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     071400 |
      | AtdPlc_Ur1 |   09012024 |     140000 |
      | AtdPlc_Ur1 |   10012024 |     071600 |
      | AtdPlc_Ur1 |   10012024 |     140000 |
      | AtdPlc_Ur1 |   11012024 |     072600 |
      | AtdPlc_Ur1 |   11012024 |     140000 |
      | AtdPlc_Ur1 |   12012024 |     073000 |
      | AtdPlc_Ur1 |   12012024 |     140000 |
      | AtdPlc_Ur1 |   13012024 |     073500 |
      | AtdPlc_Ur1 |   13012024 |     140000 |
      | AtdPlc_Ur1 |   15012024 |     080000 |
      | AtdPlc_Ur1 |   15012024 |     140000 |
      | AtdPlc_Ur1 |   16012024 |     081400 |
      | AtdPlc_Ur1 |   16012024 |     140000 |
      | AtdPlc_Ur1 |   16012024 |     150000 |
      | AtdPlc_Ur1 |   17012024 |     081600 |
      | AtdPlc_Ur1 |   17012024 |     140000 |
      | AtdPlc_Ur1 |   17012024 |     150000 |
      | AtdPlc_Ur1 |   18012024 |     081600 |
      | AtdPlc_Ur1 |   18012024 |     140000 |
      | AtdPlc_Ur1 |   19012024 |     083500 |
      | AtdPlc_Ur1 |   19012024 |     150000 |
      | AtdPlc_Ur1 |   20012024 |     090000 |
      | AtdPlc_Ur1 |   20012024 |     150000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 06:00    | 13:00    | PR       | AB       |         |           | 07:00      |            | 07:00    |             |                    |                     | AB:Early-OUT           |
      | 02/01/2024 | AO-Normal | 06:14    | 13:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AO-Normal | 06:26    | 13:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |
      | 04/01/2024 | AO-Normal | 06:30    | 13:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 05/01/2024 | AO-Normal | 06:35    | 13:00    | AB       | AB       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Early-OUT           |
      | 06/01/2024 | AO-Normal | 06:30    | 13:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal | 07:00    | 13:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |
      | 09/01/2024 | AP-Normal | 07:14    | 14:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 10/01/2024 | AP-Normal | 07:16    | 14:00    | AB       | AB       |         |           | 06:44      |            | 06:44    |             |                    |                     | AB:Early-OUT           |
      | 11/01/2024 | AP-Normal | 07:26    | 14:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |
      | 12/01/2024 | AP-Normal | 07:30    | 14:00    | AB       | AB       |         |           | 06:30      |            | 06:30    |             |                    |                     | AB:Early-OUT           |
      | 13/01/2024 | AO-Normal | 07:35    | 14:00    | AB       | PR       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Late-IN             |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal | 08:00    | 14:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |
      | 16/01/2024 | AQ-Normal | 08:14    | 15:00    | PR       | IN       |         |           | 05:46      |            | 05:46    |             |                    |                     |                        |
      | 17/01/2024 | AQ-Normal | 08:16    | 15:00    | AB       | IN       |         |           | 05:44      |            | 05:44    |             |                    |                     | Punches Not In Pair    |
      | 18/01/2024 | AQ-Normal | 08:16    | 14:00    | AB       | AB       |         |           | 05:44      |            | 05:44    |             |                    |                     | AB:Early-OUT           |
      | 19/01/2024 | AP-Normal | 08:35    | 15:00    | AB       | PR       |         |           | 06:25      |            | 06:25    |             |                    |                     | AB:Late-IN             |
      | 20/01/2024 | AR-Normal | 09:00    | 15:00    | PR       | AB       |         |           | 06:00      |            | 06:00    |             |                    |                     | AB:Early-OUT           |

  #shift671415
  @AtdPlcParamCase12
  Scenario: Scenario 9 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority                  | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              5 | true                      | true          | true                        | true            | 00:30             | 00:30              | Late-OUT (Previous Shift) | 16:00              | true                  | false               | Flexible for 24 Hrs |                      |                 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AR      | 15:00     | 23:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   02012024 |     070000 |
      | AtdPlc_Ur1 |   02012024 |     152900 |
      | AtdPlc_Ur1 |   03012024 |     070000 |
      | AtdPlc_Ur1 |   03012024 |     153000 |
      | AtdPlc_Ur1 |   04012024 |     070000 |
      | AtdPlc_Ur1 |   04012024 |     154000 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   05012024 |     132900 |
      | AtdPlc_Ur1 |   06012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     133000 |
      | AtdPlc_Ur1 |   08012024 |     060000 |
      | AtdPlc_Ur1 |   08012024 |     063100 |
      | AtdPlc_Ur1 |   08012024 |     133100 |
      | AtdPlc_Ur1 |   09012024 |     142000 |
      | AtdPlc_Ur1 |   09012024 |     220000 |
      | AtdPlc_Ur1 |   10012024 |     143500 |
      | AtdPlc_Ur1 |   10012024 |     221000 |
      | AtdPlc_Ur1 |   11012024 |     152500 |
      | AtdPlc_Ur1 |   11012024 |     230000 |
      | AtdPlc_Ur1 |   12012024 |     141400 |
      | AtdPlc_Ur1 |   12012024 |     220000 |
      | AtdPlc_Ur1 |   13012024 |     141400 |
      | AtdPlc_Ur1 |   13012024 |     215500 |
      | AtdPlc_Ur1 |   15012024 |     141400 |
      | AtdPlc_Ur1 |   15012024 |     220500 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal | 07:00    | 15:29    | PR       | PR       |         |           | 08:29      | 00:29      | 08:29    |             |                    |                     |                        |
      | 03/01/2024 | AP-Normal | 07:00    | 15:30    | PR       | PR       |         |           | 08:30      | 00:30      | 08:30    |             |                    |                     |                        |
      | 04/01/2024 | AP-Normal | 07:00    | 15:40    | PR       | PR       |         |           | 08:40      | 00:40      | 08:40    |             |                    |                     |                        |
      | 05/01/2024 | AO-Normal | 06:00    | 13:29    | PR       | AB       |         |           | 07:29      |            | 07:29    |             |                    |                     | AB:Early-OUT           |
      | 06/01/2024 | AO-Normal | 06:00    | 13:30    | PR       | AB       |         |           | 07:30      |            | 07:30    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AO-Normal | 06:00    | 13:31    | AB       | IN       |         |           | 00:31      |            | 00:31    |             |                    |                     | Punches Not In Pair    |
      | 09/01/2024 | AQ-Normal | 14:20    | 22:00    | AB       | PR       |         |           | 07:40      |            | 07:40    |             |                    |                     | AB:Late-IN             |
      | 10/01/2024 | AQ-Normal | 14:35    | 22:10    | AB       | PR       |         |           | 07:35      | 00:10      | 07:35    |             |                    |                     | AB:Late-IN             |
      | 11/01/2024 | AR-Normal | 15:25    | 23:00    | AB       | PR       |         |           | 07:35      |            | 07:35    |             |                    |                     | AB:Late-IN             |
      | 12/01/2024 | AQ-Normal | 14:14    | 22:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 13/01/2024 | AQ-Normal | 14:14    | 21:55    | PR       | PR       |         |           | 07:41      |            | 07:41    |             |                    |                     |                        |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal | 14:14    | 22:05    | PR       | PR       |         |           | 07:51      | 00:05      | 07:51    |             |                    |                     |                        |

  #4web1
  @AtdPlcParamCase13
  Scenario: Scenario 10, UserID- 4web1 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 22:00     | 06:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     221400 |
      | AtdPlc_Ur1 |   02012024 |     060000 |
      | AtdPlc_Ur1 |   02012024 |     221600 |
      | AtdPlc_Ur1 |   03012024 |     060000 |
      | AtdPlc_Ur1 |   03012024 |     222600 |
      | AtdPlc_Ur1 |   04012024 |     060000 |
      | AtdPlc_Ur1 |   04012024 |     223500 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     141400 |
      | AtdPlc_Ur1 |   06012024 |     220000 |
      | AtdPlc_Ur1 |   07012024 |     141600 |
      | AtdPlc_Ur1 |   07012024 |     220000 |
      | AtdPlc_Ur1 |   08012024 |     142600 |
      | AtdPlc_Ur1 |   08012024 |     220000 |
      | AtdPlc_Ur1 |   09012024 |     143500 |
      | AtdPlc_Ur1 |   09012024 |     220000 |
      | AtdPlc_Ur1 |   13012024 |     061400 |
      | AtdPlc_Ur1 |   13012024 |     140000 |
      | AtdPlc_Ur1 |   14012024 |     061600 |
      | AtdPlc_Ur1 |   14012024 |     140000 |
      | AtdPlc_Ur1 |   15012024 |     061600 |
      | AtdPlc_Ur1 |   15012024 |     140000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal | 22:14    | 06:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 02/01/2024 | AO-Normal | 22:16    | 06:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |
      | 03/01/2024 | AO-Normal | 22:26    | 06:00    | AB       | PR       |         |           | 07:34      |            | 07:34    |             |                    |                     | AB:Late-IN             |
      | 04/01/2024 | AO-Normal | 22:35    | 06:00    | AB       | PR       |         |           | 07:25      |            | 07:25    |             |                    |                     | AB:Late-IN             |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AP-Normal | 14:14    | 22:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 07/01/2024 | AP-Normal | 14:16    | 22:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |
      | 08/01/2024 | AP-Normal | 14:26    | 22:00    | AB       | PR       |         |           | 07:34      |            | 07:34    |             |                    |                     | AB:Late-IN             |
      | 09/01/2024 | AP-Normal | 14:35    | 22:00    | AB       | PR       |         |           | 07:25      |            | 07:25    |             |                    |                     | AB:Late-IN             |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AQ-Normal | 06:14    | 14:00    | PR       | PR       |         |           | 07:46      |            | 07:46    |             |                    |                     |                        |
      | 14/01/2024 | AQ-Normal | 06:16    | 14:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |
      | 15/01/2024 | AQ-Normal | 06:16    | 14:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |

  #4web2
  @AtdPlcParamCase14
  Scenario: Scenario 10, UserID- 4web2 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 22:00     | 06:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "22/12/2023"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   06012024 |     141600 |
      | AtdPlc_Ur1 |   06012024 |     220000 |
      | AtdPlc_Ur1 |   07012024 |     141600 |
      | AtdPlc_Ur1 |   07012024 |     220500 |
      | AtdPlc_Ur1 |   08012024 |     141600 |
      | AtdPlc_Ur1 |   08012024 |     215500 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AP-Normal | 14:16    | 22:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |
      | 07/01/2024 | AP-Normal | 14:16    | 22:05    | AB       | PR       |         |           | 07:49      | 00:05      | 07:49    |             |                    |                     | AB:Late-IN             |
      | 08/01/2024 | AP-Normal | 14:16    | 21:55    | AB       | PR       |         |           | 07:39      |            | 07:39    |             |                    |                     | AB:Late-IN             |

  #0041
  @AtdPlcParamCase15
  Scenario: Scenario 11 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 06:00     | 14:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 14:00     | 22:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 18:00     | 02:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AR      | 08:00     | 16:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AS      | 07:00     | 15:00   | 04:00   | 07:50   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/12/2023"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
      | AR      |               7 |
      | AS      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AO"
      | OffDay1 |
      | Friday  |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 08/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 15/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 22/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AR-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 27/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 29/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AR-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   02012024 |     064400 |
      | AtdPlc_Ur1 |   02012024 |     130000 |
      | AtdPlc_Ur1 |   03012024 |     065900 |
      | AtdPlc_Ur1 |   03012024 |     130000 |
      | AtdPlc_Ur1 |   04012024 |     065200 |
      | AtdPlc_Ur1 |   06012024 |     061400 |
      | AtdPlc_Ur1 |   06012024 |     130000 |
      | AtdPlc_Ur1 |   07012024 |     061500 |
      | AtdPlc_Ur1 |   07012024 |     130000 |
      | AtdPlc_Ur1 |   08012024 |     061600 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     062400 |
      | AtdPlc_Ur1 |   09012024 |     130000 |
      | AtdPlc_Ur1 |   10012024 |     062600 |
      | AtdPlc_Ur1 |   10012024 |     130000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AS-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal | 06:44    | 13:00    | AB       | AB       |         |           | 06:16      |            | 06:16    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AO-Normal | 06:59    | 13:00    | AB       | AB       |         |           | 06:01      |            | 06:01    |             |                    |                     | AB:Early-OUT           |
      | 04/01/2024 | AS-Normal | 06:52    |          | IN       | AB       |         |           |            | 00:08      |          |             |                    |                     | Punches Not In Pair    |
      | 05/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 06/01/2024 | AO-Normal | 06:14    | 13:00    | PR       | AB       |         |           | 06:46      |            | 06:46    |             |                    |                     | AB:Early-OUT           |
      | 07/01/2024 | AO-Normal | 06:15    | 13:00    | PR       | AB       |         |           | 06:45      |            | 06:45    |             |                    |                     | AB:Early-OUT           |
      | 08/01/2024 | AO-Normal | 06:16    | 13:00    | AB       | AB       |         |           | 06:44      |            | 06:44    |             |                    |                     | AB:Early-OUT           |
      | 09/01/2024 | AO-Normal | 06:24    | 13:00    | AB       | AB       |         |           | 06:36      |            | 06:36    |             |                    |                     | AB:Early-OUT           |
      | 10/01/2024 | AO-Normal | 06:26    | 13:00    | AB       | AB       |         |           | 06:34      |            | 06:34    |             |                    |                     | AB:Early-OUT           |

  #shiftm1m2m3  (0to5 sh)
  @AtdPlcParamCase16
  Scenario: Scenario 12 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority              | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs     | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              2 | true                      | true          | true                        | true            | 00:30             | 00:30              | Early-IN (Next Shift) | 16:00              | false                 | true                | From Shift Start |                   10 |              20 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 10:00     | 18:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 06:00     | 12:00   | 03:00   | 06:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 17:00     | 03:00   | 05:00   | 10:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     054500 |
      | AtdPlc_Ur1 |   01012024 |     120000 |
      | AtdPlc_Ur1 |   02012024 |     055500 |
      | AtdPlc_Ur1 |   02012024 |     120000 |
      | AtdPlc_Ur1 |   03012024 |     061400 |
      | AtdPlc_Ur1 |   03012024 |     120000 |
      | AtdPlc_Ur1 |   04012024 |     094500 |
      | AtdPlc_Ur1 |   04012024 |     180000 |
      | AtdPlc_Ur1 |   05012024 |     095500 |
      | AtdPlc_Ur1 |   05012024 |     180000 |
      | AtdPlc_Ur1 |   06012024 |     100500 |
      | AtdPlc_Ur1 |   06012024 |     180000 |
      | AtdPlc_Ur1 |   08012024 |     101600 |
      | AtdPlc_Ur1 |   08012024 |     180000 |
      | AtdPlc_Ur1 |   09012024 |     103100 |
      | AtdPlc_Ur1 |   09012024 |     180000 |
      | AtdPlc_Ur1 |   10012024 |     171400 |
      | AtdPlc_Ur1 |   11012024 |     030000 |
      | AtdPlc_Ur1 |   11012024 |     171600 |
      | AtdPlc_Ur1 |   12012024 |     030000 |
      | AtdPlc_Ur1 |   12012024 |     175500 |
      | AtdPlc_Ur1 |   13012024 |     030000 |
      | AtdPlc_Ur1 |   13012024 |     180500 |
      | AtdPlc_Ur1 |   14012024 |     030000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal | 05:45    | 12:00    | PR       | PR       |         |           | 06:15      | 00:15      | 06:00    |             |                    |                     |                        |
      | 02/01/2024 | AP-Normal | 05:55    | 12:00    | PR       | PR       |         |           | 06:05      | 00:05      | 06:00    |             |                    |                     |                        |
      | 03/01/2024 | AP-Normal | 06:14    | 12:00    | PR       | PR       |         |           | 05:46      |            | 05:46    |             |                    |                     |                        |
      | 04/01/2024 | AO-Normal | 09:45    | 18:00    | PR       | PR       |         |           | 08:15      | 00:15      | 08:00    |             |                    |                     |                        |
      | 05/01/2024 | AO-Normal | 09:55    | 18:00    | PR       | PR       |         |           | 08:05      | 00:05      | 08:00    |             |                    |                     |                        |
      | 06/01/2024 | AO-Normal | 10:05    | 18:00    | PR       | PR       |         |           | 07:55      |            | 07:55    |             |                    |                     |                        |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AO-Normal | 10:16    | 18:00    | AB       | PR       |         |           | 07:44      |            | 07:44    |             |                    |                     | AB:Late-IN             |
      | 09/01/2024 | AO-Normal | 10:31    | 18:00    | AB       | PR       |         |           | 07:29      |            | 07:29    |             |                    |                     | AB:Late-IN             |
      | 10/01/2024 | AQ-Normal | 17:14    | 03:00    | PR       | PR       |         |           | 09:46      |            | 09:46    |             | 01:00              |                     |                        |
      | 11/01/2024 | AQ-Normal | 17:16    | 03:00    | AB       | PR       |         |           | 09:44      |            | 09:44    |             | 01:30              |                     | AB:Late-IN             |
      | 12/01/2024 | AQ-Normal | 17:55    | 03:00    | AB       | PR       |         |           | 09:05      |            | 09:05    |             | 00:30              |                     | AB:Late-IN             |
      | 13/01/2024 | AQ-Normal | 18:05    | 03:00    | AB       | PR       |         |           | 08:55      |            | 08:55    |             | 00:30              |                     | AB:Late-IN             |

  #shiftm1m2m3late (0to5 sh)
  @AtdPlcParamCase17
  Scenario: Scenario 13 from "Auto Shift Correction_FIT-5520.xlsx" file (Only for configuration)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | AtdPlc_Ur1 |
      | AtdPlc_Ur2 |
      | AtdPlc_Ur3 |
    And Delete "AO" shift schedule
    And Delete "AO" shift
    And Delete "AP" shift
    And Delete "AQ" shift
    And Delete "AR" shift
    And Delete "AS" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | AtdPlcParam1 |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | DeductOutTime | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | AtdProcessCalib | MaxErlyInAllowHrs | MaxLateOutAllowHrs | Priority                  | MaxWrkHrsPerDayHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectLeave | ConsDailyHrs        | DlyGrcLimitInMinutes | GrcCountMonthly | FlexHrsCal | validation         |
      | AtdPlcParam1 |                4 | Always        |              5 | true                      | true          | true                        | true            | 00:30             | 00:30              | Late-OUT (Previous Shift) | 16:00              | true                  | false               | Flexible for 24 Hrs |                      |                 | None       | Saved Successfully |
    And Create Absentee Policy
      | PlcName      | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | AtdPlcParam1 | false            | false            | true                      | false             | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "AtdPlcParam1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    2359 | Work       |      0000 |    1.0 | Check All      |
      | Late-IN                 |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
      | Early-OUT               |      0000 |    0010 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAlwOvrlpgWrkComp | DailySpecOTRangeFrom | DailySpecOTRangeTo | WklyMthlyOTCal | validation         |
      | AtdPlcParam1 | AtdPlcParam1   | true      | All     | true           | Daily 2    | false           | true                  | 07:00                | 19:00              | Disabled       | Saved Successfully |
    And Overtime Rounding For Fraction Of An Hour Configuration In Overtime Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      20 | Fixed           |            0 |
      |        21 |      30 | Fixed           |           30 |
      |        31 |      50 | Fixed           |           30 |
      |        51 |      59 | Fixed           |           60 |
    And Overtime Calculation Daily2 Work Component Configuration In Overtime Policy "AtdPlcParam1"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor | OTAssignAsPer           | ApplicableDays       |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | WO/PH,WO,PH,FB,RD    |
      |          00030 |        02359 |     00000 | OT2        |   1.00 | Special Time Range      | WO/PH,WO,PH,FB,RD    |
      |          00830 |        02359 |     00000 | OT2        |   1.00 | Priority Work Component | Su,Mo,Tu,We,Th,Fr,Sa |
      |          00830 |        02359 |     00000 | OT1        |   1.00 | Special Time Range      | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create Late-In Policy
      | Name         | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True             |        10 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name         | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdPlcParam1 | True               |          10 |                          | Saved Successfully |
    And Update Rounding For Fraction Of An Hour of EarlyOut Policy "AtdPlcParam1"
      | RangeFrom | RangeTo | ConsiderValueAs | ReplaceValue |
      |         1 |      10 | Fixed           |            0 |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | AtdPlcParam1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | GrcTimeforShiftEarlyOUT | OverlapShiftEarlyOUT | Validation         |
      | AO      | 10:00     | 18:00   | 04:00   | 08:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AP      | 06:00     | 12:00   | 03:00   | 06:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
      | AQ      | 17:00     | 03:00   | 05:00   | 10:00   |            |          | true                | true               |                    15 | true               |                       5 | true                 | Saved Successfully |
    And Create Shift Schedule "AO" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AO      |               7 |
      | AP      |               7 |
      | AQ      |               7 |
    And Create user from user configuration
      | userid     | Active | LeaveGroup | AtdEnable | AttendancePlc | AbsenteePlc  | OvertimePlc  | LateInPlc    | EarlyOutPlc  | CoffPlc      | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdPlc_Ur1 | True   |            | True      | AtdPlcParam1  | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 | AtdPlcParam1 |                   | AO            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID     |
      | AtdPlc_Ur1 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 02/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 03/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 04/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 05/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 06/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 09/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 10/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 11/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 12/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 13/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AQ-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 22/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 23/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 24/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 25/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 26/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 27/01/2024 | AO-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 28/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 29/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 30/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 31/01/2024 | AP-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | AtdPlc_Ur1 |   01012024 |     060000 |
      | AtdPlc_Ur1 |   01012024 |     100000 |
      | AtdPlc_Ur1 |   02012024 |     060000 |
      | AtdPlc_Ur1 |   02012024 |     110000 |
      | AtdPlc_Ur1 |   03012024 |     060000 |
      | AtdPlc_Ur1 |   03012024 |     114500 |
      | AtdPlc_Ur1 |   04012024 |     060000 |
      | AtdPlc_Ur1 |   04012024 |     115000 |
      | AtdPlc_Ur1 |   05012024 |     060000 |
      | AtdPlc_Ur1 |   05012024 |     121400 |
      | AtdPlc_Ur1 |   06012024 |     060000 |
      | AtdPlc_Ur1 |   06012024 |     121600 |
      | AtdPlc_Ur1 |   08012024 |     060000 |
      | AtdPlc_Ur1 |   08012024 |     130000 |
      | AtdPlc_Ur1 |   09012024 |     100000 |
      | AtdPlc_Ur1 |   09012024 |     174500 |
      | AtdPlc_Ur1 |   10012024 |     100000 |
      | AtdPlc_Ur1 |   10012024 |     105000 |
      | AtdPlc_Ur1 |   10012024 |     175000 |
      | AtdPlc_Ur1 |   11012024 |     100000 |
      | AtdPlc_Ur1 |   11012024 |     180000 |
      | AtdPlc_Ur1 |   12012024 |     100000 |
      | AtdPlc_Ur1 |   12012024 |     181000 |
      | AtdPlc_Ur1 |   13012024 |     100000 |
      | AtdPlc_Ur1 |   14012024 |     000000 |
      | AtdPlc_Ur1 |   15012024 |     030000 |
      | AtdPlc_Ur1 |   15012024 |     100000 |
      | AtdPlc_Ur1 |   21012024 |     030000 |
    And Daily Attendance View for userid "AtdPlc_Ur1" and period "Date" on "01/01/2024" and "31/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                 |
      | 01/01/2024 | AP-Normal | 06:00    | 10:00    | PR       | AB       |         |           | 04:00      |            | 04:00    |             |                    |                     | AB:Early-OUT           |
      | 02/01/2024 | AP-Normal | 06:00    | 11:00    | PR       | AB       |         |           | 05:00      |            | 05:00    |             |                    |                     | AB:Early-OUT           |
      | 03/01/2024 | AP-Normal | 06:00    | 11:45    | PR       | AB       |         |           | 05:45      |            | 05:45    |             |                    |                     | AB:Early-OUT           |
      | 04/01/2024 | AP-Normal | 06:00    | 11:50    | PR       | AB       |         | 00:10     | 05:50      |            | 06:00    |             |                    |                     | AB:Less Work Hrs       |
      | 05/01/2024 | AP-Normal | 06:00    | 12:14    | PR       | PR       |         |           | 06:14      | 00:14      | 06:14    |             |                    |                     |                        |
      | 06/01/2024 | AP-Normal | 06:00    | 12:16    | PR       | PR       |         |           | 06:16      | 00:16      | 06:16    |             |                    |                     |                        |
      | 07/01/2024 | AO-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 08/01/2024 | AP-Normal | 06:00    | 13:00    | PR       | PR       |         |           | 07:00      | 01:00      | 07:00    |             |                    |                     |                        |
      | 09/01/2024 | AO-Normal | 10:00    | 17:45    | PR       | AB       |         |           | 07:45      |            | 07:45    |             |                    |                     | AB:Early-OUT           |
      | 10/01/2024 | AO-Normal | 10:00    | 17:50    | AB       | IN       |         |           | 00:50      |            | 00:50    |             |                    |                     | Punches Not In Pair    |
      | 11/01/2024 | AO-Normal | 10:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 08:00    |             |                    |                     |                        |
      | 12/01/2024 | AO-Normal | 10:00    | 18:10    | PR       | PR       |         |           | 08:10      | 00:10      | 08:10    |             |                    |                     |                        |
      | 13/01/2024 | AO-Normal | 10:00    | 00:00    | PR       | PR       |         |           | 14:00      | 06:00      | 14:00    |             | 05:30              |                     |                        |
      | 14/01/2024 | AP-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Club Rule |
      | 15/01/2024 | AP-Normal | 03:00    | 10:00    | PR       | AB       |         |           | 07:00      | 03:00      | 04:00    |             |                    |                     | AB:Early-OUT           |
      | 16/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 17/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 18/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 19/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 20/01/2024 | AQ-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available   |
      | 21/01/2024 | AP-WO     | 03:00    |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                        |

      @FIT7073
  Scenario: UI Attendance Correction Restrictions - FIT7073
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | FIT7073_1  |                2 | Attendance Correction    |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_2  |                2 | Attendance Correction    |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_3  |                2 | Attendance Correction    |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_4  |                2 | Attendance Correction    |                          |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_5  |                2 |  Short Leave/Official In-Out     |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_6  |                2 |  Short Leave/Official In-Out     |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_7  |                2 |  Short Leave/Official In-Out     |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_8  |                2 |  Short Leave/Official In-Out     |                          |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_9  |                2 |  Both      |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_10 |                2 |   Both      |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_11 |                2 |   Both      |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_12 |                2 |   Both      |                          |                          | False                       |                                 |                         |                            | Saved Successfully |

      