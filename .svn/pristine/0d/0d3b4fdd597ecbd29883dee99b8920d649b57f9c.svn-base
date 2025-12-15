@T&A
Feature: Manage Attendance
  I want to use this template for my feature file

  @MACase1
  Scenario: Manage Attendance -> Validate Attendance Summary for Single User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | FC      | FC        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | Saved Successfully |
      | FD      | FD        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
      | FE      | FE        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FF     | FF       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp1" with Pro-rata "False"
      | LeaveID |
      | FC      |
      | FD      |
      | FE      |
      | FF      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |                2 |              1 | true                      | false         | true                        | true                 |                       500 |                       30 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/01/2024 | 26/01/2024 | RepublicDay | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp1   | True      |                        2 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp1   | True      |                        4 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr3 | True   | MALvGrp1   | True      | N-Punch                  | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    5 |          |                | FC         |      0 | January | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FD         |      0 | January | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    5 |          |                | FC         |      0 | January | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FD         |      0 | January | 2024 |          | credit | 010:00 |
      | MAUsr3 |          0 |           0 |                 |                 |    5 |          |                | FC         |      0 | January | 2024 |          | credit |        |
      | MAUsr3 |          0 |           0 |                 |                 |      |          |                | FD         |      0 | January | 2024 |          | credit | 010:00 |
    When Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03012024 |     090000 |       |
      | MAUsr1 |   03012024 |     175500 |     4 |
      | MAUsr1 |   04012024 |     091500 |       |
      | MAUsr1 |   04012024 |     180000 |       |
      | MAUsr1 |   05012024 |     092000 |     3 |
      | MAUsr1 |   05012024 |     182000 |       |
      | MAUsr1 |   06012024 |     094000 |     3 |
      | MAUsr1 |   06012024 |     184000 |       |
      | MAUsr1 |   08012024 |     094500 |     3 |
      | MAUsr1 |   08012024 |     190000 |       |
      | MAUsr1 |   09012024 |     090000 |       |
      | MAUsr1 |   09012024 |     190000 |       |
      | MAUsr1 |   10012024 |     090000 |       |
      | MAUsr1 |   10012024 |     180000 |       |
      | MAUsr1 |   12012024 |     090000 |       |
      | MAUsr1 |   12012024 |     130000 |       |
      | MAUsr1 |   13012024 |     130000 |       |
      | MAUsr1 |   13012024 |     180000 |       |
      | MAUsr2 |   03012024 |     090000 |       |
      | MAUsr2 |   03012024 |     130000 |       |
      | MAUsr2 |   03012024 |     140000 |       |
      | MAUsr2 |   03012024 |     175500 |     4 |
      | MAUsr2 |   04012024 |     091500 |       |
      | MAUsr2 |   04012024 |     121500 |       |
      | MAUsr2 |   04012024 |     131500 |       |
      | MAUsr2 |   04012024 |     180000 |       |
      | MAUsr2 |   05012024 |     092000 |     3 |
      | MAUsr2 |   05012024 |     132000 |       |
      | MAUsr2 |   05012024 |     142000 |       |
      | MAUsr2 |   05012024 |     182000 |       |
      | MAUsr2 |   06012024 |     094000 |     3 |
      | MAUsr2 |   06012024 |     130000 |       |
      | MAUsr2 |   06012024 |     140000 |       |
      | MAUsr2 |   06012024 |     184000 |       |
      | MAUsr2 |   08012024 |     094500 |     3 |
      | MAUsr2 |   08012024 |     130000 |       |
      | MAUsr2 |   08012024 |     140000 |       |
      | MAUsr2 |   08012024 |     190000 |       |
      | MAUsr2 |   09012024 |     090000 |       |
      | MAUsr2 |   09012024 |     130000 |       |
      | MAUsr2 |   09012024 |     140000 |       |
      | MAUsr2 |   09012024 |     190000 |       |
      | MAUsr2 |   10012024 |     090000 |       |
      | MAUsr2 |   10012024 |     130000 |       |
      | MAUsr2 |   10012024 |     140000 |       |
      | MAUsr2 |   10012024 |     180000 |       |
      | MAUsr2 |   12012024 |     090000 |       |
      | MAUsr2 |   12012024 |     110000 |       |
      | MAUsr2 |   12012024 |     120000 |       |
      | MAUsr2 |   12012024 |     130000 |       |
      | MAUsr2 |   13012024 |     130000 |       |
      | MAUsr2 |   13012024 |     140000 |       |
      | MAUsr2 |   13012024 |     150000 |       |
      | MAUsr2 |   13012024 |     180000 |       |
      | MAUsr3 |   03012024 |     090000 |       |
      | MAUsr3 |   03012024 |     130000 |       |
      | MAUsr3 |   03012024 |     133000 |       |
      | MAUsr3 |   03012024 |     140000 |       |
      | MAUsr3 |   03012024 |     143000 |       |
      | MAUsr3 |   03012024 |     175500 |     4 |
      | MAUsr3 |   04012024 |     091500 |       |
      | MAUsr3 |   04012024 |     130000 |       |
      | MAUsr3 |   04012024 |     133000 |       |
      | MAUsr3 |   04012024 |     140000 |       |
      | MAUsr3 |   04012024 |     143000 |       |
      | MAUsr3 |   04012024 |     180000 |       |
      | MAUsr3 |   05012024 |     092000 |     3 |
      | MAUsr3 |   05012024 |     130000 |       |
      | MAUsr3 |   05012024 |     133000 |       |
      | MAUsr3 |   05012024 |     140000 |       |
      | MAUsr3 |   05012024 |     143000 |       |
      | MAUsr3 |   05012024 |     182000 |       |
      | MAUsr3 |   06012024 |     094000 |     3 |
      | MAUsr3 |   06012024 |     130000 |       |
      | MAUsr3 |   06012024 |     133000 |       |
      | MAUsr3 |   06012024 |     140000 |       |
      | MAUsr3 |   06012024 |     143000 |       |
      | MAUsr3 |   06012024 |     184000 |       |
      | MAUsr3 |   08012024 |     094500 |     3 |
      | MAUsr3 |   08012024 |     130000 |       |
      | MAUsr3 |   08012024 |     133000 |       |
      | MAUsr3 |   08012024 |     140000 |       |
      | MAUsr3 |   08012024 |     143000 |       |
      | MAUsr3 |   08012024 |     190000 |       |
      | MAUsr3 |   09012024 |     090000 |       |
      | MAUsr3 |   09012024 |     130000 |       |
      | MAUsr3 |   09012024 |     133000 |       |
      | MAUsr3 |   09012024 |     140000 |       |
      | MAUsr3 |   09012024 |     143000 |       |
      | MAUsr3 |   09012024 |     190000 |       |
      | MAUsr3 |   10012024 |     090000 |       |
      | MAUsr3 |   10012024 |     130000 |       |
      | MAUsr3 |   10012024 |     133000 |       |
      | MAUsr3 |   10012024 |     140000 |       |
      | MAUsr3 |   10012024 |     143000 |       |
      | MAUsr3 |   10012024 |     180000 |       |
      | MAUsr3 |   12012024 |     090000 |       |
      | MAUsr3 |   12012024 |     103000 |       |
      | MAUsr3 |   12012024 |     110000 |       |
      | MAUsr3 |   12012024 |     113000 |       |
      | MAUsr3 |   12012024 |     120000 |       |
      | MAUsr3 |   12012024 |     130000 |       |
      | MAUsr3 |   13012024 |     130000 |       |
      | MAUsr3 |   13012024 |     140000 |       |
      | MAUsr3 |   13012024 |     143000 |       |
      | MAUsr3 |   13012024 |     150000 |       |
      | MAUsr3 |   13012024 |     153000 |       |
      | MAUsr3 |   13012024 |     180000 |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
      | MAUsr3 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  1 | 11/01/2024 | 11/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  4 | 12/01/2024 | 12/01/2024 | FD         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  4 | 13/01/2024 | 13/01/2024 | FE         |                     1 | 13/01/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  1 | 15/01/2024 | 20/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/01/2024 | 25/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/01/2024 | 27/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  1 | 11/01/2024 | 11/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  4 | 12/01/2024 | 12/01/2024 | FD         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  4 | 13/01/2024 | 13/01/2024 | FE         |                     1 | 13/01/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  1 | 15/01/2024 | 20/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 22/01/2024 | 25/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/01/2024 | 27/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr3 |                  1 | 11/01/2024 | 11/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr3    |
      | MAUsr3 |                  4 | 12/01/2024 | 12/01/2024 | FD         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr3    |
      | MAUsr3 |                  4 | 13/01/2024 | 13/01/2024 | FE         |                     1 | 13/01/2024      | 09:00             | 13:00           | MAUsr3    |
      | MAUsr3 |                  1 | 15/01/2024 | 20/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr3    |
      | MAUsr3 |                  1 | 22/01/2024 | 25/01/2024 | FF         |                     1 |                 |                   |                 | MAUsr3    |
      | MAUsr3 |                  1 | 27/01/2024 | 27/01/2024 | FC         |                     1 |                 |                   |                 | MAUsr3    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 15/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/01/2024 | 27/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 15/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 22/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/01/2024 | 27/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 13/01/2024 | 13/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 15/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 22/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr3 | 27/01/2024 | 27/01/2024 |
    Then Daily Attendance View for userid "MAUsr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/01/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/01/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/01/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:00      |            | 07:55    | 01:00       |                    |                     | SHORT LEAVE          |
      | 04/01/2024 | AY-Normal | 09:15    | 18:00    | PR       | AB       | 00:05   |           | 07:45      |            | 07:45    | 01:00       |                    |                     | AB:Less Work Hrs     |
      | 05/01/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:20      | 00:20      | 08:00    | 01:00       | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/01/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 08:40      | 00:40      | 08:00    | 01:00       | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 08/01/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 08:15    | 01:00       | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/01/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 09:00    | 01:00       | 01:00              | 01:00               |                      |
      | 10/01/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 08:00    | 01:00       |                    |                     |                      |
      | 11/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 12/01/2024 | AY-Normal | 09:00    | 13:00    | PR       | PR       |         |           | 09:00      |            | 04:00    |             |                    |                     |                      |
      | 13/01/2024 | AY-Normal | 13:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 04:00    | 01:00       |                    |                     |                      |
      | 14/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 15/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 16/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 17/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 18/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 19/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 20/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 21/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 22/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 23/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 24/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 25/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 26/01/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 28/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 29/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "January" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/01/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/01/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/01/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:00      |            | 07:55    | 01:00       |                    |                     | SHORT LEAVE          |
      | 04/01/2024 | AY-Normal | 09:15    | 18:00    | PR       | AB       | 00:05   |           | 07:45      |            | 07:45    | 01:00       |                    |                     | AB:Less Work Hrs     |
      | 05/01/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:20      | 00:20      | 08:00    | 01:00       | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/01/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 08:40      | 00:40      | 08:00    | 01:00       | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 08/01/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 08:15    | 01:00       | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/01/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 09:00    | 01:00       | 01:00              | 01:00               |                      |
      | 10/01/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 08:00    | 01:00       |                    |                     |                      |
      | 11/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 12/01/2024 | AY-Normal | 09:00    | 13:00    | PR       | PR       |         |           | 08:00      |            | 03:00    | 01:00       |                    |                     |                      |
      | 13/01/2024 | AY-Normal | 13:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 04:00    | 01:00       |                    |                     |                      |
      | 14/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 15/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 16/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 17/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 18/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 19/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 20/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 21/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 22/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 23/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 24/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 25/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 26/01/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 28/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 29/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
    And Daily Attendance View for userid "MAUsr3" and period "Month" on "January" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/01/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/01/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/01/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:00      |            | 07:55    |             |                    |                     | SHORT LEAVE          |
      | 04/01/2024 | AY-Normal | 09:15    | 18:00    | PR       | AB       | 00:05   |           | 07:45      |            | 07:45    |             |                    |                     | AB:Less Work Hrs     |
      | 05/01/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:20      | 00:20      | 08:00    |             | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/01/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 08:40      | 00:40      | 08:00    |             | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 08/01/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 08:15    |             | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/01/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 09:00    |             | 01:00              | 01:00               |                      |
      | 10/01/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 08:00    |             |                    |                     |                      |
      | 11/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 12/01/2024 | AY-Normal | 09:00    | 13:00    | PR       | PR       |         |           | 08:00      |            | 03:00    |             |                    |                     |                      |
      | 13/01/2024 | AY-Normal | 13:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 04:00    |             |                    |                     |                      |
      | 14/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 15/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 16/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 17/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 18/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 19/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 20/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 21/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 22/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 23/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 24/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 25/01/2024 | AY-Normal |          |          | FF       | FF       |         |           |            |            |          |             |                    |                     |                      |
      | 26/01/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/01/2024 | AY-Normal |          |          | FC       | FC       |         |           |            |            |          |             |                    |                     |                      |
      | 28/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 29/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
    And Validate Attendance Summary from Manage Attendance page for "Single User"
      | FromDate   | ToDate     | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      | 01/01/2024 | 31/01/2024 | MAUsr1 |     8.5 |    3.5 |     2 |   10 |        4 |       1 |           1 |        1 | 75:45      | 03:00      | 64:55          | 08:00       | 03:00               | 03:00              | 05:00             | 04:00               |
      | 01/01/2024 | 31/01/2024 | MAUsr2 |     8.5 |    3.5 |     2 |   10 |        4 |       1 |           1 |        1 | 74:45      | 03:00      | 63:55          | 09:00       | 03:00               | 03:00              | 05:00             | 04:00               |
      | 01/01/2024 | 31/01/2024 | MAUsr3 |     8.5 |    3.5 |     2 |   10 |        4 |       1 |           1 |        1 | 83:45      | 03:00      | 63:55          | 00:00       | 03:00               | 03:00              | 05:00             | 04:00               |

  @MACase2
  Scenario: Manage Attendance -> Validate Attendance Summary for multiple user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |                2 |              1 | true            | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/01/2024 | 26/01/2024 | RepublicDay | False        |
      | 29/01/2024 | 29/01/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                        2 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp2   | True      |                        4 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03012024 |     090000 |       |
      | MAUsr1 |   03012024 |     175500 |     4 |
      | MAUsr1 |   04012024 |     094500 |       |
      | MAUsr1 |   04012024 |     180000 |       |
      | MAUsr1 |   05012024 |     092000 |     3 |
      | MAUsr1 |   05012024 |     182000 |       |
      | MAUsr1 |   06012024 |     094000 |     3 |
      | MAUsr1 |   06012024 |     184000 |       |
      | MAUsr1 |   08012024 |     091500 |       |
      | MAUsr1 |   08012024 |     180000 |       |
      | MAUsr1 |   09012024 |     090000 |       |
      | MAUsr1 |   09012024 |     190000 |       |
      | MAUsr1 |   10012024 |     090000 |       |
      | MAUsr1 |   10012024 |     170000 |       |
      | MAUsr1 |   11012024 |     130000 |       |
      | MAUsr1 |   11012024 |     180000 |       |
      | MAUsr1 |   12012024 |     090000 |       |
      | MAUsr1 |   12012024 |     130000 |       |
      | MAUsr1 |   16012024 |     090000 |       |
      | MAUsr1 |   31012024 |     090000 |       |
      | MAUsr1 |   31012024 |     180000 |       |
      | MAUsr2 |   03012024 |     090000 |       |
      | MAUsr2 |   03012024 |     130000 |       |
      | MAUsr2 |   03012024 |     140000 |       |
      | MAUsr2 |   03012024 |     175500 |     4 |
      | MAUsr2 |   04012024 |     094500 |       |
      | MAUsr2 |   04012024 |     121500 |       |
      | MAUsr2 |   04012024 |     131500 |       |
      | MAUsr2 |   04012024 |     180000 |       |
      | MAUsr2 |   05012024 |     092000 |     3 |
      | MAUsr2 |   05012024 |     132000 |       |
      | MAUsr2 |   05012024 |     142000 |       |
      | MAUsr2 |   05012024 |     182000 |       |
      | MAUsr2 |   06012024 |     094000 |     3 |
      | MAUsr2 |   06012024 |     130000 |       |
      | MAUsr2 |   06012024 |     140000 |       |
      | MAUsr2 |   06012024 |     184000 |       |
      | MAUsr2 |   08012024 |     091500 |       |
      | MAUsr2 |   08012024 |     130000 |       |
      | MAUsr2 |   08012024 |     140000 |       |
      | MAUsr2 |   08012024 |     180000 |       |
      | MAUsr2 |   09012024 |     090000 |       |
      | MAUsr2 |   09012024 |     130000 |       |
      | MAUsr2 |   09012024 |     140000 |       |
      | MAUsr2 |   09012024 |     190000 |       |
      | MAUsr2 |   10012024 |     090000 |       |
      | MAUsr2 |   10012024 |     130000 |       |
      | MAUsr2 |   10012024 |     140000 |       |
      | MAUsr2 |   10012024 |     170000 |       |
      | MAUsr2 |   11012024 |     130000 |       |
      | MAUsr2 |   11012024 |     140000 |       |
      | MAUsr2 |   11012024 |     150000 |       |
      | MAUsr2 |   11012024 |     180000 |       |
      | MAUsr2 |   12012024 |     090000 |       |
      | MAUsr2 |   12012024 |     110000 |       |
      | MAUsr2 |   12012024 |     120000 |       |
      | MAUsr2 |   12012024 |     130000 |       |
      | MAUsr2 |   16012024 |     090000 |       |
      | MAUsr2 |   31012024 |     090000 |       |
      | MAUsr2 |   31012024 |     130000 |       |
      | MAUsr2 |   31012024 |     140000 |       |
      | MAUsr2 |   31012024 |     180000 |       |
    And Daily Attendance Authorization from SA Date from= "01/01/2024" To= "31/01/2024"
      | UserID | Date       | Authorize |
      | MAUsr1 | 03/01/2024 | true      |
      | MAUsr1 | 04/01/2024 | true      |
      | MAUsr1 | 05/01/2024 | true      |
      | MAUsr1 | 06/01/2024 | true      |
      | MAUsr1 | 08/01/2024 | true      |
      | MAUsr1 | 09/01/2024 | true      |
      | MAUsr1 | 10/01/2024 | true      |
      | MAUsr1 | 11/01/2024 | true      |
      | MAUsr1 | 12/01/2024 | true      |
      | MAUsr1 | 16/01/2024 | true      |
      | MAUsr2 | 03/01/2024 | true      |
      | MAUsr2 | 04/01/2024 | true      |
      | MAUsr2 | 05/01/2024 | true      |
      | MAUsr2 | 06/01/2024 | true      |
      | MAUsr2 | 08/01/2024 | true      |
      | MAUsr2 | 09/01/2024 | true      |
      | MAUsr2 | 10/01/2024 | true      |
      | MAUsr2 | 11/01/2024 | true      |
      | MAUsr2 | 12/01/2024 | true      |
      | MAUsr2 | 16/01/2024 | true      |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | January | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | January | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | January | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | January | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 11/01/2024 | 11/01/2024 | FI         |                     1 | 11/01/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 12/01/2024 | 12/01/2024 | FH         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/01/2024 | 19/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/01/2024 | 20/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/01/2024 | 22/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 23/01/2024 | 24/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/01/2024 | 25/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/01/2024 | 27/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  4 | 11/01/2024 | 11/01/2024 | FI         |                     1 | 11/01/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  4 | 12/01/2024 | 12/01/2024 | FH         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  1 | 17/01/2024 | 19/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 20/01/2024 | 20/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 22/01/2024 | 22/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 23/01/2024 | 24/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 25/01/2024 | 25/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/01/2024 | 27/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/01/2024 | 19/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/01/2024 | 22/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 23/01/2024 | 24/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/01/2024 | 27/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 17/01/2024 | 19/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 22/01/2024 | 22/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 23/01/2024 | 24/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 25/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/01/2024 | 27/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Daily Attendance View for userid "MAUsr1" and period "Month" on "January" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                  |
      | 01/01/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                         |
      | 02/01/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                         |
      | 03/01/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:00      |            | 07:55    | 01:00       |                    |                     | SHORT LEAVE             |
      | 04/01/2024 | AY-Normal | 09:45    | 18:00    | AB       | PR       |         |           | 07:15      |            | 07:15    | 01:00       |                    |                     | AB:Late-IN              |
      | 05/01/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:20      | 00:20      | 08:00    | 01:00       | 00:20              | 00:20               | SHORT LEAVE             |
      | 06/01/2024 | AY-Normal | 09:40    | 18:40    | AB       | PR       |         |           | 08:00      | 00:40      | 08:00    | 01:00       | 00:40              | 00:40               | SHORT LEAVE             |
      | 07/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                         |
      | 08/01/2024 | AY-Normal | 09:15    | 18:00    | PR       | AB       | 00:05   |           | 07:45      |            | 07:45    | 01:00       |                    |                     | AB:Less Work Hrs        |
      | 09/01/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 09:00    | 01:00       | 01:00              | 01:00               |                         |
      | 10/01/2024 | AY-Normal | 09:00    | 17:00    | PR       | AB       |         |           | 07:00      |            | 07:00    | 01:00       |                    |                     | AB:Early-OUT            |
      | 11/01/2024 | AY-Normal | 13:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 04:00    | 01:00       |                    |                     |                         |
      | 12/01/2024 | AY-Normal | 09:00    | 13:00    | PR       | PR       |         |           | 09:00      |            | 04:00    |             |                    |                     |                         |
      | 13/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 14/01/2024 | AY-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Cover Rule |
      | 15/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 16/01/2024 | AY-Normal | 09:00    |          | IN       | AB       |         |           |            |            |          |             |                    |                     | Punches Not In Pair     |
      | 17/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 18/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 19/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 20/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 21/01/2024 | AY-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Leave Cover Rule  |
      | 22/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 23/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 24/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 25/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 26/01/2024 | AY-PH     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | PH-AB:Leave Cover Rule  |
      | 27/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 28/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                         |
      | 29/01/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                         |
      | 30/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 31/01/2024 | AY-Normal | 09:00    | 18:00    | AB       | AB       |         |           | 08:00      |            | 08:00    | 01:00       |                    |                     | AB:Unauthorized         |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "January" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark                  |
      | 01/01/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                         |
      | 02/01/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                         |
      | 03/01/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:00      |            | 07:55    | 01:00       |                    |                     | SHORT LEAVE             |
      | 04/01/2024 | AY-Normal | 09:45    | 18:00    | AB       | PR       |         |           | 07:15      |            | 07:15    | 01:00       |                    |                     | AB:Late-IN              |
      | 05/01/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:20      | 00:20      | 08:00    | 01:00       | 00:20              | 00:20               | SHORT LEAVE             |
      | 06/01/2024 | AY-Normal | 09:40    | 18:40    | AB       | PR       |         |           | 08:00      | 00:40      | 08:00    | 01:00       | 00:40              | 00:40               | SHORT LEAVE             |
      | 07/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                         |
      | 08/01/2024 | AY-Normal | 09:15    | 18:00    | PR       | AB       | 00:05   |           | 07:45      |            | 07:45    | 01:00       |                    |                     | AB:Less Work Hrs        |
      | 09/01/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:00      | 01:00      | 09:00    | 01:00       | 01:00              | 01:00               |                         |
      | 10/01/2024 | AY-Normal | 09:00    | 17:00    | PR       | AB       |         |           | 07:00      |            | 07:00    | 01:00       |                    |                     | AB:Early-OUT            |
      | 11/01/2024 | AY-Normal | 13:00    | 18:00    | PR       | PR       |         |           | 08:00      |            | 04:00    | 01:00       |                    |                     |                         |
      | 12/01/2024 | AY-Normal | 09:00    | 13:00    | PR       | PR       |         |           | 08:00      |            | 03:00    | 01:00       |                    |                     |                         |
      | 13/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 14/01/2024 | AY-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Absent Cover Rule |
      | 15/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 16/01/2024 | AY-Normal | 09:00    |          | IN       | AB       |         |           |            |            |          |             |                    |                     | Punches Not In Pair     |
      | 17/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 18/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 19/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 20/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 21/01/2024 | AY-WO     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | WO-AB:Leave Cover Rule  |
      | 22/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 23/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 24/01/2024 | AY-Normal |          |          | FJ       | FJ       |         |           |            |            |          |             |                    |                     |                         |
      | 25/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 26/01/2024 | AY-PH     |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | PH-AB:Leave Cover Rule  |
      | 27/01/2024 | AY-Normal |          |          | FG       | FG       |         |           |            |            |          |             |                    |                     |                         |
      | 28/01/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                         |
      | 29/01/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                         |
      | 30/01/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available    |
      | 31/01/2024 | AY-Normal | 09:00    | 18:00    | AB       | AB       |         |           | 08:00      |            | 08:00    | 01:00       |                    |                     | AB:Unauthorized         |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/01/2024 | 31/01/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    Then Validate Attendance Exceptions from Manage Attendance page for multiple users
      | Present | No Punches Available | Punches Not In Pair | Less Work Hours | Unauthorized | Late-IN | Early-OUT | Absent Club/Cover Rule | Leave Club/Cover Rule | Short Leave Balance | Target Shortfall | Less Grace Count | Work Hours Limit |
      |      10 |                   24 |                   2 |               2 |            2 |       2 |         2 |                      2 |                     4 |                   2 |                0 |                0 |                0 |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/01/2024 | 31/01/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    Then Validate Attendance Summary from Manage Attendance page for "Multiple User"
      | FromDate | ToDate | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      |          |        | MAUsr1 |       7 |    9.5 |     4 |    5 |        2 |       1 |           1 |        1 | 80:20      | 02:00      | 70:55          | 09:00       | 02:00               | 02:00              | 05:00             | 04:00               |
      |          |        | MAUsr2 |       7 |    9.5 |     4 |    5 |        2 |       1 |           1 |        1 | 79:20      | 02:00      | 69:55          | 10:00       | 02:00               | 02:00              | 05:00             | 04:00               |

  @MACase3
  Scenario: Export Manage Attendance data for Single User -> Export Special Function Marking= true, File Format= Excel, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |                2 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/01/2024 | 26/01/2024 | RepublicDay | False        |
      | 29/01/2024 | 29/01/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03012024 |     090000 |       |
      | MAUsr1 |   03012024 |     100000 |       |
      | MAUsr1 |   03012024 |     101000 |       |
      | MAUsr1 |   03012024 |     110000 |       |
      | MAUsr1 |   03012024 |     110500 |       |
      | MAUsr1 |   03012024 |     123000 |       |
      | MAUsr1 |   03012024 |     123500 |       |
      | MAUsr1 |   03012024 |     130000 |       |
      | MAUsr1 |   03012024 |     131000 |       |
      | MAUsr1 |   03012024 |     140000 |       |
      | MAUsr1 |   03012024 |     141000 |       |
      | MAUsr1 |   03012024 |     175500 |     4 |
      | MAUsr1 |   04012024 |     091500 |       |
      | MAUsr1 |   04012024 |     100000 |       |
      | MAUsr1 |   04012024 |     101000 |       |
      | MAUsr1 |   04012024 |     110000 |       |
      | MAUsr1 |   04012024 |     110500 |       |
      | MAUsr1 |   04012024 |     123000 |       |
      | MAUsr1 |   04012024 |     123500 |       |
      | MAUsr1 |   04012024 |     130000 |       |
      | MAUsr1 |   04012024 |     131000 |       |
      | MAUsr1 |   04012024 |     140000 |       |
      | MAUsr1 |   04012024 |     141000 |       |
      | MAUsr1 |   04012024 |     180000 |       |
      | MAUsr1 |   05012024 |     092000 |     3 |
      | MAUsr1 |   05012024 |     100000 |       |
      | MAUsr1 |   05012024 |     101000 |       |
      | MAUsr1 |   05012024 |     110000 |       |
      | MAUsr1 |   05012024 |     110500 |       |
      | MAUsr1 |   05012024 |     123000 |       |
      | MAUsr1 |   05012024 |     123500 |       |
      | MAUsr1 |   05012024 |     130000 |       |
      | MAUsr1 |   05012024 |     131000 |       |
      | MAUsr1 |   05012024 |     140000 |       |
      | MAUsr1 |   05012024 |     141000 |       |
      | MAUsr1 |   05012024 |     182000 |       |
      | MAUsr1 |   06012024 |     094000 |     3 |
      | MAUsr1 |   06012024 |     100000 |       |
      | MAUsr1 |   06012024 |     101000 |       |
      | MAUsr1 |   06012024 |     110000 |       |
      | MAUsr1 |   06012024 |     110500 |       |
      | MAUsr1 |   06012024 |     123000 |       |
      | MAUsr1 |   06012024 |     123500 |       |
      | MAUsr1 |   06012024 |     130000 |       |
      | MAUsr1 |   06012024 |     131000 |       |
      | MAUsr1 |   06012024 |     140000 |       |
      | MAUsr1 |   06012024 |     141000 |       |
      | MAUsr1 |   06012024 |     184000 |       |
      | MAUsr1 |   08012024 |     091500 |     3 |
      | MAUsr1 |   08012024 |     100000 |       |
      | MAUsr1 |   08012024 |     101000 |       |
      | MAUsr1 |   08012024 |     110000 |       |
      | MAUsr1 |   08012024 |     110500 |       |
      | MAUsr1 |   08012024 |     123000 |       |
      | MAUsr1 |   08012024 |     123500 |       |
      | MAUsr1 |   08012024 |     130000 |       |
      | MAUsr1 |   08012024 |     131000 |       |
      | MAUsr1 |   08012024 |     140000 |       |
      | MAUsr1 |   08012024 |     141000 |       |
      | MAUsr1 |   08012024 |     180000 |       |
      | MAUsr1 |   09012024 |     090000 |       |
      | MAUsr1 |   09012024 |     100000 |       |
      | MAUsr1 |   09012024 |     101000 |       |
      | MAUsr1 |   09012024 |     110000 |       |
      | MAUsr1 |   09012024 |     110500 |       |
      | MAUsr1 |   09012024 |     123000 |       |
      | MAUsr1 |   09012024 |     123500 |       |
      | MAUsr1 |   09012024 |     130000 |       |
      | MAUsr1 |   09012024 |     131000 |       |
      | MAUsr1 |   09012024 |     140000 |       |
      | MAUsr1 |   09012024 |     141000 |       |
      | MAUsr1 |   09012024 |     190000 |       |
      | MAUsr1 |   10012024 |     090000 |       |
      | MAUsr1 |   10012024 |     100000 |       |
      | MAUsr1 |   10012024 |     101000 |       |
      | MAUsr1 |   10012024 |     110000 |       |
      | MAUsr1 |   10012024 |     110500 |       |
      | MAUsr1 |   10012024 |     123000 |       |
      | MAUsr1 |   10012024 |     123500 |       |
      | MAUsr1 |   10012024 |     130000 |       |
      | MAUsr1 |   10012024 |     131000 |       |
      | MAUsr1 |   10012024 |     140000 |       |
      | MAUsr1 |   10012024 |     141000 |       |
      | MAUsr1 |   10012024 |     180000 |       |
      | MAUsr1 |   11012024 |     130000 |       |
      | MAUsr1 |   11012024 |     133000 |       |
      | MAUsr1 |   11012024 |     133500 |       |
      | MAUsr1 |   11012024 |     140000 |       |
      | MAUsr1 |   11012024 |     141000 |       |
      | MAUsr1 |   11012024 |     143000 |       |
      | MAUsr1 |   11012024 |     143500 |       |
      | MAUsr1 |   11012024 |     150000 |       |
      | MAUsr1 |   11012024 |     150500 |       |
      | MAUsr1 |   11012024 |     153000 |       |
      | MAUsr1 |   11012024 |     153500 |       |
      | MAUsr1 |   11012024 |     180000 |       |
      | MAUsr1 |   12012024 |     090000 |       |
      | MAUsr1 |   12012024 |     093000 |       |
      | MAUsr1 |   12012024 |     093500 |       |
      | MAUsr1 |   12012024 |     095000 |       |
      | MAUsr1 |   12012024 |     095500 |       |
      | MAUsr1 |   12012024 |     100000 |       |
      | MAUsr1 |   12012024 |     101000 |       |
      | MAUsr1 |   12012024 |     110000 |       |
      | MAUsr1 |   12012024 |     110500 |       |
      | MAUsr1 |   12012024 |     123000 |       |
      | MAUsr1 |   12012024 |     123500 |       |
      | MAUsr1 |   12012024 |     130000 |       |
      | MAUsr1 |   16012024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | January | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | January | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 11/01/2024 | 11/01/2024 | FI         |                     1 | 11/01/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 12/01/2024 | 12/01/2024 | FH         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/01/2024 | 19/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/01/2024 | 20/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/01/2024 | 22/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 23/01/2024 | 24/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/01/2024 | 25/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/01/2024 | 27/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/01/2024 | 19/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/01/2024 | 22/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 23/01/2024 | 24/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/01/2024 | 27/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    When Export Manage Attendance Data from Manage Attendance Page for "Single User"
      | FromDate   | ToDate     | UserID | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | 01/01/2024 | 31/01/2024 | MAUsr1 | Excel      |                   12 | true             |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01012024_to_31012024 | XLS        | Compared |

  @MACase4
  Scenario: Export Manage Attendance data for Single User -> Export Special Function Marking= true, File Format= CSV, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/01/2024 | 26/01/2024 | RepublicDay | False        |
      | 29/01/2024 | 29/01/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03012024 |     090000 |       |
      | MAUsr1 |   03012024 |     100000 |       |
      | MAUsr1 |   03012024 |     101000 |       |
      | MAUsr1 |   03012024 |     110000 |       |
      | MAUsr1 |   03012024 |     110500 |       |
      | MAUsr1 |   03012024 |     123000 |       |
      | MAUsr1 |   03012024 |     123500 |       |
      | MAUsr1 |   03012024 |     130000 |       |
      | MAUsr1 |   03012024 |     131000 |       |
      | MAUsr1 |   03012024 |     140000 |       |
      | MAUsr1 |   03012024 |     141000 |       |
      | MAUsr1 |   03012024 |     175500 |     4 |
      | MAUsr1 |   04012024 |     091500 |       |
      | MAUsr1 |   04012024 |     100000 |       |
      | MAUsr1 |   04012024 |     101000 |       |
      | MAUsr1 |   04012024 |     110000 |       |
      | MAUsr1 |   04012024 |     110500 |       |
      | MAUsr1 |   04012024 |     123000 |       |
      | MAUsr1 |   04012024 |     123500 |       |
      | MAUsr1 |   04012024 |     130000 |       |
      | MAUsr1 |   04012024 |     131000 |       |
      | MAUsr1 |   04012024 |     140000 |       |
      | MAUsr1 |   04012024 |     141000 |       |
      | MAUsr1 |   04012024 |     180000 |       |
      | MAUsr1 |   05012024 |     092000 |     3 |
      | MAUsr1 |   05012024 |     100000 |       |
      | MAUsr1 |   05012024 |     101000 |       |
      | MAUsr1 |   05012024 |     110000 |       |
      | MAUsr1 |   05012024 |     110500 |       |
      | MAUsr1 |   05012024 |     123000 |       |
      | MAUsr1 |   05012024 |     123500 |       |
      | MAUsr1 |   05012024 |     130000 |       |
      | MAUsr1 |   05012024 |     131000 |       |
      | MAUsr1 |   05012024 |     140000 |       |
      | MAUsr1 |   05012024 |     141000 |       |
      | MAUsr1 |   05012024 |     182000 |       |
      | MAUsr1 |   06012024 |     094000 |     3 |
      | MAUsr1 |   06012024 |     100000 |       |
      | MAUsr1 |   06012024 |     101000 |       |
      | MAUsr1 |   06012024 |     110000 |       |
      | MAUsr1 |   06012024 |     110500 |       |
      | MAUsr1 |   06012024 |     123000 |       |
      | MAUsr1 |   06012024 |     123500 |       |
      | MAUsr1 |   06012024 |     130000 |       |
      | MAUsr1 |   06012024 |     131000 |       |
      | MAUsr1 |   06012024 |     140000 |       |
      | MAUsr1 |   06012024 |     141000 |       |
      | MAUsr1 |   06012024 |     184000 |       |
      | MAUsr1 |   08012024 |     091500 |     3 |
      | MAUsr1 |   08012024 |     100000 |       |
      | MAUsr1 |   08012024 |     101000 |       |
      | MAUsr1 |   08012024 |     110000 |       |
      | MAUsr1 |   08012024 |     110500 |       |
      | MAUsr1 |   08012024 |     123000 |       |
      | MAUsr1 |   08012024 |     123500 |       |
      | MAUsr1 |   08012024 |     130000 |       |
      | MAUsr1 |   08012024 |     131000 |       |
      | MAUsr1 |   08012024 |     140000 |       |
      | MAUsr1 |   08012024 |     141000 |       |
      | MAUsr1 |   08012024 |     180000 |       |
      | MAUsr1 |   09012024 |     090000 |       |
      | MAUsr1 |   09012024 |     100000 |       |
      | MAUsr1 |   09012024 |     101000 |       |
      | MAUsr1 |   09012024 |     110000 |       |
      | MAUsr1 |   09012024 |     110500 |       |
      | MAUsr1 |   09012024 |     123000 |       |
      | MAUsr1 |   09012024 |     123500 |       |
      | MAUsr1 |   09012024 |     130000 |       |
      | MAUsr1 |   09012024 |     131000 |       |
      | MAUsr1 |   09012024 |     140000 |       |
      | MAUsr1 |   09012024 |     141000 |       |
      | MAUsr1 |   09012024 |     190000 |       |
      | MAUsr1 |   10012024 |     090000 |       |
      | MAUsr1 |   10012024 |     100000 |       |
      | MAUsr1 |   10012024 |     101000 |       |
      | MAUsr1 |   10012024 |     110000 |       |
      | MAUsr1 |   10012024 |     110500 |       |
      | MAUsr1 |   10012024 |     123000 |       |
      | MAUsr1 |   10012024 |     123500 |       |
      | MAUsr1 |   10012024 |     130000 |       |
      | MAUsr1 |   10012024 |     131000 |       |
      | MAUsr1 |   10012024 |     140000 |       |
      | MAUsr1 |   10012024 |     141000 |       |
      | MAUsr1 |   10012024 |     180000 |       |
      | MAUsr1 |   11012024 |     130000 |       |
      | MAUsr1 |   11012024 |     133000 |       |
      | MAUsr1 |   11012024 |     133500 |       |
      | MAUsr1 |   11012024 |     140000 |       |
      | MAUsr1 |   11012024 |     141000 |       |
      | MAUsr1 |   11012024 |     143000 |       |
      | MAUsr1 |   11012024 |     143500 |       |
      | MAUsr1 |   11012024 |     150000 |       |
      | MAUsr1 |   11012024 |     150500 |       |
      | MAUsr1 |   11012024 |     153000 |       |
      | MAUsr1 |   11012024 |     153500 |       |
      | MAUsr1 |   11012024 |     180000 |       |
      | MAUsr1 |   12012024 |     090000 |       |
      | MAUsr1 |   12012024 |     093000 |       |
      | MAUsr1 |   12012024 |     093500 |       |
      | MAUsr1 |   12012024 |     095000 |       |
      | MAUsr1 |   12012024 |     095500 |       |
      | MAUsr1 |   12012024 |     100000 |       |
      | MAUsr1 |   12012024 |     101000 |       |
      | MAUsr1 |   12012024 |     110000 |       |
      | MAUsr1 |   12012024 |     110500 |       |
      | MAUsr1 |   12012024 |     123000 |       |
      | MAUsr1 |   12012024 |     123500 |       |
      | MAUsr1 |   12012024 |     130000 |       |
      | MAUsr1 |   16012024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month   | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | January | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | January | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 11/01/2024 | 11/01/2024 | FI         |                     1 | 11/01/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 12/01/2024 | 12/01/2024 | FH         |                     1 | 12/01/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/01/2024 | 19/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/01/2024 | 20/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/01/2024 | 22/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 23/01/2024 | 24/01/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/01/2024 | 25/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/01/2024 | 27/01/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/01/2024 | 11/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/01/2024 | 12/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/01/2024 | 19/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/01/2024 | 20/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/01/2024 | 22/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 23/01/2024 | 24/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/01/2024 | 25/01/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/01/2024 | 27/01/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID |
      | MAUsr1 |
    When Export Manage Attendance Data from Manage Attendance Page for "Single User"
      | FromDate   | ToDate     | UserID | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | 01/01/2024 | 31/01/2024 | MAUsr1 | CSV        |                   12 | true             |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01012024_to_31012024 | CSV        | Compared |

  @MACase5
  Scenario: Export Manage Attendance data for Multiple User -> Export Special Function Marking= true, File Format= Excel, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/02/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/02/2024 | 24/02/2024 | AutoTest1   | False        |
      | 28/02/2024 | 28/02/2024 | AutoTest2   | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03022024 |     090000 |       |
      | MAUsr1 |   03022024 |     100000 |       |
      | MAUsr1 |   03022024 |     101000 |       |
      | MAUsr1 |   03022024 |     110000 |       |
      | MAUsr1 |   03022024 |     110500 |       |
      | MAUsr1 |   03022024 |     123000 |       |
      | MAUsr1 |   03022024 |     123500 |       |
      | MAUsr1 |   03022024 |     130000 |       |
      | MAUsr1 |   03022024 |     131000 |       |
      | MAUsr1 |   03022024 |     140000 |       |
      | MAUsr1 |   03022024 |     141000 |       |
      | MAUsr1 |   03022024 |     175500 |     4 |
      | MAUsr1 |   05022024 |     092000 |     3 |
      | MAUsr1 |   05022024 |     100000 |       |
      | MAUsr1 |   05022024 |     101000 |       |
      | MAUsr1 |   05022024 |     110000 |       |
      | MAUsr1 |   05022024 |     110500 |       |
      | MAUsr1 |   05022024 |     123000 |       |
      | MAUsr1 |   05022024 |     123500 |       |
      | MAUsr1 |   05022024 |     130000 |       |
      | MAUsr1 |   05022024 |     131000 |       |
      | MAUsr1 |   05022024 |     140000 |       |
      | MAUsr1 |   05022024 |     141000 |       |
      | MAUsr1 |   05022024 |     182000 |       |
      | MAUsr1 |   06022024 |     094000 |     3 |
      | MAUsr1 |   06022024 |     100000 |       |
      | MAUsr1 |   06022024 |     101000 |       |
      | MAUsr1 |   06022024 |     110000 |       |
      | MAUsr1 |   06022024 |     110500 |       |
      | MAUsr1 |   06022024 |     123000 |       |
      | MAUsr1 |   06022024 |     123500 |       |
      | MAUsr1 |   06022024 |     130000 |       |
      | MAUsr1 |   06022024 |     131000 |       |
      | MAUsr1 |   06022024 |     140000 |       |
      | MAUsr1 |   06022024 |     141000 |       |
      | MAUsr1 |   06022024 |     184000 |       |
      | MAUsr1 |   07022024 |     094500 |       |
      | MAUsr1 |   07022024 |     100000 |       |
      | MAUsr1 |   07022024 |     101000 |       |
      | MAUsr1 |   07022024 |     110000 |       |
      | MAUsr1 |   07022024 |     110500 |       |
      | MAUsr1 |   07022024 |     123000 |       |
      | MAUsr1 |   07022024 |     123500 |       |
      | MAUsr1 |   07022024 |     130000 |       |
      | MAUsr1 |   07022024 |     131000 |       |
      | MAUsr1 |   07022024 |     140000 |       |
      | MAUsr1 |   07022024 |     141000 |       |
      | MAUsr1 |   07022024 |     180000 |       |
      | MAUsr1 |   08022024 |     091500 |       |
      | MAUsr1 |   08022024 |     100000 |       |
      | MAUsr1 |   08022024 |     102000 |       |
      | MAUsr1 |   08022024 |     110000 |       |
      | MAUsr1 |   08022024 |     110500 |       |
      | MAUsr1 |   08022024 |     123000 |       |
      | MAUsr1 |   08022024 |     124500 |       |
      | MAUsr1 |   08022024 |     130000 |       |
      | MAUsr1 |   08022024 |     131000 |       |
      | MAUsr1 |   08022024 |     140000 |       |
      | MAUsr1 |   08022024 |     141000 |       |
      | MAUsr1 |   08022024 |     180000 |       |
      | MAUsr1 |   09022024 |     090000 |       |
      | MAUsr1 |   09022024 |     100000 |       |
      | MAUsr1 |   09022024 |     101000 |       |
      | MAUsr1 |   09022024 |     110000 |       |
      | MAUsr1 |   09022024 |     110500 |       |
      | MAUsr1 |   09022024 |     123000 |       |
      | MAUsr1 |   09022024 |     123500 |       |
      | MAUsr1 |   09022024 |     130000 |       |
      | MAUsr1 |   09022024 |     131000 |       |
      | MAUsr1 |   09022024 |     140000 |       |
      | MAUsr1 |   09022024 |     141000 |       |
      | MAUsr1 |   09022024 |     190000 |       |
      | MAUsr1 |   13022024 |     090000 |       |
      | MAUsr1 |   13022024 |     100000 |       |
      | MAUsr1 |   13022024 |     101000 |       |
      | MAUsr1 |   13022024 |     110000 |       |
      | MAUsr1 |   13022024 |     110500 |       |
      | MAUsr1 |   13022024 |     123000 |       |
      | MAUsr1 |   13022024 |     123500 |       |
      | MAUsr1 |   13022024 |     130000 |       |
      | MAUsr1 |   13022024 |     131000 |       |
      | MAUsr1 |   13022024 |     140000 |       |
      | MAUsr1 |   13022024 |     141000 |       |
      | MAUsr1 |   13022024 |     170000 |       |
      | MAUsr1 |   14022024 |     130000 |       |
      | MAUsr1 |   14022024 |     133000 |       |
      | MAUsr1 |   14022024 |     133500 |       |
      | MAUsr1 |   14022024 |     140000 |       |
      | MAUsr1 |   14022024 |     141000 |       |
      | MAUsr1 |   14022024 |     143000 |       |
      | MAUsr1 |   14022024 |     143500 |       |
      | MAUsr1 |   14022024 |     150000 |       |
      | MAUsr1 |   14022024 |     150500 |       |
      | MAUsr1 |   14022024 |     153000 |       |
      | MAUsr1 |   14022024 |     153500 |       |
      | MAUsr1 |   14022024 |     180000 |       |
      | MAUsr1 |   15022024 |     090000 |       |
      | MAUsr1 |   15022024 |     093000 |       |
      | MAUsr1 |   15022024 |     093500 |       |
      | MAUsr1 |   15022024 |     095000 |       |
      | MAUsr1 |   15022024 |     095500 |       |
      | MAUsr1 |   15022024 |     100000 |       |
      | MAUsr1 |   15022024 |     101000 |       |
      | MAUsr1 |   15022024 |     110000 |       |
      | MAUsr1 |   15022024 |     110500 |       |
      | MAUsr1 |   15022024 |     123000 |       |
      | MAUsr1 |   15022024 |     123500 |       |
      | MAUsr1 |   15022024 |     130000 |       |
      | MAUsr1 |   16022024 |     090000 |       |
      | MAUsr2 |   03022024 |     090000 |       |
      | MAUsr2 |   03022024 |     100000 |       |
      | MAUsr2 |   03022024 |     101000 |       |
      | MAUsr2 |   03022024 |     110000 |       |
      | MAUsr2 |   03022024 |     110500 |       |
      | MAUsr2 |   03022024 |     123000 |       |
      | MAUsr2 |   03022024 |     123500 |       |
      | MAUsr2 |   03022024 |     130000 |       |
      | MAUsr2 |   03022024 |     131000 |       |
      | MAUsr2 |   03022024 |     140000 |       |
      | MAUsr2 |   03022024 |     141000 |       |
      | MAUsr2 |   03022024 |     175500 |     4 |
      | MAUsr2 |   05022024 |     092000 |     3 |
      | MAUsr2 |   05022024 |     100000 |       |
      | MAUsr2 |   05022024 |     101000 |       |
      | MAUsr2 |   05022024 |     110000 |       |
      | MAUsr2 |   05022024 |     110500 |       |
      | MAUsr2 |   05022024 |     123000 |       |
      | MAUsr2 |   05022024 |     123500 |       |
      | MAUsr2 |   05022024 |     130000 |       |
      | MAUsr2 |   05022024 |     131000 |       |
      | MAUsr2 |   05022024 |     140000 |       |
      | MAUsr2 |   05022024 |     141000 |       |
      | MAUsr2 |   05022024 |     182000 |       |
      | MAUsr2 |   06022024 |     094000 |     3 |
      | MAUsr2 |   06022024 |     100000 |       |
      | MAUsr2 |   06022024 |     101000 |       |
      | MAUsr2 |   06022024 |     110000 |       |
      | MAUsr2 |   06022024 |     110500 |       |
      | MAUsr2 |   06022024 |     123000 |       |
      | MAUsr2 |   06022024 |     123500 |       |
      | MAUsr2 |   06022024 |     130000 |       |
      | MAUsr2 |   06022024 |     131000 |       |
      | MAUsr2 |   06022024 |     140000 |       |
      | MAUsr2 |   06022024 |     141000 |       |
      | MAUsr2 |   06022024 |     184000 |       |
      | MAUsr2 |   07022024 |     094500 |       |
      | MAUsr2 |   07022024 |     100000 |       |
      | MAUsr2 |   07022024 |     101000 |       |
      | MAUsr2 |   07022024 |     110000 |       |
      | MAUsr2 |   07022024 |     110500 |       |
      | MAUsr2 |   07022024 |     123000 |       |
      | MAUsr2 |   07022024 |     123500 |       |
      | MAUsr2 |   07022024 |     130000 |       |
      | MAUsr2 |   07022024 |     131000 |       |
      | MAUsr2 |   07022024 |     140000 |       |
      | MAUsr2 |   07022024 |     141000 |       |
      | MAUsr2 |   07022024 |     180000 |       |
      | MAUsr2 |   08022024 |     091500 |       |
      | MAUsr2 |   08022024 |     100000 |       |
      | MAUsr2 |   08022024 |     102000 |       |
      | MAUsr2 |   08022024 |     110000 |       |
      | MAUsr2 |   08022024 |     110500 |       |
      | MAUsr2 |   08022024 |     123000 |       |
      | MAUsr2 |   08022024 |     124500 |       |
      | MAUsr2 |   08022024 |     130000 |       |
      | MAUsr2 |   08022024 |     131000 |       |
      | MAUsr2 |   08022024 |     140000 |       |
      | MAUsr2 |   08022024 |     141000 |       |
      | MAUsr2 |   08022024 |     180000 |       |
      | MAUsr2 |   09022024 |     090000 |       |
      | MAUsr2 |   09022024 |     100000 |       |
      | MAUsr2 |   09022024 |     101000 |       |
      | MAUsr2 |   09022024 |     110000 |       |
      | MAUsr2 |   09022024 |     110500 |       |
      | MAUsr2 |   09022024 |     123000 |       |
      | MAUsr2 |   09022024 |     123500 |       |
      | MAUsr2 |   09022024 |     130000 |       |
      | MAUsr2 |   09022024 |     131000 |       |
      | MAUsr2 |   09022024 |     140000 |       |
      | MAUsr2 |   09022024 |     141000 |       |
      | MAUsr2 |   09022024 |     190000 |       |
      | MAUsr2 |   13022024 |     090000 |       |
      | MAUsr2 |   13022024 |     100000 |       |
      | MAUsr2 |   13022024 |     101000 |       |
      | MAUsr2 |   13022024 |     110000 |       |
      | MAUsr2 |   13022024 |     110500 |       |
      | MAUsr2 |   13022024 |     123000 |       |
      | MAUsr2 |   13022024 |     123500 |       |
      | MAUsr2 |   13022024 |     130000 |       |
      | MAUsr2 |   13022024 |     131000 |       |
      | MAUsr2 |   13022024 |     140000 |       |
      | MAUsr2 |   13022024 |     141000 |       |
      | MAUsr2 |   13022024 |     170000 |       |
      | MAUsr2 |   14022024 |     130000 |       |
      | MAUsr2 |   14022024 |     133000 |       |
      | MAUsr2 |   14022024 |     133500 |       |
      | MAUsr2 |   14022024 |     140000 |       |
      | MAUsr2 |   14022024 |     141000 |       |
      | MAUsr2 |   14022024 |     143000 |       |
      | MAUsr2 |   14022024 |     143500 |       |
      | MAUsr2 |   14022024 |     150000 |       |
      | MAUsr2 |   14022024 |     150500 |       |
      | MAUsr2 |   14022024 |     153000 |       |
      | MAUsr2 |   14022024 |     153500 |       |
      | MAUsr2 |   14022024 |     180000 |       |
      | MAUsr2 |   15022024 |     090000 |       |
      | MAUsr2 |   15022024 |     093000 |       |
      | MAUsr2 |   15022024 |     093500 |       |
      | MAUsr2 |   15022024 |     095000 |       |
      | MAUsr2 |   15022024 |     095500 |       |
      | MAUsr2 |   15022024 |     100000 |       |
      | MAUsr2 |   15022024 |     101000 |       |
      | MAUsr2 |   15022024 |     110000 |       |
      | MAUsr2 |   15022024 |     110500 |       |
      | MAUsr2 |   15022024 |     123000 |       |
      | MAUsr2 |   15022024 |     123500 |       |
      | MAUsr2 |   15022024 |     130000 |       |
      | MAUsr2 |   16022024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month    | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | February | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | February | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | February | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | February | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 14/02/2024 | 14/02/2024 | FI         |                     1 | 14/02/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 15/02/2024 | 15/02/2024 | FH         |                     1 | 15/02/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/02/2024 | 17/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 19/02/2024 | 19/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/02/2024 | 23/02/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/02/2024 | 27/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 29/02/2024 | 29/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  4 | 14/02/2024 | 14/02/2024 | FI         |                     1 | 14/02/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  4 | 15/02/2024 | 15/02/2024 | FH         |                     1 | 15/02/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  1 | 17/02/2024 | 17/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 19/02/2024 | 19/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 20/02/2024 | 23/02/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/02/2024 | 27/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 29/02/2024 | 29/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 14/02/2024 | 14/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 15/02/2024 | 15/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/02/2024 | 17/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 19/02/2024 | 19/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/02/2024 | 23/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/02/2024 | 27/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 29/02/2024 | 29/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 14/02/2024 | 14/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 15/02/2024 | 15/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 17/02/2024 | 17/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 19/02/2024 | 19/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 20/02/2024 | 23/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/02/2024 | 27/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 29/02/2024 | 29/02/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/02/2024 | 29/02/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Export Manage Attendance Data from Manage Attendance Page for "Multiple User"
      | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | Excel      |                   12 | true             |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01022024_to_29022024 | XLS        | Compared |

  @MACase6
  Scenario: Export Manage Attendance data for Multiple User -> Export Special Function Marking= true, File Format= CSV, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/02/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 24/02/2024 | 24/02/2024 | AutoTest1   | False        |
      | 28/02/2024 | 28/02/2024 | AutoTest2   | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03022024 |     090000 |       |
      | MAUsr1 |   03022024 |     100000 |       |
      | MAUsr1 |   03022024 |     101000 |       |
      | MAUsr1 |   03022024 |     110000 |       |
      | MAUsr1 |   03022024 |     110500 |       |
      | MAUsr1 |   03022024 |     123000 |       |
      | MAUsr1 |   03022024 |     123500 |       |
      | MAUsr1 |   03022024 |     130000 |       |
      | MAUsr1 |   03022024 |     131000 |       |
      | MAUsr1 |   03022024 |     140000 |       |
      | MAUsr1 |   03022024 |     141000 |       |
      | MAUsr1 |   03022024 |     175500 |     4 |
      | MAUsr1 |   05022024 |     092000 |     3 |
      | MAUsr1 |   05022024 |     100000 |       |
      | MAUsr1 |   05022024 |     101000 |       |
      | MAUsr1 |   05022024 |     110000 |       |
      | MAUsr1 |   05022024 |     110500 |       |
      | MAUsr1 |   05022024 |     123000 |       |
      | MAUsr1 |   05022024 |     123500 |       |
      | MAUsr1 |   05022024 |     130000 |       |
      | MAUsr1 |   05022024 |     131000 |       |
      | MAUsr1 |   05022024 |     140000 |       |
      | MAUsr1 |   05022024 |     141000 |       |
      | MAUsr1 |   05022024 |     182000 |       |
      | MAUsr1 |   06022024 |     094000 |     3 |
      | MAUsr1 |   06022024 |     100000 |       |
      | MAUsr1 |   06022024 |     101000 |       |
      | MAUsr1 |   06022024 |     110000 |       |
      | MAUsr1 |   06022024 |     110500 |       |
      | MAUsr1 |   06022024 |     123000 |       |
      | MAUsr1 |   06022024 |     123500 |       |
      | MAUsr1 |   06022024 |     130000 |       |
      | MAUsr1 |   06022024 |     131000 |       |
      | MAUsr1 |   06022024 |     140000 |       |
      | MAUsr1 |   06022024 |     141000 |       |
      | MAUsr1 |   06022024 |     184000 |       |
      | MAUsr1 |   07022024 |     094500 |       |
      | MAUsr1 |   07022024 |     100000 |       |
      | MAUsr1 |   07022024 |     101000 |       |
      | MAUsr1 |   07022024 |     110000 |       |
      | MAUsr1 |   07022024 |     110500 |       |
      | MAUsr1 |   07022024 |     123000 |       |
      | MAUsr1 |   07022024 |     123500 |       |
      | MAUsr1 |   07022024 |     130000 |       |
      | MAUsr1 |   07022024 |     131000 |       |
      | MAUsr1 |   07022024 |     140000 |       |
      | MAUsr1 |   07022024 |     141000 |       |
      | MAUsr1 |   07022024 |     180000 |       |
      | MAUsr1 |   08022024 |     091500 |       |
      | MAUsr1 |   08022024 |     100000 |       |
      | MAUsr1 |   08022024 |     102000 |       |
      | MAUsr1 |   08022024 |     110000 |       |
      | MAUsr1 |   08022024 |     110500 |       |
      | MAUsr1 |   08022024 |     123000 |       |
      | MAUsr1 |   08022024 |     124500 |       |
      | MAUsr1 |   08022024 |     130000 |       |
      | MAUsr1 |   08022024 |     131000 |       |
      | MAUsr1 |   08022024 |     140000 |       |
      | MAUsr1 |   08022024 |     141000 |       |
      | MAUsr1 |   08022024 |     180000 |       |
      | MAUsr1 |   09022024 |     090000 |       |
      | MAUsr1 |   09022024 |     100000 |       |
      | MAUsr1 |   09022024 |     101000 |       |
      | MAUsr1 |   09022024 |     110000 |       |
      | MAUsr1 |   09022024 |     110500 |       |
      | MAUsr1 |   09022024 |     123000 |       |
      | MAUsr1 |   09022024 |     123500 |       |
      | MAUsr1 |   09022024 |     130000 |       |
      | MAUsr1 |   09022024 |     131000 |       |
      | MAUsr1 |   09022024 |     140000 |       |
      | MAUsr1 |   09022024 |     141000 |       |
      | MAUsr1 |   09022024 |     190000 |       |
      | MAUsr1 |   13022024 |     090000 |       |
      | MAUsr1 |   13022024 |     100000 |       |
      | MAUsr1 |   13022024 |     101000 |       |
      | MAUsr1 |   13022024 |     110000 |       |
      | MAUsr1 |   13022024 |     110500 |       |
      | MAUsr1 |   13022024 |     123000 |       |
      | MAUsr1 |   13022024 |     123500 |       |
      | MAUsr1 |   13022024 |     130000 |       |
      | MAUsr1 |   13022024 |     131000 |       |
      | MAUsr1 |   13022024 |     140000 |       |
      | MAUsr1 |   13022024 |     141000 |       |
      | MAUsr1 |   13022024 |     170000 |       |
      | MAUsr1 |   14022024 |     130000 |       |
      | MAUsr1 |   14022024 |     133000 |       |
      | MAUsr1 |   14022024 |     133500 |       |
      | MAUsr1 |   14022024 |     140000 |       |
      | MAUsr1 |   14022024 |     141000 |       |
      | MAUsr1 |   14022024 |     143000 |       |
      | MAUsr1 |   14022024 |     143500 |       |
      | MAUsr1 |   14022024 |     150000 |       |
      | MAUsr1 |   14022024 |     150500 |       |
      | MAUsr1 |   14022024 |     153000 |       |
      | MAUsr1 |   14022024 |     153500 |       |
      | MAUsr1 |   14022024 |     180000 |       |
      | MAUsr1 |   15022024 |     090000 |       |
      | MAUsr1 |   15022024 |     093000 |       |
      | MAUsr1 |   15022024 |     093500 |       |
      | MAUsr1 |   15022024 |     095000 |       |
      | MAUsr1 |   15022024 |     095500 |       |
      | MAUsr1 |   15022024 |     100000 |       |
      | MAUsr1 |   15022024 |     101000 |       |
      | MAUsr1 |   15022024 |     110000 |       |
      | MAUsr1 |   15022024 |     110500 |       |
      | MAUsr1 |   15022024 |     123000 |       |
      | MAUsr1 |   15022024 |     123500 |       |
      | MAUsr1 |   15022024 |     130000 |       |
      | MAUsr1 |   16022024 |     090000 |       |
      | MAUsr2 |   03022024 |     090000 |       |
      | MAUsr2 |   03022024 |     100000 |       |
      | MAUsr2 |   03022024 |     101000 |       |
      | MAUsr2 |   03022024 |     110000 |       |
      | MAUsr2 |   03022024 |     110500 |       |
      | MAUsr2 |   03022024 |     123000 |       |
      | MAUsr2 |   03022024 |     123500 |       |
      | MAUsr2 |   03022024 |     130000 |       |
      | MAUsr2 |   03022024 |     131000 |       |
      | MAUsr2 |   03022024 |     140000 |       |
      | MAUsr2 |   03022024 |     141000 |       |
      | MAUsr2 |   03022024 |     175500 |     4 |
      | MAUsr2 |   05022024 |     092000 |     3 |
      | MAUsr2 |   05022024 |     100000 |       |
      | MAUsr2 |   05022024 |     101000 |       |
      | MAUsr2 |   05022024 |     110000 |       |
      | MAUsr2 |   05022024 |     110500 |       |
      | MAUsr2 |   05022024 |     123000 |       |
      | MAUsr2 |   05022024 |     123500 |       |
      | MAUsr2 |   05022024 |     130000 |       |
      | MAUsr2 |   05022024 |     131000 |       |
      | MAUsr2 |   05022024 |     140000 |       |
      | MAUsr2 |   05022024 |     141000 |       |
      | MAUsr2 |   05022024 |     182000 |       |
      | MAUsr2 |   06022024 |     094000 |     3 |
      | MAUsr2 |   06022024 |     100000 |       |
      | MAUsr2 |   06022024 |     101000 |       |
      | MAUsr2 |   06022024 |     110000 |       |
      | MAUsr2 |   06022024 |     110500 |       |
      | MAUsr2 |   06022024 |     123000 |       |
      | MAUsr2 |   06022024 |     123500 |       |
      | MAUsr2 |   06022024 |     130000 |       |
      | MAUsr2 |   06022024 |     131000 |       |
      | MAUsr2 |   06022024 |     140000 |       |
      | MAUsr2 |   06022024 |     141000 |       |
      | MAUsr2 |   06022024 |     184000 |       |
      | MAUsr2 |   07022024 |     094500 |       |
      | MAUsr2 |   07022024 |     100000 |       |
      | MAUsr2 |   07022024 |     101000 |       |
      | MAUsr2 |   07022024 |     110000 |       |
      | MAUsr2 |   07022024 |     110500 |       |
      | MAUsr2 |   07022024 |     123000 |       |
      | MAUsr2 |   07022024 |     123500 |       |
      | MAUsr2 |   07022024 |     130000 |       |
      | MAUsr2 |   07022024 |     131000 |       |
      | MAUsr2 |   07022024 |     140000 |       |
      | MAUsr2 |   07022024 |     141000 |       |
      | MAUsr2 |   07022024 |     180000 |       |
      | MAUsr2 |   08022024 |     091500 |       |
      | MAUsr2 |   08022024 |     100000 |       |
      | MAUsr2 |   08022024 |     102000 |       |
      | MAUsr2 |   08022024 |     110000 |       |
      | MAUsr2 |   08022024 |     110500 |       |
      | MAUsr2 |   08022024 |     123000 |       |
      | MAUsr2 |   08022024 |     124500 |       |
      | MAUsr2 |   08022024 |     130000 |       |
      | MAUsr2 |   08022024 |     131000 |       |
      | MAUsr2 |   08022024 |     140000 |       |
      | MAUsr2 |   08022024 |     141000 |       |
      | MAUsr2 |   08022024 |     180000 |       |
      | MAUsr2 |   09022024 |     090000 |       |
      | MAUsr2 |   09022024 |     100000 |       |
      | MAUsr2 |   09022024 |     101000 |       |
      | MAUsr2 |   09022024 |     110000 |       |
      | MAUsr2 |   09022024 |     110500 |       |
      | MAUsr2 |   09022024 |     123000 |       |
      | MAUsr2 |   09022024 |     123500 |       |
      | MAUsr2 |   09022024 |     130000 |       |
      | MAUsr2 |   09022024 |     131000 |       |
      | MAUsr2 |   09022024 |     140000 |       |
      | MAUsr2 |   09022024 |     141000 |       |
      | MAUsr2 |   09022024 |     190000 |       |
      | MAUsr2 |   13022024 |     090000 |       |
      | MAUsr2 |   13022024 |     100000 |       |
      | MAUsr2 |   13022024 |     101000 |       |
      | MAUsr2 |   13022024 |     110000 |       |
      | MAUsr2 |   13022024 |     110500 |       |
      | MAUsr2 |   13022024 |     123000 |       |
      | MAUsr2 |   13022024 |     123500 |       |
      | MAUsr2 |   13022024 |     130000 |       |
      | MAUsr2 |   13022024 |     131000 |       |
      | MAUsr2 |   13022024 |     140000 |       |
      | MAUsr2 |   13022024 |     141000 |       |
      | MAUsr2 |   13022024 |     170000 |       |
      | MAUsr2 |   14022024 |     130000 |       |
      | MAUsr2 |   14022024 |     133000 |       |
      | MAUsr2 |   14022024 |     133500 |       |
      | MAUsr2 |   14022024 |     140000 |       |
      | MAUsr2 |   14022024 |     141000 |       |
      | MAUsr2 |   14022024 |     143000 |       |
      | MAUsr2 |   14022024 |     143500 |       |
      | MAUsr2 |   14022024 |     150000 |       |
      | MAUsr2 |   14022024 |     150500 |       |
      | MAUsr2 |   14022024 |     153000 |       |
      | MAUsr2 |   14022024 |     153500 |       |
      | MAUsr2 |   14022024 |     180000 |       |
      | MAUsr2 |   15022024 |     090000 |       |
      | MAUsr2 |   15022024 |     093000 |       |
      | MAUsr2 |   15022024 |     093500 |       |
      | MAUsr2 |   15022024 |     095000 |       |
      | MAUsr2 |   15022024 |     095500 |       |
      | MAUsr2 |   15022024 |     100000 |       |
      | MAUsr2 |   15022024 |     101000 |       |
      | MAUsr2 |   15022024 |     110000 |       |
      | MAUsr2 |   15022024 |     110500 |       |
      | MAUsr2 |   15022024 |     123000 |       |
      | MAUsr2 |   15022024 |     123500 |       |
      | MAUsr2 |   15022024 |     130000 |       |
      | MAUsr2 |   16022024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month    | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | February | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | February | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | February | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | February | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 14/02/2024 | 14/02/2024 | FI         |                     1 | 14/02/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 15/02/2024 | 15/02/2024 | FH         |                     1 | 15/02/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/02/2024 | 17/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 19/02/2024 | 19/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/02/2024 | 23/02/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/02/2024 | 27/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 29/02/2024 | 29/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  4 | 14/02/2024 | 14/02/2024 | FI         |                     1 | 14/02/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  4 | 15/02/2024 | 15/02/2024 | FH         |                     1 | 15/02/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  1 | 17/02/2024 | 17/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 19/02/2024 | 19/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 20/02/2024 | 23/02/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/02/2024 | 27/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 29/02/2024 | 29/02/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 14/02/2024 | 14/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 15/02/2024 | 15/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/02/2024 | 17/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 19/02/2024 | 19/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/02/2024 | 23/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/02/2024 | 27/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 29/02/2024 | 29/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 14/02/2024 | 14/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 15/02/2024 | 15/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 17/02/2024 | 17/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 19/02/2024 | 19/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 20/02/2024 | 23/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/02/2024 | 27/02/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 29/02/2024 | 29/02/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "February" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/02/2024 | 29/02/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Export Manage Attendance Data from Manage Attendance Page for "Multiple User"
      | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | CSV        |                   12 | true             |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01022024_to_29022024 | CSV        | Compared |

  @MACase7
  Scenario: Export Manage Attendance data for Single User -> Export Special Function Marking= false, File Format= Excel, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest1   | False        |
      | 29/03/2024 | 29/03/2024 | AutoTest2   | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   04032024 |     091500 |       |
      | MAUsr1 |   04032024 |     100000 |       |
      | MAUsr1 |   04032024 |     101000 |       |
      | MAUsr1 |   04032024 |     110000 |       |
      | MAUsr1 |   04032024 |     110500 |       |
      | MAUsr1 |   04032024 |     123000 |       |
      | MAUsr1 |   04032024 |     123500 |       |
      | MAUsr1 |   04032024 |     130000 |       |
      | MAUsr1 |   04032024 |     131000 |       |
      | MAUsr1 |   04032024 |     140000 |       |
      | MAUsr1 |   04032024 |     141000 |       |
      | MAUsr1 |   04032024 |     180000 |       |
      | MAUsr1 |   05032024 |     092000 |     3 |
      | MAUsr1 |   05032024 |     100000 |       |
      | MAUsr1 |   05032024 |     101000 |       |
      | MAUsr1 |   05032024 |     110000 |       |
      | MAUsr1 |   05032024 |     110500 |       |
      | MAUsr1 |   05032024 |     123000 |       |
      | MAUsr1 |   05032024 |     123500 |       |
      | MAUsr1 |   05032024 |     130000 |       |
      | MAUsr1 |   05032024 |     131000 |       |
      | MAUsr1 |   05032024 |     140000 |       |
      | MAUsr1 |   05032024 |     141000 |       |
      | MAUsr1 |   05032024 |     182000 |       |
      | MAUsr1 |   06032024 |     094000 |     3 |
      | MAUsr1 |   06032024 |     100000 |       |
      | MAUsr1 |   06032024 |     101000 |       |
      | MAUsr1 |   06032024 |     110000 |       |
      | MAUsr1 |   06032024 |     110500 |       |
      | MAUsr1 |   06032024 |     123000 |       |
      | MAUsr1 |   06032024 |     123500 |       |
      | MAUsr1 |   06032024 |     130000 |       |
      | MAUsr1 |   06032024 |     131000 |       |
      | MAUsr1 |   06032024 |     140000 |       |
      | MAUsr1 |   06032024 |     141000 |       |
      | MAUsr1 |   06032024 |     184000 |       |
      | MAUsr1 |   07032024 |     090000 |       |
      | MAUsr1 |   07032024 |     100000 |       |
      | MAUsr1 |   07032024 |     101000 |       |
      | MAUsr1 |   07032024 |     110000 |       |
      | MAUsr1 |   07032024 |     110500 |       |
      | MAUsr1 |   07032024 |     123000 |       |
      | MAUsr1 |   07032024 |     123500 |       |
      | MAUsr1 |   07032024 |     130000 |       |
      | MAUsr1 |   07032024 |     131000 |       |
      | MAUsr1 |   07032024 |     140000 |       |
      | MAUsr1 |   07032024 |     141000 |       |
      | MAUsr1 |   07032024 |     175500 |     4 |
      | MAUsr1 |   08032024 |     091500 |     3 |
      | MAUsr1 |   08032024 |     100000 |       |
      | MAUsr1 |   08032024 |     101000 |       |
      | MAUsr1 |   08032024 |     110000 |       |
      | MAUsr1 |   08032024 |     110500 |       |
      | MAUsr1 |   08032024 |     123000 |       |
      | MAUsr1 |   08032024 |     123500 |       |
      | MAUsr1 |   08032024 |     130000 |       |
      | MAUsr1 |   08032024 |     131000 |       |
      | MAUsr1 |   08032024 |     140000 |       |
      | MAUsr1 |   08032024 |     141000 |       |
      | MAUsr1 |   08032024 |     180000 |       |
      | MAUsr1 |   12032024 |     090000 |       |
      | MAUsr1 |   12032024 |     093000 |       |
      | MAUsr1 |   12032024 |     093500 |       |
      | MAUsr1 |   12032024 |     095000 |       |
      | MAUsr1 |   12032024 |     095500 |       |
      | MAUsr1 |   12032024 |     100000 |       |
      | MAUsr1 |   12032024 |     101000 |       |
      | MAUsr1 |   12032024 |     110000 |       |
      | MAUsr1 |   12032024 |     110500 |       |
      | MAUsr1 |   12032024 |     123000 |       |
      | MAUsr1 |   12032024 |     123500 |       |
      | MAUsr1 |   12032024 |     130000 |       |
      | MAUsr1 |   13032024 |     130000 |       |
      | MAUsr1 |   13032024 |     133000 |       |
      | MAUsr1 |   13032024 |     133500 |       |
      | MAUsr1 |   13032024 |     140000 |       |
      | MAUsr1 |   13032024 |     141000 |       |
      | MAUsr1 |   13032024 |     143000 |       |
      | MAUsr1 |   13032024 |     143500 |       |
      | MAUsr1 |   13032024 |     150000 |       |
      | MAUsr1 |   13032024 |     150500 |       |
      | MAUsr1 |   13032024 |     153000 |       |
      | MAUsr1 |   13032024 |     153500 |       |
      | MAUsr1 |   13032024 |     180000 |       |
      | MAUsr1 |   14032024 |     090000 |       |
      | MAUsr1 |   14032024 |     100000 |       |
      | MAUsr1 |   14032024 |     101000 |       |
      | MAUsr1 |   14032024 |     110000 |       |
      | MAUsr1 |   14032024 |     110500 |       |
      | MAUsr1 |   14032024 |     123000 |       |
      | MAUsr1 |   14032024 |     123500 |       |
      | MAUsr1 |   14032024 |     130000 |       |
      | MAUsr1 |   14032024 |     131000 |       |
      | MAUsr1 |   14032024 |     140000 |       |
      | MAUsr1 |   14032024 |     141000 |       |
      | MAUsr1 |   14032024 |     180000 |       |
      | MAUsr1 |   15032024 |     090000 |       |
      | MAUsr1 |   15032024 |     100000 |       |
      | MAUsr1 |   15032024 |     101000 |       |
      | MAUsr1 |   15032024 |     110000 |       |
      | MAUsr1 |   15032024 |     110500 |       |
      | MAUsr1 |   15032024 |     123000 |       |
      | MAUsr1 |   15032024 |     123500 |       |
      | MAUsr1 |   15032024 |     130000 |       |
      | MAUsr1 |   15032024 |     131000 |       |
      | MAUsr1 |   15032024 |     140000 |       |
      | MAUsr1 |   15032024 |     141000 |       |
      | MAUsr1 |   15032024 |     190000 |       |
      | MAUsr1 |   19012024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | March | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | March | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 12/03/2024 | 12/03/2024 | FH         |                     1 | 12/03/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  4 | 13/03/2024 | 13/03/2024 | FI         |                     1 | 13/03/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  1 | 16/03/2024 | 16/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 18/03/2024 | 18/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/03/2024 | 23/03/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/03/2024 | 25/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/03/2024 | 27/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/03/2024 | 12/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 13/03/2024 | 13/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 16/03/2024 | 16/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 18/03/2024 | 18/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/03/2024 | 23/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/03/2024 | 25/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/03/2024 | 27/03/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    When Export Manage Attendance Data from Manage Attendance Page for "Single User"
      | FromDate   | ToDate     | UserID | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | 01/03/2024 | 31/03/2024 | MAUsr1 | Excel      |                   12 | false            |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01032024_to_31032024 | XLS        | Compared |

  @MACase8
  Scenario: Export Manage Attendance data for Single User -> Export Special Function Marking= false, File Format= CSV, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest1   | False        |
      | 29/03/2024 | 29/03/2024 | AutoTest2   | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   04032024 |     091500 |       |
      | MAUsr1 |   04032024 |     100000 |       |
      | MAUsr1 |   04032024 |     101000 |       |
      | MAUsr1 |   04032024 |     110000 |       |
      | MAUsr1 |   04032024 |     110500 |       |
      | MAUsr1 |   04032024 |     123000 |       |
      | MAUsr1 |   04032024 |     123500 |       |
      | MAUsr1 |   04032024 |     130000 |       |
      | MAUsr1 |   04032024 |     131000 |       |
      | MAUsr1 |   04032024 |     140000 |       |
      | MAUsr1 |   04032024 |     141000 |       |
      | MAUsr1 |   04032024 |     180000 |       |
      | MAUsr1 |   05032024 |     092000 |     3 |
      | MAUsr1 |   05032024 |     100000 |       |
      | MAUsr1 |   05032024 |     101000 |       |
      | MAUsr1 |   05032024 |     110000 |       |
      | MAUsr1 |   05032024 |     110500 |       |
      | MAUsr1 |   05032024 |     123000 |       |
      | MAUsr1 |   05032024 |     123500 |       |
      | MAUsr1 |   05032024 |     130000 |       |
      | MAUsr1 |   05032024 |     131000 |       |
      | MAUsr1 |   05032024 |     140000 |       |
      | MAUsr1 |   05032024 |     141000 |       |
      | MAUsr1 |   05032024 |     182000 |       |
      | MAUsr1 |   06032024 |     094000 |     3 |
      | MAUsr1 |   06032024 |     100000 |       |
      | MAUsr1 |   06032024 |     101000 |       |
      | MAUsr1 |   06032024 |     110000 |       |
      | MAUsr1 |   06032024 |     110500 |       |
      | MAUsr1 |   06032024 |     123000 |       |
      | MAUsr1 |   06032024 |     123500 |       |
      | MAUsr1 |   06032024 |     130000 |       |
      | MAUsr1 |   06032024 |     131000 |       |
      | MAUsr1 |   06032024 |     140000 |       |
      | MAUsr1 |   06032024 |     141000 |       |
      | MAUsr1 |   06032024 |     184000 |       |
      | MAUsr1 |   07032024 |     090000 |       |
      | MAUsr1 |   07032024 |     100000 |       |
      | MAUsr1 |   07032024 |     101000 |       |
      | MAUsr1 |   07032024 |     110000 |       |
      | MAUsr1 |   07032024 |     110500 |       |
      | MAUsr1 |   07032024 |     123000 |       |
      | MAUsr1 |   07032024 |     123500 |       |
      | MAUsr1 |   07032024 |     130000 |       |
      | MAUsr1 |   07032024 |     131000 |       |
      | MAUsr1 |   07032024 |     140000 |       |
      | MAUsr1 |   07032024 |     141000 |       |
      | MAUsr1 |   07032024 |     175500 |     4 |
      | MAUsr1 |   08032024 |     091500 |     3 |
      | MAUsr1 |   08032024 |     100000 |       |
      | MAUsr1 |   08032024 |     101000 |       |
      | MAUsr1 |   08032024 |     110000 |       |
      | MAUsr1 |   08032024 |     110500 |       |
      | MAUsr1 |   08032024 |     123000 |       |
      | MAUsr1 |   08032024 |     123500 |       |
      | MAUsr1 |   08032024 |     130000 |       |
      | MAUsr1 |   08032024 |     131000 |       |
      | MAUsr1 |   08032024 |     140000 |       |
      | MAUsr1 |   08032024 |     141000 |       |
      | MAUsr1 |   08032024 |     180000 |       |
      | MAUsr1 |   12032024 |     090000 |       |
      | MAUsr1 |   12032024 |     093000 |       |
      | MAUsr1 |   12032024 |     093500 |       |
      | MAUsr1 |   12032024 |     095000 |       |
      | MAUsr1 |   12032024 |     095500 |       |
      | MAUsr1 |   12032024 |     100000 |       |
      | MAUsr1 |   12032024 |     101000 |       |
      | MAUsr1 |   12032024 |     110000 |       |
      | MAUsr1 |   12032024 |     110500 |       |
      | MAUsr1 |   12032024 |     123000 |       |
      | MAUsr1 |   12032024 |     123500 |       |
      | MAUsr1 |   12032024 |     130000 |       |
      | MAUsr1 |   13032024 |     130000 |       |
      | MAUsr1 |   13032024 |     133000 |       |
      | MAUsr1 |   13032024 |     133500 |       |
      | MAUsr1 |   13032024 |     140000 |       |
      | MAUsr1 |   13032024 |     141000 |       |
      | MAUsr1 |   13032024 |     143000 |       |
      | MAUsr1 |   13032024 |     143500 |       |
      | MAUsr1 |   13032024 |     150000 |       |
      | MAUsr1 |   13032024 |     150500 |       |
      | MAUsr1 |   13032024 |     153000 |       |
      | MAUsr1 |   13032024 |     153500 |       |
      | MAUsr1 |   13032024 |     180000 |       |
      | MAUsr1 |   14032024 |     090000 |       |
      | MAUsr1 |   14032024 |     100000 |       |
      | MAUsr1 |   14032024 |     101000 |       |
      | MAUsr1 |   14032024 |     110000 |       |
      | MAUsr1 |   14032024 |     110500 |       |
      | MAUsr1 |   14032024 |     123000 |       |
      | MAUsr1 |   14032024 |     123500 |       |
      | MAUsr1 |   14032024 |     130000 |       |
      | MAUsr1 |   14032024 |     131000 |       |
      | MAUsr1 |   14032024 |     140000 |       |
      | MAUsr1 |   14032024 |     141000 |       |
      | MAUsr1 |   14032024 |     180000 |       |
      | MAUsr1 |   15032024 |     090000 |       |
      | MAUsr1 |   15032024 |     100000 |       |
      | MAUsr1 |   15032024 |     101000 |       |
      | MAUsr1 |   15032024 |     110000 |       |
      | MAUsr1 |   15032024 |     110500 |       |
      | MAUsr1 |   15032024 |     123000 |       |
      | MAUsr1 |   15032024 |     123500 |       |
      | MAUsr1 |   15032024 |     130000 |       |
      | MAUsr1 |   15032024 |     131000 |       |
      | MAUsr1 |   15032024 |     140000 |       |
      | MAUsr1 |   15032024 |     141000 |       |
      | MAUsr1 |   15032024 |     190000 |       |
      | MAUsr1 |   19012024 |     090000 |       |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | March | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | March | 2024 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 12/03/2024 | 12/03/2024 | FH         |                     1 | 12/03/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  4 | 13/03/2024 | 13/03/2024 | FI         |                     1 | 13/03/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  1 | 16/03/2024 | 16/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 18/03/2024 | 18/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/03/2024 | 23/03/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/03/2024 | 25/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/03/2024 | 27/03/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/03/2024 | 12/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 13/03/2024 | 13/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 16/03/2024 | 16/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 18/03/2024 | 18/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/03/2024 | 23/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/03/2024 | 25/03/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/03/2024 | 27/03/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    When Export Manage Attendance Data from Manage Attendance Page for "Single User"
      | FromDate   | ToDate     | UserID | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | 01/03/2024 | 31/03/2024 | MAUsr1 | CSV        |                   12 | false            |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01032024_to_31032024 | CSV        | Compared |

  @MACase9
  Scenario: Export Manage Attendance data for Multiple User -> Export Special Function Marking= false, File Format= Excel, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName  | DeviceSynced |
      | 26/04/2024 | 26/04/2024 | HolidayTest1 | False        |
      | 29/01/2024 | 29/01/2024 | HolidayTest2 | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | April | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | April | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | April | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | April | 2024 |          | credit | 010:00 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03042024 |     090000 |       |
      | MAUsr1 |   03042024 |     100000 |       |
      | MAUsr1 |   03042024 |     101000 |       |
      | MAUsr1 |   03042024 |     110000 |       |
      | MAUsr1 |   03042024 |     110500 |       |
      | MAUsr1 |   03042024 |     123000 |       |
      | MAUsr1 |   03042024 |     123500 |       |
      | MAUsr1 |   03042024 |     130000 |       |
      | MAUsr1 |   03042024 |     131000 |       |
      | MAUsr1 |   03042024 |     140000 |       |
      | MAUsr1 |   03042024 |     141000 |       |
      | MAUsr1 |   03042024 |     175500 |     4 |
      | MAUsr1 |   04042024 |     094500 |       |
      | MAUsr1 |   04042024 |     100000 |       |
      | MAUsr1 |   04042024 |     101000 |       |
      | MAUsr1 |   04042024 |     110000 |       |
      | MAUsr1 |   04042024 |     110500 |       |
      | MAUsr1 |   04042024 |     123000 |       |
      | MAUsr1 |   04042024 |     123500 |       |
      | MAUsr1 |   04042024 |     130000 |       |
      | MAUsr1 |   04042024 |     131000 |       |
      | MAUsr1 |   04042024 |     140000 |       |
      | MAUsr1 |   04042024 |     141000 |       |
      | MAUsr1 |   04042024 |     180000 |       |
      | MAUsr1 |   05042024 |     092000 |     3 |
      | MAUsr1 |   05042024 |     100000 |       |
      | MAUsr1 |   05042024 |     101000 |       |
      | MAUsr1 |   05042024 |     110000 |       |
      | MAUsr1 |   05042024 |     110500 |       |
      | MAUsr1 |   05042024 |     123000 |       |
      | MAUsr1 |   05042024 |     123500 |       |
      | MAUsr1 |   05042024 |     130000 |       |
      | MAUsr1 |   05042024 |     131000 |       |
      | MAUsr1 |   05042024 |     140000 |       |
      | MAUsr1 |   05042024 |     141000 |       |
      | MAUsr1 |   05042024 |     182000 |       |
      | MAUsr1 |   06042024 |     094000 |     3 |
      | MAUsr1 |   06042024 |     100000 |       |
      | MAUsr1 |   06042024 |     101000 |       |
      | MAUsr1 |   06042024 |     110000 |       |
      | MAUsr1 |   06042024 |     110500 |       |
      | MAUsr1 |   06042024 |     123000 |       |
      | MAUsr1 |   06042024 |     123500 |       |
      | MAUsr1 |   06042024 |     130000 |       |
      | MAUsr1 |   06042024 |     131000 |       |
      | MAUsr1 |   06042024 |     140000 |       |
      | MAUsr1 |   06042024 |     141000 |       |
      | MAUsr1 |   06042024 |     184000 |       |
      | MAUsr1 |   08042024 |     091500 |       |
      | MAUsr1 |   08042024 |     100000 |       |
      | MAUsr1 |   08042024 |     101000 |       |
      | MAUsr1 |   08042024 |     110000 |       |
      | MAUsr1 |   08042024 |     110500 |       |
      | MAUsr1 |   08042024 |     123000 |       |
      | MAUsr1 |   08042024 |     123500 |       |
      | MAUsr1 |   08042024 |     130000 |       |
      | MAUsr1 |   08042024 |     131000 |       |
      | MAUsr1 |   08042024 |     140000 |       |
      | MAUsr1 |   08042024 |     141000 |       |
      | MAUsr1 |   08042024 |     180000 |       |
      | MAUsr1 |   09042024 |     090000 |       |
      | MAUsr1 |   09042024 |     100000 |       |
      | MAUsr1 |   09042024 |     101000 |       |
      | MAUsr1 |   09042024 |     110000 |       |
      | MAUsr1 |   09042024 |     110500 |       |
      | MAUsr1 |   09042024 |     123000 |       |
      | MAUsr1 |   09042024 |     123500 |       |
      | MAUsr1 |   09042024 |     130000 |       |
      | MAUsr1 |   09042024 |     131000 |       |
      | MAUsr1 |   09042024 |     140000 |       |
      | MAUsr1 |   09042024 |     141000 |       |
      | MAUsr1 |   09042024 |     190000 |       |
      | MAUsr1 |   10042024 |     090000 |       |
      | MAUsr1 |   10042024 |     100000 |       |
      | MAUsr1 |   10042024 |     101000 |       |
      | MAUsr1 |   10042024 |     110000 |       |
      | MAUsr1 |   10042024 |     110500 |       |
      | MAUsr1 |   10042024 |     123000 |       |
      | MAUsr1 |   10042024 |     123500 |       |
      | MAUsr1 |   10042024 |     130000 |       |
      | MAUsr1 |   10042024 |     131000 |       |
      | MAUsr1 |   10042024 |     140000 |       |
      | MAUsr1 |   10042024 |     141000 |       |
      | MAUsr1 |   10042024 |     170000 |       |
      | MAUsr1 |   11042024 |     130000 |       |
      | MAUsr1 |   11042024 |     133000 |       |
      | MAUsr1 |   11042024 |     133500 |       |
      | MAUsr1 |   11042024 |     140000 |       |
      | MAUsr1 |   11042024 |     141000 |       |
      | MAUsr1 |   11042024 |     143000 |       |
      | MAUsr1 |   11042024 |     143500 |       |
      | MAUsr1 |   11042024 |     150000 |       |
      | MAUsr1 |   11042024 |     150500 |       |
      | MAUsr1 |   11042024 |     153000 |       |
      | MAUsr1 |   11042024 |     153500 |       |
      | MAUsr1 |   11042024 |     180000 |       |
      | MAUsr1 |   12042024 |     090000 |       |
      | MAUsr1 |   12042024 |     093000 |       |
      | MAUsr1 |   12042024 |     093500 |       |
      | MAUsr1 |   12042024 |     095000 |       |
      | MAUsr1 |   12042024 |     095500 |       |
      | MAUsr1 |   12042024 |     100000 |       |
      | MAUsr1 |   12042024 |     101000 |       |
      | MAUsr1 |   12042024 |     110000 |       |
      | MAUsr1 |   12042024 |     110500 |       |
      | MAUsr1 |   12042024 |     123000 |       |
      | MAUsr1 |   12042024 |     123500 |       |
      | MAUsr1 |   12042024 |     130000 |       |
      | MAUsr1 |   16042024 |     090000 |       |
      | MAUsr1 |   30042024 |     093000 |       |
      | MAUsr1 |   30042024 |     100000 |       |
      | MAUsr1 |   30042024 |     101000 |       |
      | MAUsr1 |   30042024 |     110000 |       |
      | MAUsr1 |   30042024 |     111000 |       |
      | MAUsr1 |   30042024 |     123000 |       |
      | MAUsr1 |   30042024 |     123500 |       |
      | MAUsr1 |   30042024 |     130000 |       |
      | MAUsr1 |   30042024 |     131000 |       |
      | MAUsr1 |   30042024 |     140000 |       |
      | MAUsr1 |   30042024 |     141000 |       |
      | MAUsr1 |   30042024 |     180000 |       |
      | MAUsr2 |   03042024 |     090000 |       |
      | MAUsr2 |   03042024 |     100000 |       |
      | MAUsr2 |   03042024 |     101000 |       |
      | MAUsr2 |   03042024 |     110000 |       |
      | MAUsr2 |   03042024 |     110500 |       |
      | MAUsr2 |   03042024 |     123000 |       |
      | MAUsr2 |   03042024 |     123500 |       |
      | MAUsr2 |   03042024 |     130000 |       |
      | MAUsr2 |   03042024 |     131000 |       |
      | MAUsr2 |   03042024 |     140000 |       |
      | MAUsr2 |   03042024 |     141000 |       |
      | MAUsr2 |   03042024 |     175500 |     4 |
      | MAUsr2 |   04042024 |     094500 |       |
      | MAUsr2 |   04042024 |     100000 |       |
      | MAUsr2 |   04042024 |     101000 |       |
      | MAUsr2 |   04042024 |     110000 |       |
      | MAUsr2 |   04042024 |     110500 |       |
      | MAUsr2 |   04042024 |     123000 |       |
      | MAUsr2 |   04042024 |     123500 |       |
      | MAUsr2 |   04042024 |     130000 |       |
      | MAUsr2 |   04042024 |     131000 |       |
      | MAUsr2 |   04042024 |     140000 |       |
      | MAUsr2 |   04042024 |     141000 |       |
      | MAUsr2 |   04042024 |     180000 |       |
      | MAUsr2 |   05042024 |     092000 |     3 |
      | MAUsr2 |   05042024 |     100000 |       |
      | MAUsr2 |   05042024 |     101000 |       |
      | MAUsr2 |   05042024 |     110000 |       |
      | MAUsr2 |   05042024 |     110500 |       |
      | MAUsr2 |   05042024 |     123000 |       |
      | MAUsr2 |   05042024 |     123500 |       |
      | MAUsr2 |   05042024 |     130000 |       |
      | MAUsr2 |   05042024 |     131000 |       |
      | MAUsr2 |   05042024 |     140000 |       |
      | MAUsr2 |   05042024 |     141000 |       |
      | MAUsr2 |   05042024 |     182000 |       |
      | MAUsr2 |   06042024 |     094000 |     3 |
      | MAUsr2 |   06042024 |     100000 |       |
      | MAUsr2 |   06042024 |     101000 |       |
      | MAUsr2 |   06042024 |     110000 |       |
      | MAUsr2 |   06042024 |     110500 |       |
      | MAUsr2 |   06042024 |     123000 |       |
      | MAUsr2 |   06042024 |     123500 |       |
      | MAUsr2 |   06042024 |     130000 |       |
      | MAUsr2 |   06042024 |     131000 |       |
      | MAUsr2 |   06042024 |     140000 |       |
      | MAUsr2 |   06042024 |     141000 |       |
      | MAUsr2 |   06042024 |     184000 |       |
      | MAUsr2 |   08042024 |     091500 |       |
      | MAUsr2 |   08042024 |     100000 |       |
      | MAUsr2 |   08042024 |     101000 |       |
      | MAUsr2 |   08042024 |     110000 |       |
      | MAUsr2 |   08042024 |     110500 |       |
      | MAUsr2 |   08042024 |     123000 |       |
      | MAUsr2 |   08042024 |     123500 |       |
      | MAUsr2 |   08042024 |     130000 |       |
      | MAUsr2 |   08042024 |     131000 |       |
      | MAUsr2 |   08042024 |     140000 |       |
      | MAUsr2 |   08042024 |     141000 |       |
      | MAUsr2 |   08042024 |     180000 |       |
      | MAUsr2 |   09042024 |     090000 |       |
      | MAUsr2 |   09042024 |     100000 |       |
      | MAUsr2 |   09042024 |     101000 |       |
      | MAUsr2 |   09042024 |     110000 |       |
      | MAUsr2 |   09042024 |     110500 |       |
      | MAUsr2 |   09042024 |     123000 |       |
      | MAUsr2 |   09042024 |     123500 |       |
      | MAUsr2 |   09042024 |     130000 |       |
      | MAUsr2 |   09042024 |     131000 |       |
      | MAUsr2 |   09042024 |     140000 |       |
      | MAUsr2 |   09042024 |     141000 |       |
      | MAUsr2 |   09042024 |     190000 |       |
      | MAUsr2 |   10042024 |     090000 |       |
      | MAUsr2 |   10042024 |     100000 |       |
      | MAUsr2 |   10042024 |     101000 |       |
      | MAUsr2 |   10042024 |     110000 |       |
      | MAUsr2 |   10042024 |     110500 |       |
      | MAUsr2 |   10042024 |     123000 |       |
      | MAUsr2 |   10042024 |     123500 |       |
      | MAUsr2 |   10042024 |     130000 |       |
      | MAUsr2 |   10042024 |     131000 |       |
      | MAUsr2 |   10042024 |     140000 |       |
      | MAUsr2 |   10042024 |     141000 |       |
      | MAUsr2 |   10042024 |     170000 |       |
      | MAUsr2 |   11042024 |     130000 |       |
      | MAUsr2 |   11042024 |     133000 |       |
      | MAUsr2 |   11042024 |     133500 |       |
      | MAUsr2 |   11042024 |     140000 |       |
      | MAUsr2 |   11042024 |     141000 |       |
      | MAUsr2 |   11042024 |     143000 |       |
      | MAUsr2 |   11042024 |     143500 |       |
      | MAUsr2 |   11042024 |     150000 |       |
      | MAUsr2 |   11042024 |     150500 |       |
      | MAUsr2 |   11042024 |     153000 |       |
      | MAUsr2 |   11042024 |     153500 |       |
      | MAUsr2 |   11042024 |     180000 |       |
      | MAUsr2 |   12042024 |     090000 |       |
      | MAUsr2 |   12042024 |     093000 |       |
      | MAUsr2 |   12042024 |     093500 |       |
      | MAUsr2 |   12042024 |     095000 |       |
      | MAUsr2 |   12042024 |     095500 |       |
      | MAUsr2 |   12042024 |     100000 |       |
      | MAUsr2 |   12042024 |     101000 |       |
      | MAUsr2 |   12042024 |     110000 |       |
      | MAUsr2 |   12042024 |     110500 |       |
      | MAUsr2 |   12042024 |     123000 |       |
      | MAUsr2 |   12042024 |     123500 |       |
      | MAUsr2 |   12042024 |     130000 |       |
      | MAUsr2 |   16042024 |     090000 |       |
      | MAUsr2 |   30042024 |     093000 |       |
      | MAUsr2 |   30042024 |     100000 |       |
      | MAUsr2 |   30042024 |     101000 |       |
      | MAUsr2 |   30042024 |     110000 |       |
      | MAUsr2 |   30042024 |     111000 |       |
      | MAUsr2 |   30042024 |     123000 |       |
      | MAUsr2 |   30042024 |     123500 |       |
      | MAUsr2 |   30042024 |     130000 |       |
      | MAUsr2 |   30042024 |     131000 |       |
      | MAUsr2 |   30042024 |     140000 |       |
      | MAUsr2 |   30042024 |     141000 |       |
      | MAUsr2 |   30042024 |     180000 |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 11/04/2024 | 11/04/2024 | FI         |                     1 | 11/04/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 12/04/2024 | 12/04/2024 | FH         |                     1 | 12/04/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/04/2024 | 19/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/04/2024 | 20/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/04/2024 | 22/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 23/04/2024 | 24/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/04/2024 | 25/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/04/2024 | 27/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  4 | 11/04/2024 | 11/04/2024 | FI         |                     1 | 11/04/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  4 | 12/04/2024 | 12/04/2024 | FH         |                     1 | 12/04/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  1 | 17/04/2024 | 19/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 20/04/2024 | 20/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 22/04/2024 | 22/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 23/04/2024 | 24/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 25/04/2024 | 25/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/04/2024 | 27/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/04/2024 | 11/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/04/2024 | 12/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/04/2024 | 19/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/04/2024 | 20/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/04/2024 | 22/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 23/04/2024 | 24/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/04/2024 | 25/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/04/2024 | 27/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 11/04/2024 | 11/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 12/04/2024 | 12/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 17/04/2024 | 19/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 20/04/2024 | 20/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 22/04/2024 | 22/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 23/04/2024 | 24/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 25/04/2024 | 25/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/04/2024 | 27/04/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/04/2024 | 30/04/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Export Manage Attendance Data from Manage Attendance Page for "Multiple User"
      | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | Excel      |                   12 | false            |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01042024_to_30042024 | XLS        | Compared |

  @MACase10
  Scenario: Export Manage Attendance data for Multiple User -> Export Special Function Marking= false, File Format= CSV, 12 punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | WoAlwSinglSidLv | WoAlwBothSidLv | HldAlwSinglSidLv | HldAlwBothSidLv | Validation         |
      | FG      | FG        | Paid Leave          |           0.0 |        99.0 | Single App     |           |                 |                 |                 | true            | false          | true             | false           | Saved Successfully |
      | FH      | FH        | Hourly Paid Leave   |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
      | FI      | FI        | Hourly Unpaid Leave |               |             |                | 00:00     | 23:59           | 23:59           | true            |                 |                |                  |                 | Saved Successfully |
    And Create Tour
      | TourID | TourName | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | FJ     | FJ       |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "MALvGrp2" with Pro-rata "False"
      | LeaveID |
      | FG      |
      | FH      |
      | FI      |
      | FJ      |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | DailyAtdAuthReq | ExtraHrsChkwithAuthOTCOFJ | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | false           | true                      | false         | true                        | true                 |                       500 |                        2 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create Absentee Policy
      | PlcName  | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | MAAbPlc1 | true             | false            | false                     | true              | false             | false                      | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName  | DeviceSynced |
      | 26/04/2024 | 26/04/2024 | HolidayTest1 | False        |
      | 29/01/2024 | 29/01/2024 | HolidayTest2 | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   | MALvGrp2   | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAAbPlc1    | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | MAUsr1 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | April | 2024 |          | credit |        |
      | MAUsr1 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | April | 2024 |          | credit | 010:00 |
      | MAUsr2 |          0 |           0 |                 |                 |    6 |          |                | FG         |      0 | April | 2024 |          | credit |        |
      | MAUsr2 |          0 |           0 |                 |                 |      |          |                | FH         |      0 | April | 2024 |          | credit | 010:00 |
    And Set event via Event Set API
      | Userid | event-date | event-time | Spfid |
      | MAUsr1 |   03042024 |     090000 |       |
      | MAUsr1 |   03042024 |     100000 |       |
      | MAUsr1 |   03042024 |     101000 |       |
      | MAUsr1 |   03042024 |     110000 |       |
      | MAUsr1 |   03042024 |     110500 |       |
      | MAUsr1 |   03042024 |     123000 |       |
      | MAUsr1 |   03042024 |     123500 |       |
      | MAUsr1 |   03042024 |     130000 |       |
      | MAUsr1 |   03042024 |     131000 |       |
      | MAUsr1 |   03042024 |     140000 |       |
      | MAUsr1 |   03042024 |     141000 |       |
      | MAUsr1 |   03042024 |     175500 |     4 |
      | MAUsr1 |   04042024 |     094500 |       |
      | MAUsr1 |   04042024 |     100000 |       |
      | MAUsr1 |   04042024 |     101000 |       |
      | MAUsr1 |   04042024 |     110000 |       |
      | MAUsr1 |   04042024 |     110500 |       |
      | MAUsr1 |   04042024 |     123000 |       |
      | MAUsr1 |   04042024 |     123500 |       |
      | MAUsr1 |   04042024 |     130000 |       |
      | MAUsr1 |   04042024 |     131000 |       |
      | MAUsr1 |   04042024 |     140000 |       |
      | MAUsr1 |   04042024 |     141000 |       |
      | MAUsr1 |   04042024 |     180000 |       |
      | MAUsr1 |   05042024 |     092000 |     3 |
      | MAUsr1 |   05042024 |     100000 |       |
      | MAUsr1 |   05042024 |     101000 |       |
      | MAUsr1 |   05042024 |     110000 |       |
      | MAUsr1 |   05042024 |     110500 |       |
      | MAUsr1 |   05042024 |     123000 |       |
      | MAUsr1 |   05042024 |     123500 |       |
      | MAUsr1 |   05042024 |     130000 |       |
      | MAUsr1 |   05042024 |     131000 |       |
      | MAUsr1 |   05042024 |     140000 |       |
      | MAUsr1 |   05042024 |     141000 |       |
      | MAUsr1 |   05042024 |     182000 |       |
      | MAUsr1 |   06042024 |     094000 |     3 |
      | MAUsr1 |   06042024 |     100000 |       |
      | MAUsr1 |   06042024 |     101000 |       |
      | MAUsr1 |   06042024 |     110000 |       |
      | MAUsr1 |   06042024 |     110500 |       |
      | MAUsr1 |   06042024 |     123000 |       |
      | MAUsr1 |   06042024 |     123500 |       |
      | MAUsr1 |   06042024 |     130000 |       |
      | MAUsr1 |   06042024 |     131000 |       |
      | MAUsr1 |   06042024 |     140000 |       |
      | MAUsr1 |   06042024 |     141000 |       |
      | MAUsr1 |   06042024 |     184000 |       |
      | MAUsr1 |   08042024 |     091500 |       |
      | MAUsr1 |   08042024 |     100000 |       |
      | MAUsr1 |   08042024 |     101000 |       |
      | MAUsr1 |   08042024 |     110000 |       |
      | MAUsr1 |   08042024 |     110500 |       |
      | MAUsr1 |   08042024 |     123000 |       |
      | MAUsr1 |   08042024 |     123500 |       |
      | MAUsr1 |   08042024 |     130000 |       |
      | MAUsr1 |   08042024 |     131000 |       |
      | MAUsr1 |   08042024 |     140000 |       |
      | MAUsr1 |   08042024 |     141000 |       |
      | MAUsr1 |   08042024 |     180000 |       |
      | MAUsr1 |   09042024 |     090000 |       |
      | MAUsr1 |   09042024 |     100000 |       |
      | MAUsr1 |   09042024 |     101000 |       |
      | MAUsr1 |   09042024 |     110000 |       |
      | MAUsr1 |   09042024 |     110500 |       |
      | MAUsr1 |   09042024 |     123000 |       |
      | MAUsr1 |   09042024 |     123500 |       |
      | MAUsr1 |   09042024 |     130000 |       |
      | MAUsr1 |   09042024 |     131000 |       |
      | MAUsr1 |   09042024 |     140000 |       |
      | MAUsr1 |   09042024 |     141000 |       |
      | MAUsr1 |   09042024 |     190000 |       |
      | MAUsr1 |   10042024 |     090000 |       |
      | MAUsr1 |   10042024 |     100000 |       |
      | MAUsr1 |   10042024 |     101000 |       |
      | MAUsr1 |   10042024 |     110000 |       |
      | MAUsr1 |   10042024 |     110500 |       |
      | MAUsr1 |   10042024 |     123000 |       |
      | MAUsr1 |   10042024 |     123500 |       |
      | MAUsr1 |   10042024 |     130000 |       |
      | MAUsr1 |   10042024 |     131000 |       |
      | MAUsr1 |   10042024 |     140000 |       |
      | MAUsr1 |   10042024 |     141000 |       |
      | MAUsr1 |   10042024 |     170000 |       |
      | MAUsr1 |   11042024 |     130000 |       |
      | MAUsr1 |   11042024 |     133000 |       |
      | MAUsr1 |   11042024 |     133500 |       |
      | MAUsr1 |   11042024 |     140000 |       |
      | MAUsr1 |   11042024 |     141000 |       |
      | MAUsr1 |   11042024 |     143000 |       |
      | MAUsr1 |   11042024 |     143500 |       |
      | MAUsr1 |   11042024 |     150000 |       |
      | MAUsr1 |   11042024 |     150500 |       |
      | MAUsr1 |   11042024 |     153000 |       |
      | MAUsr1 |   11042024 |     153500 |       |
      | MAUsr1 |   11042024 |     180000 |       |
      | MAUsr1 |   12042024 |     090000 |       |
      | MAUsr1 |   12042024 |     093000 |       |
      | MAUsr1 |   12042024 |     093500 |       |
      | MAUsr1 |   12042024 |     095000 |       |
      | MAUsr1 |   12042024 |     095500 |       |
      | MAUsr1 |   12042024 |     100000 |       |
      | MAUsr1 |   12042024 |     101000 |       |
      | MAUsr1 |   12042024 |     110000 |       |
      | MAUsr1 |   12042024 |     110500 |       |
      | MAUsr1 |   12042024 |     123000 |       |
      | MAUsr1 |   12042024 |     123500 |       |
      | MAUsr1 |   12042024 |     130000 |       |
      | MAUsr1 |   16042024 |     090000 |       |
      | MAUsr1 |   30042024 |     093000 |       |
      | MAUsr1 |   30042024 |     100000 |       |
      | MAUsr1 |   30042024 |     101000 |       |
      | MAUsr1 |   30042024 |     110000 |       |
      | MAUsr1 |   30042024 |     111000 |       |
      | MAUsr1 |   30042024 |     123000 |       |
      | MAUsr1 |   30042024 |     123500 |       |
      | MAUsr1 |   30042024 |     130000 |       |
      | MAUsr1 |   30042024 |     131000 |       |
      | MAUsr1 |   30042024 |     140000 |       |
      | MAUsr1 |   30042024 |     141000 |       |
      | MAUsr1 |   30042024 |     180000 |       |
      | MAUsr2 |   03042024 |     090000 |       |
      | MAUsr2 |   03042024 |     100000 |       |
      | MAUsr2 |   03042024 |     101000 |       |
      | MAUsr2 |   03042024 |     110000 |       |
      | MAUsr2 |   03042024 |     110500 |       |
      | MAUsr2 |   03042024 |     123000 |       |
      | MAUsr2 |   03042024 |     123500 |       |
      | MAUsr2 |   03042024 |     130000 |       |
      | MAUsr2 |   03042024 |     131000 |       |
      | MAUsr2 |   03042024 |     140000 |       |
      | MAUsr2 |   03042024 |     141000 |       |
      | MAUsr2 |   03042024 |     175500 |     4 |
      | MAUsr2 |   04042024 |     094500 |       |
      | MAUsr2 |   04042024 |     100000 |       |
      | MAUsr2 |   04042024 |     101000 |       |
      | MAUsr2 |   04042024 |     110000 |       |
      | MAUsr2 |   04042024 |     110500 |       |
      | MAUsr2 |   04042024 |     123000 |       |
      | MAUsr2 |   04042024 |     123500 |       |
      | MAUsr2 |   04042024 |     130000 |       |
      | MAUsr2 |   04042024 |     131000 |       |
      | MAUsr2 |   04042024 |     140000 |       |
      | MAUsr2 |   04042024 |     141000 |       |
      | MAUsr2 |   04042024 |     180000 |       |
      | MAUsr2 |   05042024 |     092000 |     3 |
      | MAUsr2 |   05042024 |     100000 |       |
      | MAUsr2 |   05042024 |     101000 |       |
      | MAUsr2 |   05042024 |     110000 |       |
      | MAUsr2 |   05042024 |     110500 |       |
      | MAUsr2 |   05042024 |     123000 |       |
      | MAUsr2 |   05042024 |     123500 |       |
      | MAUsr2 |   05042024 |     130000 |       |
      | MAUsr2 |   05042024 |     131000 |       |
      | MAUsr2 |   05042024 |     140000 |       |
      | MAUsr2 |   05042024 |     141000 |       |
      | MAUsr2 |   05042024 |     182000 |       |
      | MAUsr2 |   06042024 |     094000 |     3 |
      | MAUsr2 |   06042024 |     100000 |       |
      | MAUsr2 |   06042024 |     101000 |       |
      | MAUsr2 |   06042024 |     110000 |       |
      | MAUsr2 |   06042024 |     110500 |       |
      | MAUsr2 |   06042024 |     123000 |       |
      | MAUsr2 |   06042024 |     123500 |       |
      | MAUsr2 |   06042024 |     130000 |       |
      | MAUsr2 |   06042024 |     131000 |       |
      | MAUsr2 |   06042024 |     140000 |       |
      | MAUsr2 |   06042024 |     141000 |       |
      | MAUsr2 |   06042024 |     184000 |       |
      | MAUsr2 |   08042024 |     091500 |       |
      | MAUsr2 |   08042024 |     100000 |       |
      | MAUsr2 |   08042024 |     101000 |       |
      | MAUsr2 |   08042024 |     110000 |       |
      | MAUsr2 |   08042024 |     110500 |       |
      | MAUsr2 |   08042024 |     123000 |       |
      | MAUsr2 |   08042024 |     123500 |       |
      | MAUsr2 |   08042024 |     130000 |       |
      | MAUsr2 |   08042024 |     131000 |       |
      | MAUsr2 |   08042024 |     140000 |       |
      | MAUsr2 |   08042024 |     141000 |       |
      | MAUsr2 |   08042024 |     180000 |       |
      | MAUsr2 |   09042024 |     090000 |       |
      | MAUsr2 |   09042024 |     100000 |       |
      | MAUsr2 |   09042024 |     101000 |       |
      | MAUsr2 |   09042024 |     110000 |       |
      | MAUsr2 |   09042024 |     110500 |       |
      | MAUsr2 |   09042024 |     123000 |       |
      | MAUsr2 |   09042024 |     123500 |       |
      | MAUsr2 |   09042024 |     130000 |       |
      | MAUsr2 |   09042024 |     131000 |       |
      | MAUsr2 |   09042024 |     140000 |       |
      | MAUsr2 |   09042024 |     141000 |       |
      | MAUsr2 |   09042024 |     190000 |       |
      | MAUsr2 |   10042024 |     090000 |       |
      | MAUsr2 |   10042024 |     100000 |       |
      | MAUsr2 |   10042024 |     101000 |       |
      | MAUsr2 |   10042024 |     110000 |       |
      | MAUsr2 |   10042024 |     110500 |       |
      | MAUsr2 |   10042024 |     123000 |       |
      | MAUsr2 |   10042024 |     123500 |       |
      | MAUsr2 |   10042024 |     130000 |       |
      | MAUsr2 |   10042024 |     131000 |       |
      | MAUsr2 |   10042024 |     140000 |       |
      | MAUsr2 |   10042024 |     141000 |       |
      | MAUsr2 |   10042024 |     170000 |       |
      | MAUsr2 |   11042024 |     130000 |       |
      | MAUsr2 |   11042024 |     133000 |       |
      | MAUsr2 |   11042024 |     133500 |       |
      | MAUsr2 |   11042024 |     140000 |       |
      | MAUsr2 |   11042024 |     141000 |       |
      | MAUsr2 |   11042024 |     143000 |       |
      | MAUsr2 |   11042024 |     143500 |       |
      | MAUsr2 |   11042024 |     150000 |       |
      | MAUsr2 |   11042024 |     150500 |       |
      | MAUsr2 |   11042024 |     153000 |       |
      | MAUsr2 |   11042024 |     153500 |       |
      | MAUsr2 |   11042024 |     180000 |       |
      | MAUsr2 |   12042024 |     090000 |       |
      | MAUsr2 |   12042024 |     093000 |       |
      | MAUsr2 |   12042024 |     093500 |       |
      | MAUsr2 |   12042024 |     095000 |       |
      | MAUsr2 |   12042024 |     095500 |       |
      | MAUsr2 |   12042024 |     100000 |       |
      | MAUsr2 |   12042024 |     101000 |       |
      | MAUsr2 |   12042024 |     110000 |       |
      | MAUsr2 |   12042024 |     110500 |       |
      | MAUsr2 |   12042024 |     123000 |       |
      | MAUsr2 |   12042024 |     123500 |       |
      | MAUsr2 |   12042024 |     130000 |       |
      | MAUsr2 |   16042024 |     090000 |       |
      | MAUsr2 |   30042024 |     093000 |       |
      | MAUsr2 |   30042024 |     100000 |       |
      | MAUsr2 |   30042024 |     101000 |       |
      | MAUsr2 |   30042024 |     110000 |       |
      | MAUsr2 |   30042024 |     111000 |       |
      | MAUsr2 |   30042024 |     123000 |       |
      | MAUsr2 |   30042024 |     123500 |       |
      | MAUsr2 |   30042024 |     130000 |       |
      | MAUsr2 |   30042024 |     131000 |       |
      | MAUsr2 |   30042024 |     140000 |       |
      | MAUsr2 |   30042024 |     141000 |       |
      | MAUsr2 |   30042024 |     180000 |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | MAUsr1 |                          1 | admin        |    1 |
      | MAUsr2 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | MAUsr1 |                  4 | 11/04/2024 | 11/04/2024 | FI         |                     1 | 11/04/2024      | 09:00             | 13:00           | MAUsr1    |
      | MAUsr1 |                  4 | 12/04/2024 | 12/04/2024 | FH         |                     1 | 12/04/2024      | 13:00             | 18:00           | MAUsr1    |
      | MAUsr1 |                  1 | 17/04/2024 | 19/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 20/04/2024 | 20/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 22/04/2024 | 22/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 23/04/2024 | 24/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 25/04/2024 | 25/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr1 |                  1 | 27/04/2024 | 27/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr1    |
      | MAUsr2 |                  4 | 11/04/2024 | 11/04/2024 | FI         |                     1 | 11/04/2024      | 09:00             | 13:00           | MAUsr2    |
      | MAUsr2 |                  4 | 12/04/2024 | 12/04/2024 | FH         |                     1 | 12/04/2024      | 13:00             | 18:00           | MAUsr2    |
      | MAUsr2 |                  1 | 17/04/2024 | 19/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 20/04/2024 | 20/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 22/04/2024 | 22/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 23/04/2024 | 24/04/2024 | FJ         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 25/04/2024 | 25/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
      | MAUsr2 |                  1 | 27/04/2024 | 27/04/2024 | FG         |                     1 |                 |                   |                 | MAUsr2    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 11/04/2024 | 11/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 12/04/2024 | 12/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 17/04/2024 | 19/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 20/04/2024 | 20/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 22/04/2024 | 22/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 23/04/2024 | 24/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 25/04/2024 | 25/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr1 | 27/04/2024 | 27/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 11/04/2024 | 11/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 12/04/2024 | 12/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 17/04/2024 | 19/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 20/04/2024 | 20/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 22/04/2024 | 22/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 23/04/2024 | 24/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 25/04/2024 | 25/04/2024 |
      |        1 | ApprovedRequest | sa    | MAUsr2 | 27/04/2024 | 27/04/2024 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    When User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/04/2024 | 30/04/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Export Manage Attendance Data from Manage Attendance Page for "Multiple User"
      | FileFormat | NumofPunchestoExport | ExportSpFMarking |
      | CSV        |                   12 | false            |
    Then Validate exported file from UI selection.
      | FileName                                 | FileFormat | Compare  |
      | AttendanceException_01042024_to_30042024 | CSV        | Compared |

  @MACase11
  Scenario Outline: Import Manage Attendance data for Single User, Attendance Correction In Closed Period= true in Attendance Policy, 12 Punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | true                      | false         | true                        | true                 |                       500 |                       30 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/032024  | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    When Import Data "Attendance Exception"
      | Attendance Date | User id | User Name | Shift | WO | PH | PUNCH1              | SPFID1 | PUNCH2              | SPFID2 | PUNCH3              | SPFID3 | PUNCH4              | SPFID4 | PUNCH5              | SPFID5 | PUNCH6              | SPFID6 | PUNCH7              | SPFID7 | PUNCH8              | SPFID8 | PUNCH9              | SPFID9 | PUNCH10             | SPFID10 | PUNCH11             | SPFID11 | PUNCH12             | SPFID12 | BREAKSTART | BREAKEND |
      | 03/03/2024      | MAUsr1  | MAUsr1    | AY    |  1 |  0 | 03/03/2024 09:00:00 |        | 03/03/2024 10:00:00 |        | 03/03/2024 10:10:00 |        | 03/03/2024 11:00:00 |        | 03/03/2024 11:05:00 |        | 03/03/2024	12:30:00 |        | 03/03/2024	12:35:00 |        | 03/03/2024 13:00:00 |        | 03/03/2024	13:10:00 |        | 03/03/2024 14:00:00 |         | 03/03/2024 14:10:00 |         | 03/03/2024 18:00:00 |         |            |          |
      | 04/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
    And Import "<File Format>" and check Imported Data for "Attendance Exception"
      | AttendanceDate | UserID | Success | ErrorDescription |
      | 03/03/2024     | MAUsr1 | Yes     |                  |
      | 04/03/2024     | MAUsr1 | Yes     |                  |
      | 05/03/2024     | MAUsr1 | Yes     |                  |
      | 06/03/2024     | MAUsr1 | Yes     |                  |
      | 07/03/2024     | MAUsr1 | Yes     |                  |
      | 08/03/2024     | MAUsr1 | Yes     |                  |
      | 09/03/2024     | MAUsr1 | Yes     |                  |
      | 11/03/2024     | MAUsr1 | Yes     |                  |
      | 12/03/2024     | MAUsr1 | Yes     |                  |
    Then Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     | 09:00    | 18:00    | WO       | WO       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     |                      |
      | 04/03/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 05/03/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:50      | 00:20      | 08:20    | 00:10       | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/03/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 09:00      | 00:40      | 08:20    | 00:10       | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/03/2024 | AY-Normal | 09:15    | 18:00    | PR       | PR       | 00:05   |           | 08:15      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 08/03/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 08:35    | 00:10       | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/03/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 09:00    | 00:10       | 01:00              | 01:00               |                      |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     |                      |
      | 12/03/2024 | AY-Normal | 09:00    | 13:00    | AB       | AB       |         |           | 03:30      |            | 03:30    | 00:05       |                    |                     | AB:Early-OUT         |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Validate Attendance Summary from Manage Attendance page for "Single User"
      | FromDate   | ToDate     | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      | 01/03/2024 | 31/03/2024 | MAUsr1 |       7 |     16 |     0 |    0 |        5 |       1 |           1 |        1 | 73:15      | 03:00      | 69:45          | 01:25       | 03:00               | 03:00              | 00:00             | 00:00               |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @MACase12
  Scenario Outline: Import Manage Attendance data for Multiple User, Attendance Correction In Closed Period= true in Attendance Policy, 12 Punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | true                      | false         | true                        | true                 |                      5000 |                       30 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    When Import Data "Attendance Exception"
      | Attendance Date | User id | User Name | Shift | WO | PH | PUNCH1              | SPFID1 | PUNCH2              | SPFID2 | PUNCH3              | SPFID3 | PUNCH4              | SPFID4 | PUNCH5              | SPFID5 | PUNCH6              | SPFID6 | PUNCH7              | SPFID7 | PUNCH8              | SPFID8 | PUNCH9              | SPFID9 | PUNCH10             | SPFID10 | PUNCH11             | SPFID11 | PUNCH12             | SPFID12 | BREAKSTART | BREAKEND |
      | 03/03/2024      | MAUsr1  | MAUsr1    | AY    |  1 |  0 | 03/03/2024 09:00:00 |        | 03/03/2024 10:00:00 |        | 03/03/2024 10:10:00 |        | 03/03/2024 11:00:00 |        | 03/03/2024 11:05:00 |        | 03/03/2024	12:30:00 |        | 03/03/2024	12:35:00 |        | 03/03/2024 13:00:00 |        | 03/03/2024	13:10:00 |        | 03/03/2024 14:00:00 |         | 03/03/2024 14:10:00 |         | 03/03/2024 18:00:00 |         |            |          |
      | 04/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
      | 04/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
    And Import "<File Format>" and check Imported Data for "Attendance Exception"
      | AttendanceDate | UserID | Success | ErrorDescription |
      | 03/03/2024     | MAUsr1 | Yes     |                  |
      | 04/03/2024     | MAUsr1 | Yes     |                  |
      | 05/03/2024     | MAUsr1 | Yes     |                  |
      | 06/03/2024     | MAUsr1 | Yes     |                  |
      | 07/03/2024     | MAUsr1 | Yes     |                  |
      | 08/03/2024     | MAUsr1 | Yes     |                  |
      | 09/03/2024     | MAUsr1 | Yes     |                  |
      | 11/03/2024     | MAUsr1 | Yes     |                  |
      | 12/03/2024     | MAUsr1 | Yes     |                  |
      | 04/03/2024     | MAUsr2 | Yes     |                  |
      | 05/03/2024     | MAUsr2 | Yes     |                  |
      | 06/03/2024     | MAUsr2 | Yes     |                  |
      | 07/03/2024     | MAUsr2 | Yes     |                  |
      | 08/03/2024     | MAUsr2 | Yes     |                  |
      | 09/03/2024     | MAUsr2 | Yes     |                  |
      | 11/03/2024     | MAUsr2 | Yes     |                  |
      | 12/03/2024     | MAUsr2 | Yes     |                  |
    Then Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     | 09:00    | 18:00    | WO       | WO       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     |                      |
      | 04/03/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 05/03/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:50      | 00:20      | 08:20    | 00:10       | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/03/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 09:00      | 00:40      | 08:20    | 00:10       | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/03/2024 | AY-Normal | 09:15    | 18:00    | PR       | PR       | 00:05   |           | 08:15      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 08/03/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 08:35    | 00:10       | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/03/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 09:00    | 00:10       | 01:00              | 01:00               |                      |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     |                      |
      | 12/03/2024 | AY-Normal | 09:00    | 13:00    | AB       | AB       |         |           | 03:30      |            | 03:30    | 00:05       |                    |                     | AB:Early-OUT         |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/032024  | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal | 09:00    | 17:55    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 05/03/2024 | AY-Normal | 09:20    | 18:20    | PR       | PR       |         |           | 08:50      | 00:20      | 08:20    | 00:10       | 00:20              | 00:20               | SHORT LEAVE          |
      | 06/03/2024 | AY-Normal | 09:40    | 18:40    | PR       | PR       |         |           | 09:00      | 00:40      | 08:20    | 00:10       | 00:40              | 00:40               | SHORT LEAVE          |
      | 07/03/2024 | AY-Normal | 09:15    | 18:00    | PR       | PR       | 00:05   |           | 08:15      |            | 08:00    | 00:10       |                    |                     | SHORT LEAVE          |
      | 08/03/2024 | AY-Normal | 09:45    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 08:35    | 00:10       | 01:00              | 01:00               | SHORT LEAVE          |
      | 09/03/2024 | AY-Normal | 09:00    | 19:00    | PR       | PR       |         |           | 09:20      | 01:00      | 09:00    | 00:10       | 01:00              | 01:00               |                      |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal | 09:00    | 18:00    | PR       | PR       |         |           | 08:20      |            | 08:00    | 00:10       |                    |                     |                      |
      | 12/03/2024 | AY-Normal | 09:00    | 13:00    | AB       | AB       |         |           | 03:30      |            | 03:30    | 00:05       |                    |                     | AB:Early-OUT         |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/032024  | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/03/2024 | 31/03/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Validate Attendance Exceptions from Manage Attendance page for multiple users
      | Present | No Punches Available | Punches Not In Pair | Less Work Hours | Unauthorized | Late-IN | Early-OUT | Absent Club/Cover Rule | Leave Club/Cover Rule | Short Leave Balance | Target Shortfall | Less Grace Count | Work Hours Limit |
      |      14 |                   30 |                   0 |               0 |            0 |       0 |         2 |                      0 |                     0 |                   0 |                0 |                0 |                0 |
    And User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/03/2024 | 31/03/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Validate Attendance Summary from Manage Attendance page for "Multiple User"
      | FromDate | ToDate | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      |          |        | MAUsr1 |       7 |     16 |     0 |    0 |        5 |       1 |           1 |        1 | 73:15      | 03:00      | 69:45          | 01:25       | 03:00               | 03:00              | 00:00             | 00:00               |
      |          |        | MAUsr2 |       7 |     16 |     0 |    0 |        5 |       1 |           1 |        1 | 64:55      | 03:00      | 61:45          | 01:15       | 03:00               | 03:00              | 00:00             | 00:00               |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @MACase13
  Scenario Outline: Import Manage Attendance data for Single User, Attendance Correction In Closed Period= false in Attendance Policy, 12 Punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | true                      | false         | false                       | true                 |                       500 |                       30 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Run Monthly Attendance Process with Close Attendance Period = "true" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
    And Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/032024  | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    When Import Data "Attendance Exception"
      | Attendance Date | User id | User Name | Shift | WO | PH | PUNCH1              | SPFID1 | PUNCH2              | SPFID2 | PUNCH3              | SPFID3 | PUNCH4              | SPFID4 | PUNCH5              | SPFID5 | PUNCH6              | SPFID6 | PUNCH7              | SPFID7 | PUNCH8              | SPFID8 | PUNCH9              | SPFID9 | PUNCH10             | SPFID10 | PUNCH11             | SPFID11 | PUNCH12             | SPFID12 | BREAKSTART | BREAKEND |
      | 03/03/2024      | MAUsr1  | MAUsr1    | AY    |  1 |  0 | 03/03/2024 09:00:00 |        | 03/03/2024 10:00:00 |        | 03/03/2024 10:10:00 |        | 03/03/2024 11:00:00 |        | 03/03/2024 11:05:00 |        | 03/03/2024	12:30:00 |        | 03/03/2024	12:35:00 |        | 03/03/2024 13:00:00 |        | 03/03/2024	13:10:00 |        | 03/03/2024 14:00:00 |         | 03/03/2024 14:10:00 |         | 03/03/2024 18:00:00 |         |            |          |
      | 04/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
    And Import "<File Format>" and check Imported Data for "Attendance Exception"
      | AttendanceDate | UserID | Success | ErrorDescription                     |
      | 03/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 04/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 05/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 06/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 07/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 08/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 09/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 11/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 12/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
    Then Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/032024  | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Validate Attendance Summary from Manage Attendance page for "Single User"
      | FromDate   | ToDate     | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      | 01/03/2024 | 31/03/2024 | MAUsr1 |       0 |     23 |     0 |    0 |        5 |       1 |           1 |        1 | 00:00      | 00:00      | 00:00          | 00:00       | 00:00               | 00:00              | 00:00             | 00:00               |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  @MACase14
  Scenario Outline: Import Manage Attendance data for Multiple User, Attendance Correction In Closed Period= false in Attendance Policy, 12 Punch user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
      | MAUsr3 |
    And Delete "AW" shift schedule
    And Delete "AW" shift
    And Delete "AX" shift
    And Delete "AY" shift
    And Delete Holiday Schedule
      | HSName |
      | MAHS1  |
    And Delete Overtime Policy from TnA module
      | Name  |
      | MAOT1 |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | DupPunchPrdMin | ExtraHrsChkwithAuthOTCOFF | AutoShiftCorr | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | LiCheckEnable | EoCheckEnable | AutoAtdCorrectLeave | AutoAtdCorrectOvertime | validation         |
      | MAAtdPlc1 |               12 |              1 | true                      | false         | false                       | true                 |                      5000 |                       30 | true                 |               1 |              90 | true                 | true               | True          | true          | true                |                        | Saved Successfully |
    And Create NetWork Hours Policy "MAOT1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | WklyMthlyOTCal | validation         |
      | MAOT1   | MAOT1          | True              | True               | True      | All     | true           | Daily 1    | true            |                | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "MAOT1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2+PunchFlag | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | Validation         |
      | AW      | Field Break |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AX      | Rest Day    |           |         |         |         |            |          |                     |                         |                          |                    |                       | Saved Successfully |
      | AY      | Normal      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | true                     | true               |                    10 | Saved Successfully |
    And Create Shift Schedule "AW" with Start Date "01/03/2024"
      | ShiftID | RepeatShiftDays |
      | AW      |               1 |
      | AX      |               1 |
      | AY      |              30 |
    And Create Holiday Schedule "MAHS1"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/03/2024 | 26/03/2024 | AutoTest    | False        |
    And Create user from user configuration
      | userid | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | OvertimePlc | ShiftSchedule | HolidaySchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | MAUsr1 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
      | MAUsr2 | True   |            | True      |                       12 | Only Overtime     | MAAtdPlc1     | MAOT1       | AW            | MAHS1           | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Run Monthly Attendance Process with Close Attendance Period = "true" for Month = "March" and Year = "2024"
      | UserID |
      | MAUsr1 |
      | MAUsr2 |
    And Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    When Import Data "Attendance Exception"
      | Attendance Date | User id | User Name | Shift | WO | PH | PUNCH1              | SPFID1 | PUNCH2              | SPFID2 | PUNCH3              | SPFID3 | PUNCH4              | SPFID4 | PUNCH5              | SPFID5 | PUNCH6              | SPFID6 | PUNCH7              | SPFID7 | PUNCH8              | SPFID8 | PUNCH9              | SPFID9 | PUNCH10             | SPFID10 | PUNCH11             | SPFID11 | PUNCH12             | SPFID12 | BREAKSTART | BREAKEND |
      | 03/03/2024      | MAUsr1  | MAUsr1    | AY    |  1 |  0 | 03/03/2024 09:00:00 |        | 03/03/2024 10:00:00 |        | 03/03/2024 10:10:00 |        | 03/03/2024 11:00:00 |        | 03/03/2024 11:05:00 |        | 03/03/2024	12:30:00 |        | 03/03/2024	12:35:00 |        | 03/03/2024 13:00:00 |        | 03/03/2024	13:10:00 |        | 03/03/2024 14:00:00 |         | 03/03/2024 14:10:00 |         | 03/03/2024 18:00:00 |         |            |          |
      | 04/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr1  | MAUsr1    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
      | 04/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 04/03/2024 09:00:00 |        | 04/03/2024 10:00:00 |        | 04/03/2024 10:10:00 |        | 04/03/2024 11:00:00 |        | 04/03/2024 11:05:00 |        | 04/03/2024	12:30:00 |        | 04/03/2024	12:35:00 |        | 04/03/2024 13:00:00 |        | 04/03/2024	13:10:00 |        | 04/03/2024 14:00:00 |         | 04/03/2024 14:10:00 |         | 04/03/2024 17:55:00 |       4 |            |          |
      | 05/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 05/03/2024 09:20:00 |      3 | 05/03/2024 10:00:00 |        | 05/03/2024 10:10:00 |        | 05/03/2024 11:00:00 |        | 05/03/2024 11:05:00 |        | 05/03/2024	12:30:00 |        | 05/03/2024	12:35:00 |        | 05/03/2024 13:00:00 |      4 | 05/03/2024	13:10:00 |        | 05/03/2024 14:00:00 |         | 05/03/2024 14:10:00 |         | 05/03/2024 18:20:00 |         |            |          |
      | 06/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 06/03/2024 09:40:00 |      3 | 06/03/2024 10:00:00 |        | 06/03/2024 10:10:00 |        | 06/03/2024 11:00:00 |        | 06/03/2024 11:05:00 |        | 06/03/2024	12:30:00 |        | 06/03/2024	12:35:00 |        | 06/03/2024 13:00:00 |        | 06/03/2024	13:10:00 |        | 06/03/2024 14:00:00 |         | 06/03/2024 14:10:00 |         | 06/03/2024 18:40:00 |         |            |          |
      | 07/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 07/03/2024 09:15:00 |        | 07/03/2024 10:00:00 |        | 07/03/2024 10:10:00 |        | 07/03/2024 11:00:00 |        | 07/03/2024 11:05:00 |        | 07/03/2024	12:30:00 |        | 07/03/2024	12:35:00 |        | 07/03/2024 13:00:00 |      4 | 07/03/2024	13:10:00 |        | 07/03/2024 14:00:00 |         | 07/03/2024 14:10:00 |         | 07/03/2024 18:00:00 |         |            |          |
      | 08/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 08/03/2024 09:45:00 |      3 | 08/03/2024 10:00:00 |        | 08/03/2024 10:10:00 |        | 08/03/2024 11:00:00 |        | 08/03/2024 11:05:00 |        | 08/03/2024	12:30:00 |        | 08/03/2024	12:35:00 |        | 08/03/2024 13:00:00 |        | 08/03/2024	13:10:00 |        | 08/03/2024 14:00:00 |         | 08/03/2024 14:10:00 |         | 08/03/2024 19:00:00 |         |            |          |
      | 09/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 09/03/2024 09:00:00 |        | 09/03/2024 10:00:00 |        | 09/03/2024 10:10:00 |        | 09/03/2024 11:00:00 |        | 09/03/2024 11:05:00 |        | 09/03/2024	12:30:00 |        | 09/03/2024	12:35:00 |        | 09/03/2024 13:00:00 |        | 09/03/2024	13:10:00 |        | 09/03/2024 14:00:00 |         | 09/03/2024 14:10:00 |         | 09/03/2024 19:00:00 |         |            |          |
      | 11/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 11/03/2024 09:00:00 |        | 11/03/2024 10:00:00 |        | 11/03/2024 10:10:00 |        | 11/03/2024 11:00:00 |        | 11/03/2024 11:05:00 |        | 11/03/2024	12:30:00 |        | 11/03/2024	12:35:00 |        | 11/03/2024 13:00:00 |        | 11/03/2024	13:10:00 |        | 11/03/2024 14:00:00 |         | 11/03/2024 14:10:00 |         | 11/03/2024 18:00:00 |         |            |          |
      | 12/03/2024      | MAUsr2  | MAUsr2    | AY    |  0 |  0 | 12/03/2024 09:00:00 |        | 12/03/2024 09:30:00 |        | 12/03/2024 09:35:00 |        | 12/03/2024 09:50:00 |        | 12/03/2024 09:55:00 |        | 12/03/2024	10:00:00 |        | 12/03/2024	10:10:00 |        | 12/03/2024 11:00:00 |        | 12/03/2024	11:05:00 |        | 12/03/2024 12:30:00 |         | 12/03/2024 12:35:00 |         | 12/03/2024 13:00:00 |         |            |          |
    And Import "<File Format>" and check Imported Data for "Attendance Exception"
      | AttendanceDate | UserID | Success | ErrorDescription                     |
      | 03/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 04/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 05/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 06/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 07/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 08/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 09/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 11/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 12/03/2024     | MAUsr1 | No      | Closed Period Data cannot be Edited. |
      | 04/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 05/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 06/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 07/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 08/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 09/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 11/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
      | 12/03/2024     | MAUsr2 | No      | Closed Period Data cannot be Edited. |
    Then Daily Attendance View for userid "MAUsr1" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And Daily Attendance View for userid "MAUsr2" and period "Month" on "March" and "2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Early-OUT | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark               |
      | 01/03/2024 | AW-Normal |          |          | FB       | FB       |         |           |            |            |          |             |                    |                     |                      |
      | 02/03/2024 | AX-Normal |          |          | RD       | RD       |         |           |            |            |          |             |                    |                     |                      |
      | 03/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 04/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 05/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 06/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 07/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 08/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 09/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 10/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 11/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 12/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 13/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 14/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 15/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 16/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 17/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 18/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 19/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 20/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 21/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 22/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 23/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 24/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
      | 25/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 26/03/2024 | AY-PH     |          |          | PH       | PH       |         |           |            |            |          |             |                    |                     |                      |
      | 27/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 28/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 29/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 30/03/2024 | AY-Normal |          |          | AB       | AB       |         |           |            |            |          |             |                    |                     | No Punches Available |
      | 31/03/2024 | AY-WO     |          |          | WO       | WO       |         |           |            |            |          |             |                    |                     |                      |
    And User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/03/2024 | 31/03/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Validate Attendance Exceptions from Manage Attendance page for multiple users
      | Present | No Punches Available | Punches Not In Pair | Less Work Hours | Unauthorized | Late-IN | Early-OUT | Absent Club/Cover Rule | Leave Club/Cover Rule | Short Leave Balance | Target Shortfall | Less Grace Count | Work Hours Limit |
      |       0 |                   46 |                   0 |               0 |            0 |       0 |         0 |                      0 |                     0 |                   0 |                0 |                0 |                0 |
    And User Selection for multiple user from Manage Attendance page
      | FromDate   | ToDate     | SelectUsers | SelectGroup | GroupName | UserID        |
      | 01/03/2024 | 31/03/2024 | User Wise   |             |           | MAUsr1,MAUsr2 |
    And Validate Attendance Summary from Manage Attendance page for "Multiple User"
      | UserID | Present | Absent | Leave | Tour | Week-Off | Holiday | Field Break | Rest Day | Work Hours | Extra Work | Net-Work Hours | Break Hours | Authorized Overtime | Generated Overtime | Hourly Paid Leave | Hourly Unpaid Leave |
      | MAUsr1 |       0 |     23 |     0 |    0 |        5 |       1 |           1 |        1 | 00:00      | 00:00      | 00:00          | 00:00       | 00:00               | 00:00              | 00:00             | 00:00               |
      | MAUsr2 |       0 |     23 |     0 |    0 |        5 |       1 |           1 |        1 | 00:00      | 00:00      | 00:00          | 00:00       | 00:00               | 00:00              | 00:00             | 00:00               |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |
