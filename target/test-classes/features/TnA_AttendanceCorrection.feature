@TnA
Feature: Attendance Correction
  I want to use this template for my feature file

  @TA_AtdCorrection1
  Scenario: Attendance Correction from SA for 2, 4, N-Punch User, Attendance Marking Type= Normal in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             |               |               | 18:00       |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             |               |               | 13:00       |             |               |               | 14:00       |             |               |               | 18:00       |             |               |               |                |              | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | SelectReason | CustomReason |
      |            | add    | 09:00   |            |              |              |
      |            | add    | 12:00   |            |              |              |
      |            | add    | 12:30   |            |              |              |
      |            | add    | 14:00   |            |              |              |
      |            | add    | 14:30   |            |              |              |
      |            | add    | 18:00   |            |              |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | ,,01:00           |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |

  @TA_AtdCorrection2
  Scenario: Attendance Correction from SA for 2 and 4 punch user, Attendance Marking Type= Normal in User Configu, Break Dev= true, DeductTypeFor2= Configured Break Dura, DeductTypeFor2+= Configured Break Dur
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Configured Break Duration | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 12:00          | 14:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 14:00       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 13:00       |             | 18:00       |             |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted WorkHours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | ,,01:00           |                     |                |                    |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 12:00,14:00,01:00 |                     |                |                    |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 12:00,14:00,01:00 |                     |                |                    |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                    |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |

  @TA_AtdCorrection3
  Scenario: Attendance Correction from SA for 2 and 4 Punch User, Attendance Marking Type= Normal in User Config, Break Deviation= false, DeductTypeFor2= Configured Break Dur, DeductTypeFor2+= Configured Break Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               | true                    | Configured Break Duration | true                     | Configured Break Duration | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 12:00          | 13:00        | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 13:00          | 14:00        | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 13:00          | 15:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 13:00       |             | 14:00       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 13:00       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 13:00       |             | 15:00       |             | 18:00       |             |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary      | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-INDuration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | ,,01:00           |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:00,15:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | AB-PR            |                     | AB:Break Early-OUT | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | PR-AB            |                     | AB:Break Late-IN   | Attendance Corrected | 08:00      | 01:00       | 13:00,15:00,01:00 |                     |                |                     |                  |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -4 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-3" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark             |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |                    |
      |   -2 | AM-Normal | 09:00    | 18:00    | AB       | PR       | 01:00       | AB:Break Early-OUT |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 01:00       | AB:Break Late-IN   |

  @TA_AtdCorrection4
  Scenario: Attendance Correction from SA for 2 and 4 punch user, Attendance Marking Type= Normal in User Config, Break Deviation= true, DeductTypeFor2= Actual Break Duration, DeductTypeFor2+= Actual Break Dur
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Actual Break Duration    | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 13:00          | 14:00        | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 12:00          | 13:30        | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 11:00          | 12:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 13:00       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 14:00       |             | 18:00       |             |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | Break Hours Details | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 09:00      |             |                     |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:30      | 01:30       | 12:00,13:30,01:30   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 01:00       | 11:00,12:00,01:00   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:00      | 02:00       | 12:00,14:00,02:00   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |             |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 01:30       |
      |   -4 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 02:00       |

  @TA_AtdCorrection5
  Scenario: Attendance Correction from SA for 2 and 4 Punch User, Attendance Marking Type= Normal, Break Deviation= false, DeductTypeFor2= Actual Break Duration, DeductTypeFor2+= Actual Break Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               | true                    | Actual Break Duration    | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 13:00          | 14:00        | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 13:30          | 14:30        | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | 12:30          | 14:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 12:30       |             | 13:30       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 13:00       |             | 14:30       |             | 18:00       |             |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 13:00       |             | 14:00       |             | 18:00       |             |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary      | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present            | Attendance Corrected | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:30,14:30,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-AB            |                     | AB:Less Work Hrs   | Attendance Corrected | 07:30      | 01:30       | 12:30,14:00,01:30 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | AB-PR            |                     | AB:Break Early-OUT | Attendance Corrected | 08:00      | 01:00       | 12:30,13:30,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-AB            |                     | AB:Less Work Hrs   | Attendance Corrected | 07:30      | 01:30       | 13:00,14:30,01:30 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | PR-PR            |                     | Present            | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark           |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |             |                  |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |                  |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |                  |
      |   -4 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 01:30       | AB:Less Work Hrs |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-3" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark             |
      |   -1 | AM-Normal | 09:00    | 18:00    | AB       | PR       | 01:00       | AB:Break Early-OUT |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 01:30       | AB:Less Work Hrs   |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 01:00       |                    |

  @TA_AtdCorrection6
  Scenario: Attendance Correction from SA for Attendance Marking Type= First Punch Only, Executive, Present configurations in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AtdMarkingType   | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | First Punch Only | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | Executive        | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | Present          | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 11:00       |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 11:00       |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -1 | AM-AM | Normal |                     |        | 11:00       |             | 14:00       |             |             |             |             |             | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | Attendance Corrected |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark     |
      |   -1 | AM-Normal | 09:00    |          | PR       | PR       |             |            |
      |   -2 | AM-Normal | 11:00    |          | AB       | PR       |             | AB:Late-IN |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours |
      |   -1 | AM-Normal | 11:00    |          | PR       | PR       |             |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark |
      |   -1 | AM-Normal | 11:00    | 14:00    | PR       | PR       |             |        |

  @TA_AtdCorrection7
  Scenario: Attendance Correction with Special Function and Reason from SA for 2 and 4 Punch User, Attendance Marking Type= Normal in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark               | Punch1-Time | SpFunction1     | CustomReason1 | Punch2-Time | SpFunction2       | CustomReason2 | Punch3-Time | SpFunction3 | CustomReason3 | Punch4-Time | SpFunction4       | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     | AttendanceCorrected1 | 10:00       | ShortLeave IN   | Medical1      | 17:00       | ShortLeave OUT    | Medical2      |             |             |               |             |                   |               | 13:00          | 14:00        | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     | AttendanceCorrected1 | 10:00       | Official IN     | HOVisit1      | 17:00       | Official OUT      | Official      |             |             |               |             |                   |               |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal |                     | AttendanceCorrected1 | 09:00       | Regular IN      | OfiiceINTime  | 18:00       | Regular OUT       | OfiiceOUTTime |             |             |               |             |                   |               |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal |                     | AttendanceCorrected1 | 10:00       | Late-IN Allowed | Test1         | 17:00       | Early-OUT Allowed | Test2         |             |             |               |             |                   |               |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     | AttendanceCorrected2 | 09:30       | ShortLeave IN   | Personal1     | 13:00       |                   | LunchBreakOUT | 14:00       |             | LunchBreakIN  | 17:15       | ShortLeave OUT    | Personal2     |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     | AttendanceCorrected2 | 10:00       | Official IN     | RnD2Visit1    | 13:00       |                   |               | 14:00       |             |               | 17:00       | Official OUT      | RnD2Visit1    |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal |                     | AttendanceCorrected2 | 09:00       | Regular IN      | OfiiceINTime  | 13:00       |                   |               | 14:00       |             |               | 18:00       | Overtime OUT      | OfiiceOUTTime |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -4 | AM-AM | Normal |                     | AttendanceCorrected2 | 10:00       | Late-IN Allowed | LI            | 13:00       |                   |               | 14:00       |             |               | 17:15       | Early-OUT Allowed | EO            |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected1 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected1 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | PR-PR            |                     | Present       | AttendanceCorrected1 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-PR            |                     | Present       | AttendanceCorrected1 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected2 | 08:00      |             | 13:00,14:00       |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected2 | 08:00      |             | 13:00,14:00       |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | PR-PR            |                     | Present       | AttendanceCorrected2 | 08:00      |             | 13:00,14:00       |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -4 | PR-PR            |                     | Present       | AttendanceCorrected2 | 08:00      |             | 13:00,14:00       |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark      |
      |   -1 | AM-Normal | 10:00    | 17:00    | PR       | PR       |             | SHORT LEAVE |
      |   -2 | AM-Normal | 10:00    | 17:00    | PR       | PR       |             | OFFICIAL    |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       |             |             |
      |   -4 | AM-Normal | 10:00    | 17:00    | PR       | PR       |             |             |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Break Hours | Remark      |
      |   -1 | AM-Normal | 09:30    | 17:15    | PR       | PR       |             | SHORT LEAVE |
      |   -2 | AM-Normal | 10:00    | 17:00    | PR       | PR       |             | OFFICIAL    |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       |             |             |
      |   -4 | AM-Normal | 10:00    | 17:15    | PR       | PR       |             |             |

  @TA_AtdCorrection8
  Scenario: Attendance Correction with Special Function and Reason from SA for N-Punch User, Attendance Marking Type= Normal in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur1" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction     | CustomReason  |
      |            | add    | 10:00   | ShortLeave IN  | Personal      |
      |            | add    | 12:00   |                |               |
      |            | add    | 13:00   |                |               |
      |            | add    | 14:00   | ShortLeave OUT | Personal      |
      |            | add    | 14:30   |                |               |
      |            | add    | 18:00   | Regular OUT    | OfficeOutTime |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur1" on AtdDate= "-2", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction   | CustomReason |
      |            | add    | 09:00   | Regular IN   | OfficeInTime |
      |            | add    | 12:00   | Official OUT | FieldVisit   |
      |            | add    | 12:30   |              |              |
      |            | add    | 14:00   |              |              |
      |            | add    | 15:00   | Official IN  |              |
      |            | add    | 18:00   |              |              |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur1" on AtdDate= "-3", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction        | CustomReason |
      |            | add    | 10:00   | Late-IN Allowed   | LateInAllow  |
      |            | add    | 12:00   |                   |              |
      |            | add    | 12:30   |                   |              |
      |            | add    | 14:00   |                   |              |
      |            | add    | 14:30   |                   |              |
      |            | add    | 17:00   | Early-OUT Allowed | ErlyOutAllow |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur1" on AtdDate= "-4", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction   | CustomReason |
      |            | add    | 08:00   | Overtime IN  | OTIn         |
      |            | add    | 12:00   |              |              |
      |            | add    | 12:30   |              |              |
      |            | add    | 14:00   |              |              |
      |            | add    | 14:30   |              |              |
      |            | add    | 19:00   | Overtime OUT | OTOut        |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 09:30      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected3 | 10:30      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | PR-PR            |                     | Present       | AttendanceCorrected3 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-PR            |                     | Present       | AttendanceCorrected3 | 11:00      |             |                   |                     |                |                     | 01:00             |                  |                    | 01:00             |                            |                              | 02:00               |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-4" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Remark      |
      |   -1 | AM-Normal | 10:00    | 18:00    | PR       | PR       | 08:00      |            | SHORT LEAVE |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 09:00      |            | OFFICIAL    |
      |   -3 | AM-Normal | 10:00    | 17:00    | PR       | PR       | 08:00      |            |             |
      |   -4 | AM-Normal | 08:00    | 19:00    | PR       | PR       | 10:00      | 02:00      |             |

  @TA_AtdCorrection9
  Scenario: Attendance Correction using - Manual Status Marking for 2, 4, N-Punch User, Attendance Marking Type= Normal in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | AtdCorr_Ur1 |         -1 |     090000 |
      | AtdCorr_Ur1 |         -1 |     180000 |
      | AtdCorr_Ur1 |         -2 |     090000 |
      | AtdCorr_Ur1 |         -2 |     180000 |
      | AtdCorr_Ur1 |         -3 |     090000 |
      | AtdCorr_Ur1 |         -3 |     180000 |
      | AtdCorr_Ur2 |         -1 |     090000 |
      | AtdCorr_Ur2 |         -1 |     130000 |
      | AtdCorr_Ur2 |         -1 |     140000 |
      | AtdCorr_Ur2 |         -1 |     180000 |
      | AtdCorr_Ur2 |         -2 |     090000 |
      | AtdCorr_Ur2 |         -2 |     130000 |
      | AtdCorr_Ur2 |         -2 |     140000 |
      | AtdCorr_Ur2 |         -2 |     180000 |
      | AtdCorr_Ur2 |         -3 |     090000 |
      | AtdCorr_Ur2 |         -3 |     130000 |
      | AtdCorr_Ur2 |         -3 |     140000 |
      | AtdCorr_Ur2 |         -3 |     180000 |
      | AtdCorr_Ur3 |         -1 |     090000 |
      | AtdCorr_Ur3 |         -1 |     130000 |
      | AtdCorr_Ur3 |         -1 |     133000 |
      | AtdCorr_Ur3 |         -1 |     150000 |
      | AtdCorr_Ur3 |         -1 |     153000 |
      | AtdCorr_Ur3 |         -1 |     180000 |
      | AtdCorr_Ur3 |         -2 |     090000 |
      | AtdCorr_Ur3 |         -2 |     130000 |
      | AtdCorr_Ur3 |         -2 |     133000 |
      | AtdCorr_Ur3 |         -2 |     150000 |
      | AtdCorr_Ur3 |         -2 |     153000 |
      | AtdCorr_Ur3 |         -2 |     180000 |
      | AtdCorr_Ur3 |         -3 |     090000 |
      | AtdCorr_Ur3 |         -3 |     130000 |
      | AtdCorr_Ur3 |         -3 |     133000 |
      | AtdCorr_Ur3 |         -3 |     150000 |
      | AtdCorr_Ur3 |         -3 |     153000 |
      | AtdCorr_Ur3 |         -3 |     180000 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark               | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary                 | Remark               | Work Hours | Break Hours | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-AB            | First Half Present  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -5 | AB-PR            | Second Half Present | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 | 08:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 | 08:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 | 08:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -4 | PR-AB            | First Half Present  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -5 | AB-PR            | Second Half Present | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 | 09:00      |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -4 | PR-AB            | First Half Present  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -5 | AB-PR            | Second Half Present | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal | 09:00    | 18:00    | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal | 09:00    | 18:00    | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
      |   -5 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal | 09:00    | 18:00    | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal | 09:00    | 18:00    | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
      |   -5 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal | 09:00    | 18:00    | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal | 09:00    | 18:00    | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
      |   -5 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |

  @TA_AtdCorrection10
  Scenario: Attendance Correction using - Manual Status Marking for Attendance Marking Type= First Punch Only, Executive, Present configurations in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AtdMarkingType   | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | First Punch Only | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | Executive        | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | Present          | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | AtdCorr_Ur1 |         -1 |     090000 |
      | AtdCorr_Ur1 |         -2 |     090000 |
      | AtdCorr_Ur1 |         -3 |     090000 |
      | AtdCorr_Ur2 |         -1 |     100000 |
      | AtdCorr_Ur2 |         -2 |     090000 |
      | AtdCorr_Ur2 |         -3 |     110000 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark               | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -1 | AM-AM | Normal | First Half Absent   | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -2 | AM-AM | Normal | Second Half Absent  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -3 | AM-AM | Normal | Full Day Absent     | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -4 | AM-AM | Normal | First Half Present  | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -5 | AM-AM | Normal | Second Half Present | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -6 | AM-AM | Normal | Full Day Present    | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -7 | AM-AM | Normal | Absent-Present      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur3 |             -8 | AM-AM | Normal | Present-Absent      | AttendanceCorrected1 |             |             |             |             |             |             |             |             | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary                 | Remark               | Work Hours | Break Hours | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -4 | PR-AB            | First Half Present  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -5 | AB-PR            | Second Half Present | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -4 | PR-AB            | First Half Present  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -5 | AB-PR            | Second Half Present | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | AB-PR            | First Half Absent   | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-AB            | Second Half Absent  | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -3 | AB-AB            | Full Day Absent     | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -4 | PR-PR            | First Half Present  |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -5 | PR-PR            | Second Half Present |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -6 | PR-PR            | Full Day Present    |                               | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -7 | AB-PR            | Absent-Present      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -8 | PR-AB            | Present-Absent      | Manual Absent/Present Marking | AttendanceCorrected1 |            |             |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal | 09:00    |          | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal | 09:00    |          | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal | 09:00    |          | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
      |   -5 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal | 10:00    |          | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal | 09:00    |          | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal | 11:00    |          | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
      |   -5 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-8" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      |   -1 | AM-Normal |     |          | AB       | PR       | Manual Absent/Present Marking |
      |   -2 | AM-Normal |     |          | PR       | AB       | Manual Absent/Present Marking |
      |   -3 | AM-Normal |     |          | AB       | AB       | Manual Absent/Present Marking |
      |   -4 | AM-Normal |          |          | PR       | PR       |  |
      |   -5 | AM-Normal |          |          | PR       | PR       |  |
      |   -6 | AM-Normal |          |          | PR       | PR       |                               |
      |   -7 | AM-Normal |          |          | AB       | PR       | Manual Absent/Present Marking |
      |   -8 | AM-Normal |          |          | PR       | AB       | Manual Absent/Present Marking |
 
  @TA_AtdCorrection11
  Scenario: Attendance Correction with Special Function and Reason from SA for Attendance Marking Type= First Punch Only, Executive, Present in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AtdMarkingType   | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | First Punch Only | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | Executive        | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | Present          | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark               | Punch1-Time | SpFunction1   | CustomReason1 | Punch2-Time | SpFunction2 | CustomReason2 | Punch3-Time | SpFunction3 | CustomReason3 | Punch4-Time | SpFunction4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     | AttendanceCorrected1 | 10:00       | ShortLeave IN | Personal      |             |             |               |             |             |               |             |             |               |                |              | Saved Successfully |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     | AttendanceCorrected1 | 08:00       | Overtime IN   | OTIN          |             |             |               |             |             |               |             |             |               |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     | AttendanceCorrected2 | 10:00       | ShortLeave IN | Personal      |             |             |               |             |             |               |             |             |               |                |              | Saved Successfully |
      | AtdCorr_Ur3 |             -1 | AM-AM | Normal |                     | AttendanceCorrected3 | 10:00       | Official IN   | HOVisit1      |             |             |               |             |             |               |             |             |               |                |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected1 |            |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected1 |            |             |                   |                     |                |                     | 01:00             |                  |                    |                   |                            |                              | 01:00               |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected2 |            |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 |            |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Extra Work |
      |   -1 | AM-Normal | 10:00    |          | PR       | PR       |            |
      |   -2 | AM-Normal | 08:00    |          | PR       | PR       | 01:00      |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 10:00    |          | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 10:00    |          | PR       | PR       |

  @TA_AtdCorrection12
  Scenario: Attendance Correction for 2, 4 and N-Punch User to check Overtime
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | AtdCorrOTPlc1 |
    And Create NetWork Hours Policy "AtdCorrNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName    | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AtdCorrOTPlc1 | AtdCorrNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AtdCorrOTPlc1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc   | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | Both              | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | Both              | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | Both              | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | CustomReason1 | Punch2-Time | SpFunction2  | CustomReason2 | Punch3-Time | SpFunction3 | CustomReason3 | Punch4-Time | SpFunction4  | CustomReason4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 08:00       | Overtime IN | OTIn          | 20:00       | Overtime OUT | OTOut         |             |             |               |             |              |               | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 08:00       | Overtime IN | OTIn          | 13:00       |              |               | 14:00       |             |               | 20:00       | Overtime OUT | OTOut         | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction   | CustomReason |
      |            | add    | 08:00   | Overtime IN  | OTIn         |
      |            | add    | 12:00   |              |              |
      |            | add    | 12:30   |              |              |
      |            | add    | 14:00   |              |              |
      |            | add    | 14:30   |              |              |
      |            | add    | 19:00   | Overtime OUT | OTOut        |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      |             |                   | 11:00               | 11:00          |                     | 01:00             |                  |                    | 02:00             |                            |                              | 03:00               |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 11:00      |             | 13:00,14:00       | 11:00               | 11:00          |                     | 01:00             |                  |                    | 02:00             |                            |                              | 03:00               |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 11:00      |             |                   | 10:00               | 10:00          |                     | 01:00             |                  |                    | 01:00             |                            |                              | 02:00               |
    And Verify Authorized Overtime
      | UserID      | AttendanceDate | OT1   | Authorized OT1 | OT2   | Authorized OT2 | OT3   | Authorized OT3 | OT4 | Authorized OT4 | OT5 | Authorized OT5 | Total Unauthorized Overtime | Total Authorized Overtime | Total Manual Credit | Total Manual Debit | Availed Overtime | Available Overtime |
      | AtdCorr_Ur1 |             -1 | 08:00 | 08:00          | 01:00 | 01:00          | 02:00 | 02:00          |     |                |     |                |                             | 11:00                     |                     |                    |                  | 11:00              |
      | AtdCorr_Ur2 |             -1 | 08:00 | 08:00          | 01:00 | 01:00          | 02:00 | 02:00          |     |                |     |                |                             | 11:00                     |                     |                    |                  | 11:00              |
      | AtdCorr_Ur3 |             -1 | 08:00 | 08:00          | 01:00 | 01:00          | 01:00 | 01:00          |     |                |     |                |                             | 10:00                     |                     |                    |                  | 10:00              |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Net-Work | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 08:00    | 20:00    | PR       | PR       | 12:00      | 03:00      | 11:00    | 11:00              | 11:00               |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Net-Work | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 08:00    | 20:00    | PR       | PR       | 11:00      | 03:00      | 11:00    | 11:00              | 11:00               |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Net-Work | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 08:00    | 19:00    | PR       | PR       | 10:00      | 02:00      | 10:00    | 10:00              | 10:00               |

  @TA_AtdCorrection13
  Scenario: Attendance Correction for 2, 4 and N-Punch User to check Late In and Early Out Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdCorrLI | True             |        30 |                          | Saved Successfully |
    And Create Early-Out Policy
      | Name      | EarlyOutApplicable | MaxEarlyOut | EnblRoundingForFracOfHrs | Validation         |
      | AtdCorrEO | True               |          30 |                          | Saved Successfully |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | AddBrkLIinTotalLI | AddBrkEOinTotalEO | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | false               | true              | true              | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             | AtdCorrLI | AtdCorrEO   |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             | AtdCorrLI | AtdCorrEO   |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 |             | AtdCorrLI | AtdCorrEO   |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | CustomReason1 | Punch2-Time | SpFunction2 | CustomReason2 | Punch3-Time | SpFunction3 | CustomReason3 | Punch4-Time | SpFunction4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:30       |             |               | 17:30       |             |               |             |             |               |             |             |               |                |              | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:10       |             |               | 12:50       |             |               | 14:10       |             |               | 17:50       |             |               |                |              | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | CustomReason |
      |            | add    | 09:10   |            |              |
      |            | add    | 12:50   |            |              |
      |            | add    | 13:00   |            |              |
      |            | add    | 14:10   |            |              |
      |            | add    | 14:30   |            |              |
      |            | add    | 17:50   |            |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails    | Early-OUT Duration | Early-OUTDetails  | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      |             |                   |                     |                |                     |                   | 00:30            | 00:30,,00:30      | 00:30              | 00:30,,00:30      |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:20      |             | 12:50,14:10       |                     |                |                     |                   | 00:20            | 00:10,00:10,00:20 | 00:20              | 00:10,00:10,00:20 |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present          | AttendanceCorrected3 | 08:40      |             |                   |                     |                |                     |                   | 00:10            | 00:10,,00:10      | 00:10              | 00:10,,00:10      |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours |
      |   -1 | AM-Normal | 09:30    | 17:30    | PR       | PR       | 00:30   | 08:00      |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Remark           |
      |   -1 | AM-Normal | 09:10    | 17:50    | PR       | AB       | 00:20   | 07:20      | AB:Less Work Hrs |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours |
      |   -1 | AM-Normal | 09:10    | 17:50    | PR       | PR       | 00:10   | 08:10      |

   @TA_AtdCorrection14
  Scenario: Attendance Correction for 2, 4 and N-Punch User to check Hourly Paid Leave Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay |AdLvHrsInWrkHrs| Validation         |
      | EX      | EX        | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true|Saved Successfully |
    And Create Leave Group "EXLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | EX      |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | LeaveGroup | AtdEnable | AttendancePlc  | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   | EXLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   | EXLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   | EXLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Credit_Debit_Encash Leave via API
      | userid      | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | AtdCorr_Ur1 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |     0 |    0 |          | credit | 006:00 |
      | AtdCorr_Ur1 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |    -1 |    0 |          | credit | 006:00 |
      | AtdCorr_Ur2 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |     0 |    0 |          | credit | 006:00 |
      | AtdCorr_Ur2 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |    -1 |    0 |          | credit | 006:00 |
      | AtdCorr_Ur3 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |     0 |    0 |          | credit | 006:00 |
      | AtdCorr_Ur3 |          0 |           0 |                 |                 |      |          |                | EX         |      0 |    -1 |    0 |          | credit | 006:00 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | AtdCorr_Ur1 |         -1 |     110000 |
      | AtdCorr_Ur1 |         -1 |     180000 |
      | AtdCorr_Ur2 |         -1 |     120000 |
      | AtdCorr_Ur2 |         -1 |     130000 |
      | AtdCorr_Ur2 |         -1 |     140000 |
      | AtdCorr_Ur2 |         -1 |     180000 |
      | AtdCorr_Ur3 |         -1 |     110000 |
      | AtdCorr_Ur3 |         -1 |     120000 |
      | AtdCorr_Ur3 |         -1 |     123000 |
      | AtdCorr_Ur3 |         -1 |     140000 |
      | AtdCorr_Ur3 |         -1 |     143000 |
      | AtdCorr_Ur3 |         -1 |     180000 |
    And Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Early-OUTDetails | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 07:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 05:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 07:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AtdCorr_Ur1 |                          1 | admin        |    1 |
      | AtdCorr_Ur2 |                          1 | admin        |    1 |
      | AtdCorr_Ur3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid      | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy   |
      | AtdCorr_Ur1 |                  4 |         -1 |       -1 | EX         |                     1 |              -1 | 09:00             | 11:00           | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |                  4 |         -1 |       -1 | EX         |                     1 |              -1 | 09:00             | 12:00           | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |                  4 |         -1 |       -1 | EX         |                     1 |              -1 | 09:00             | 11:00           | AtdCorr_Ur3 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid      | Start-date | end-date |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur1 |         -1 |       -1 |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur2 |         -1 |       -1 |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur3 |         -1 |       -1 |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Brea kHours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Early-OUTDetails | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present    | Attendance Corrected | 09:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   | 02:00                      |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present    | Attendance Corrected | 08:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   | 03:00                      |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present    | Attendance Corrected | 09:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   | 02:00                      |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark     |
      |   -1 | AM-Normal | 11:00    | 18:00    | PR       | PR       | 09:00      |  |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark     |
      |   -1 | AM-Normal | 12:00    | 18:00    | PR       | PR       | 08:00      |  |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark     |
      |   -1 | AM-Normal | 11:00    | 18:00    | PR       | PR       | 08:00      | |
  
   @TA_AtdCorrection15
  Scenario: Attendance Correction for 2, 4 and N-Punch User to check Hourly Unpaid Leave Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create Leave
      | LeaveID | LeaveName | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | EY      | EY        | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
    And Create Leave Group "EYLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | EY      |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | LeaveGroup | AtdEnable | AttendancePlc  | OvertimePlc | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   | EYLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   | EYLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   | EYLeaveGrp | True      | AtdCorrAtdPlc1 |             |           |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | AtdCorr_Ur1 |         -1 |     110000 |
      | AtdCorr_Ur1 |         -1 |     180000 |
      | AtdCorr_Ur2 |         -1 |     120000 |
      | AtdCorr_Ur2 |         -1 |     130000 |
      | AtdCorr_Ur2 |         -1 |     140000 |
      | AtdCorr_Ur2 |         -1 |     180000 |
      | AtdCorr_Ur3 |         -1 |     110000 |
      | AtdCorr_Ur3 |         -1 |     120000 |
      | AtdCorr_Ur3 |         -1 |     123000 |
      | AtdCorr_Ur3 |         -1 |     140000 |
      | AtdCorr_Ur3 |         -1 |     143000 |
      | AtdCorr_Ur3 |         -1 |     180000 |
    And Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Early-OUTDetails | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 07:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 05:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | AB-PR            |                     | AB:Late-IN    | Attendance Corrected | 07:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            |                              |                     |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | AtdCorr_Ur1 |                          1 | admin        |    1 |
      | AtdCorr_Ur2 |                          1 | admin        |    1 |
      | AtdCorr_Ur3 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid      | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy   |
      | AtdCorr_Ur1 |                  4 |         -1 |       -1 | EY         |                     1 |              -1 | 09:00             | 11:00           | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |                  4 |         -1 |       -1 | EY         |                     1 |              -1 | 09:00             | 12:00           | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |                  4 |         -1 |       -1 | EY         |                     1 |              -1 | 09:00             | 11:00           | AtdCorr_Ur3 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid      | Start-date | end-date |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur1 |         -1 |       -1 |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur2 |         -1 |       -1 |
      |        1 | ApprovedRequest | sa    | AtdCorr_Ur3 |         -1 |       -1 |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Early-OUTDetails | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 09:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            | 02:00                        |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            | 03:00                        |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 09:00      |             |                   |                     |                |                     |                   |                  |                |                    |                  |                   |                            | 02:00                        |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      |   -1 | AM-Normal | 11:00    | 18:00    | PR       | PR       | 09:00      |        |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      |   -1 | AM-Normal | 12:00    | 18:00    | PR       | PR       | 08:00      |        |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Remark |
      |   -1 | AM-Normal | 11:00    | 18:00    | PR       | PR       | 08:00      |        |
 
  @TA_AtdCorrection16
  Scenario: Attendance Correction from SA for 4 Punch User to edit break punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Actual Break Duration    | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakPunch1 | BreakStartTime | BreakPunch2 | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 18:00       |             |             |             |             |             | New Punch   | 12:00          | New Punch   | 13:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:00       |             | 13:00       |             | 14:00       |             | 18:00       |             |             |                |             |              | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 09:00       |             | 13:30       |             | 14:30       |             | 18:00       |             |             |                |             |              | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal |                     |        | 09:00       |             | 12:00       |             | 13:00       |             | 18:00       |             |             |                |             |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 13:30,14:30,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-3" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
      |   -2 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | BreakStartPunch | BreakStartTime | BreakEndPunch | BreakEndTime | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        |             |             |             |             |             |             |             |             | New Punch       | 11:00          | New Punch     | 12:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        |             |             |             |             |             |             |             |             | New Punch       | 11:00          | New Punch     | 12:00        | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        |             |             |             |             |             |             |             |             | Punch1-09:00    |                |               |              | Saved Successfully |
      | AtdCorr_Ur2 |             -3 | AM-AM | Normal |                     |        |             |             |             |             |             |             |             |             |                 |                | Punch2-12:00  |              | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 01:00       | 11:00,12:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 01:00       | 11:00,12:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | AB-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 03:30      | 04:30       | 09:00,13:30,04:30 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -3 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 05:00      | 03:00       | 09:00,12:00,03:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 08:00      | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-3" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark           |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 08:00      | 01:00       |                  |
      |   -2 | AM-Normal | 09:00    | 18:00    | AB       | AB       | 03:30      | 04:30       | AB:Less Work Hrs |
      |   -3 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 05:00      | 03:00       | AB:Less Work Hrs |

  @TA_AtdCorrection17
  Scenario: Attendance Correction for 2, 4 and N-Punch User to edit existing punches
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Set event via Event Set API
      | Userid      | event-date | event-time |
      | AtdCorr_Ur1 |         -1 |     090000 |
      | AtdCorr_Ur1 |         -1 |     180000 |
      | AtdCorr_Ur2 |         -1 |     090000 |
      | AtdCorr_Ur2 |         -1 |     130000 |
      | AtdCorr_Ur2 |         -1 |     140000 |
      | AtdCorr_Ur2 |         -1 |     180000 |
      | AtdCorr_Ur3 |         -1 |     090000 |
      | AtdCorr_Ur3 |         -1 |     130000 |
      | AtdCorr_Ur3 |         -1 |     133000 |
      | AtdCorr_Ur3 |         -1 |     150000 |
      | AtdCorr_Ur3 |         -1 |     151500 |
      | AtdCorr_Ur3 |         -1 |     160000 |
      | AtdCorr_Ur3 |         -1 |     161500 |
      | AtdCorr_Ur3 |         -1 |     180000 |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 08:00       |             |             |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 08:00       |             | 12:00       |             | 13:00       |             |             |             | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | CustomReason |
      | 09:00      | edit   | 08:00   |            |              |
      | 15:00      | edit   | 14:00   |            |              |
      | 15:15      | edit   | 14:30   |            |              |
      | 16:00      | delete |         |            |              |
      | 16:15      | delete |         |            |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 09:00      | 01:00       | ,,01:00           |                     |                |                     | 01:00             |                  |                    |                   |                            |                              | 01:00               |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 09:00      | 01:00       | 12:00,13:00,01:00 |                     |                |                     | 01:00             |                  |                    |                   |                            |                              | 01:00               |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 10:00      |             |                   |                     |                |                     | 01:00             |                  |                    |                   |                            |                              | 01:00               |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Break Hours |
      |   -1 | AM-Normal | 08:00    | 18:00    | PR       | PR       | 09:00      | 01:00      | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Break Hours |
      |   -1 | AM-Normal | 08:00    | 18:00    | PR       | PR       | 09:00      | 01:00      | 01:00       |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Extra Work | Break Hours |
      |   -1 | AM-Normal | 08:00    | 18:00    | PR       | PR       | 09:00      | 01:00      |             |

  @TA_AtdCorrection18
  Scenario: Attendance Correction for 2, 4 and N-Punch User using Reason dropdown
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Delete In/Out Reason
    	|Reason|
    	| Bank       |
    	| HOVisit    |
    	| BreakIn    |
    	| Medical    |
    	| FieldVisit |
    	| BreakOut   |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | Saved Successfully |
    And Create In/Out Reasons
      | Reason     | Type | Validation         |
      | Bank       | IN   | Saved Successfully |
      | HOVisit    | IN   | Saved Successfully |
      | BreakIn    | IN   | Saved Successfully |
      | Medical    | OUT  | Saved Successfully |
      | FieldVisit | OUT  | Saved Successfully |
      | BreakOut   | OUT  | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1   | SelectReason1 | Punch2-Time | SpFunction2    | SelectReason2 | Punch3-Time | SpFunction3 | SelectReason3 | Punch4-Time | SpFunction4  | SelectReason4 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 10:00       | ShortLeave IN | Bank          | 17:00       | ShortLeave OUT | Medical       |             |             |               |             |              |               | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 10:00       | Official IN   | HOVisit       | 13:00       |                | BreakOut      | 14:00       |             | BreakIn       | 17:00       | Official OUT | FieldVisit    | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction    | SelectReason | CustomReason |
      |            | add    | 10:00   | ShortLeave IN | Bank         |              |
      |            | add    | 12:00   |               |              |              |
      |            | add    | 12:30   |               |              |              |
      |            | add    | 14:00   |               |              |              |
      |            | add    | 14:30   |               |              |              |
      |            | add    | 17:00   | Official OUT  | FieldVisit   |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | ,,01:00           |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 08:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 09:00      |             |                   |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark      |
      |   -1 | AM-Normal | 10:00    | 17:00    | PR       | PR       | 08:00      | 01:00       | SHORT LEAVE |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark   |
      |   -1 | AM-Normal | 10:00    | 17:00    | PR       | PR       | 08:00      | 01:00       | OFFICIAL |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark      |
      |   -1 | AM-Normal | 10:00    | 17:00    | PR       | PR       | 08:00      |             | SHORT LEAVE |

  @TA_AtdCorrection19
  Scenario: Attendance Correction using Club Short Leave/Official with Break= true/false in Attendance Policy, (8 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | true                  | Saved Successfully |
      | AtdCorrAtdPlc2 |                2 | true                      | true                        | true                 |                           |                          | true                 |                 |                 | true                 | true               | false                 | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 |             |                   | AM            | True      | True      | True      | True               |                        8 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc2 |             |                   | AM            | True      | True      | True      | True               |                        8 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2    | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Punch5-Time | SpFunction5 | Punch6-Time | SpFunction6 | Punch7-Time | SpFunction7 | Punch8-Time | SpFunction8 | Validation         |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal | 09:00       |             | 13:00       | ShortLeave OUT | 14:00       |             | 15:00       |             | 15:30       |             | 16:00       |             | 16:30       |             | 18:00       |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal | 09:00       |             | 13:00       | ShortLeave OUT | 14:00       |             | 15:00       |             | 15:30       |             | 16:00       |             | 16:30       |             | 18:00       |             | Saved Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:00      | 01:00       | 13:00,14:00,01:00 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present          | Attendance Corrected | 08:00      | 00:30       | 15:00,15:30,00:30 |                     |                |                     |                   |                  |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark           |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | AB       | 07:00      | 01:00       | AB:Less Work Hrs |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Work Hours | Break Hours | Remark      |
      |   -1 | AM-Normal | 09:00    | 18:00    | PR       | PR       | 08:00      | 00:30       | SHORT LEAVE |

  @TA_AtdCorrection20
  Scenario: Attendance Correction for Adjusted Work Hours (2, 4, N-Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | AtdCorrOTPlc1 |
    And Create NetWork Hours Policy "AtdCorrNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Adjusted Work Hours     |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName    | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AtdCorrOTPlc1 | AtdCorrNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AtdCorrOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true             | true               | true                  | true                   |               2 | Saved Successfully |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdCorrLI | True             |        30 |                          | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc   | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 07:00       |             | 20:00       |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:20       |             | 18:00       |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 07:00       |             | 13:00       |             | 14:00       |             | 20:00       |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:20       |             | 13:00       |             | 14:00       |             | 18:00       |             | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-2", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | SelectReason | CustomReason |
      |            | add    | 07:00   |            |              |              |
      |            | add    | 14:00   |            |              |              |
      |            | add    | 15:00   |            |              |              |
      |            | add    | 20:00   |            |              |              |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | SelectReason | CustomReason |
      |            | add    | 09:20   |            |              |              |
      |            | add    | 14:00   |            |              |              |
      |            | add    | 15:00   |            |              |              |
      |            | add    | 18:00   |            |              |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present          | Attendance Corrected | 12:00      | 01:00       | ,,01:00           | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur1 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:40      | 01:00       | ,,01:00           |                     | 07:40          |                     |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present          | Attendance Corrected | 12:00      | 01:00       | 13:00,14:00,01:00 | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur2 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:40      | 01:00       | 13:00,14:00,01:00 |                     | 07:40          |                     |                   | 00:20            |                |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-PR            |                     | Present          | AttendanceCorrected3 | 13:00      |             |                   | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur3 |             -1 | PR-AB            |                     | AB:Less Work Hrs | AttendanceCorrected3 | 08:40      |             |                   |                     | 07:40          |                     |                   | 00:20            |                |                    |                   |                            |                              |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | ,,01:00           | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 07:40      | 01:00       | ,,01:00           |                     | 08:00          | 00:20               |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | 13:00,14:00,01:00 | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 07:40      | 01:00       | 13:00,14:00,01:00 |                     | 08:00          | 00:20               |                   | 00:20            |                |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected3 | 13:00      |             |                   | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 08:40      |             |                   |                     | 08:00          | 00:20               |                   | 00:20            |                |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    | 01:00       |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    | 01:00       |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    |             |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    |             | 04:00              | 04:00               |

      
      @TA_AtdCorrection21
  Scenario: Attendance Correction for Adjusted Work Hours2 (2, 4, N-Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Delete "AM" shift schedule
    And Delete "AM" shift
    And Delete Overtime Policy from TnA module
      | Name          |
      | AtdCorrOTPlc1 |
    And Create NetWork Hours Policy "AtdCorrNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Adjusted Work Hours     |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName    | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AtdCorrOTPlc1 | AtdCorrNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AtdCorrOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ExtraHrsChkwithAuthOTCOFF | AtdCorrectionInClosedPeriod | ShrtLvChkInAtdPeriod | MaxMinutesAlwdInAtdPeriod | MaxCountsAlwdInAtdPeriod | DurChkPerShrtLvEntry | MinDurPerShrtLv | MaxDurPerShrtLv | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | AutoAtdCorrectOvertime | PrevMonForOTHrs | validation         |
      | AtdCorrAtdPlc1 |                2 | true                      | true                        | true                 |                       240 |                        3 | true                 |              30 |              90 | true                 | true             | true               | true                  | true                   |               2 | Saved Successfully |
    And Create Late-In Policy
      | Name      | LateINApplicable | MaxLateIN | EnblRoundingForFracOfHrs | Validation         |
      | AtdCorrLI | True             |        30 |                          | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | DeductTypeFor2PunchFlag | DeductTypeFor2PunchValue  | DeductTypeFor2+PunchFlag | DeductTypeFor2+PunchValue | Validation         |
      | AM      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | true                    | Configured Break Duration | true                     | Actual Break Duration     | Saved Successfully |
    And Create Shift Schedule "AM" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AM      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AM"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid      | Active | ReportingGroup | AtdEnable | AttendancePlc  | OvertimePlc   | LateInPlc | EarlyOutPlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | AtdCorr_Ur1 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               |                        2 | Saved Successfully |
      | AtdCorr_Ur2 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               |                        4 | Saved Successfully |
      | AtdCorr_Ur3 | True   |                | True      | AtdCorrAtdPlc1 | AtdCorrOTPlc1 | AtdCorrLI |             | Only Overtime     | AM            | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    When Generate Attendance Correction from SA
      | UserID      | AttendanceDate | Shift | Day    | ManualStatusMarking | Remark | Punch1-Time | SpFunction1 | Punch2-Time | SpFunction2 | Punch3-Time | SpFunction3 | Punch4-Time | SpFunction4 | Validation         |
      | AtdCorr_Ur1 |             -2 | AM-AM | Normal |                     |        | 07:00       |             | 20:00       |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur1 |             -1 | AM-AM | Normal |                     |        | 09:20       |             | 18:00       |             |             |             |             |             | Saved Successfully |
      | AtdCorr_Ur2 |             -2 | AM-AM | Normal |                     |        | 07:00       |             | 13:00       |             | 14:00       |             | 20:00       |             | Saved Successfully |
      | AtdCorr_Ur2 |             -1 | AM-AM | Normal |                     |        | 09:20       |             | 13:00       |             | 14:00       |             | 18:00       |             | Saved Successfully |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-2", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | SelectReason | CustomReason |
      |            | add    | 07:00   |            |              |              |
      |            | add    | 14:00   |            |              |              |
      |            | add    | 15:00   |            |              |              |
      |            | add    | 20:00   |            |              |              |
    And Attendance Correction for N-Punch User from SA for UserID= "AtdCorr_Ur3" on AtdDate= "-1", Shift= "AM-AM", Day= "Normal" and Remark= "AttendanceCorrected3"
      | ActualTime | Action | NewTime | SpFunction | SelectReason | CustomReason |
      |            | add    | 09:20   |            |              |              |
      |            | add    | 14:00   |            |              |              |
      |            | add    | 15:00   |            |              |              |
      |            | add    | 18:00   |            |              |              |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary    | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present          | Attendance Corrected | 12:00      | 01:00       | ,,01:00           | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur1 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:40      | 01:00       | ,,01:00           |                     | 07:40          |                     |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present          | Attendance Corrected | 12:00      | 01:00       | 13:00,14:00,01:00 | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur2 |             -1 | PR-AB            |                     | AB:Less Work Hrs | Attendance Corrected | 07:40      | 01:00       | 13:00,14:00,01:00 |                     | 07:40          |                     |                   | 00:20            |                |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-PR            |                     | Present          | AttendanceCorrected3 | 13:00      |             |                   | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur3 |             -1 | PR-AB            |                     | AB:Less Work Hrs | AttendanceCorrected3 | 08:40      |             |                   |                     | 07:40          |                     |                   | 00:20            |                |                    |                   |                            |                              |                     |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID      |
      | AtdCorr_Ur1 |
      | AtdCorr_Ur2 |
      | AtdCorr_Ur3 |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | ,,01:00           | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur1 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 07:40      | 01:00       | ,,01:00           |                     | 08:00          | 00:20               |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | 13:00,14:00,01:00 | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur2 |             -1 | PR-PR            |                     | Present       | Attendance Corrected | 07:40      | 01:00       | 13:00,14:00,01:00 |                     | 08:00          | 00:20               |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected3 | 13:00      |             |                   | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur3 |             -1 | PR-PR            |                     | Present       | AttendanceCorrected3 | 08:40      |             |                   |                     | 08:00          | 00:20               |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    | 01:00       |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    | 01:00       |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | PR       | 00:20   | 07:40      |            | 08:00    |             |                    |                     |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    |             | 04:00              | 04:00               |
    When Delete Adjusted Work Hours from Attendance Correction page
      | UserID      | AttendanceDate | AdjustedWorkHours | Validation        |
      | AtdCorr_Ur1 |             -1 | 00:20             | Save Successfully |
      | AtdCorr_Ur2 |             -1 | 00:20             | Save Successfully |
      | AtdCorr_Ur3 |             -1 | 00:20             | Save Successfully |
    Then Verify attendance details from Attendance Correction page
      | UserID      | AttendanceDate | AttendanceStatus | ManualStatusMarking | StatusSummary | Remark               | Work Hours | Break Hours | BreakHoursDetails | Authorized Overtime | Net-Work Hours | Adjusted Work Hours | Early-IN Duration | Late-IN Duration | Late-INDetails | Early-OUT Duration | Overstay Duration | Hourly Paid Leave Duration | Hourly Unpaid Leave Duration | Extra Work Duration |
      | AtdCorr_Ur1 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | ,,01:00           | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur1 |             -1 | PR-AB            |                     | AB:Less Work Hrs       | Attendance Corrected | 07:40      | 01:00       | ,,01:00           |                     | 07:40          |                     |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur2 |             -2 | PR-PR            |                     | Present       | Attendance Corrected | 12:00      | 01:00       | 13:00,14:00,01:00 | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur2 |             -1 | PR-AB            |                     | AB:Less Work Hrs       | Attendance Corrected | 07:40      | 01:00       | 13:00,14:00,01:00 |                     | 07:40          |                     |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
      | AtdCorr_Ur3 |             -2 | PR-PR            |                     | Present       | AttendanceCorrected3 | 13:00      |             |                   | 04:00               | 12:00          |                     | 02:00             |                  |                |                    | 02:00             |                            |                              | 04:00               |
      | AtdCorr_Ur3 |             -1 | PR-AB            |                     | AB:Less Work Hrs       | AttendanceCorrected3 | 08:40      |             |                   |                     | 07:40          |                     |                   | 00:20            | 00:20,,00:20   |                    |                   |                            |                              |                     |
    And Daily Attendance View for userid "AtdCorr_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark           |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | AB       | 00:20   | 07:40      |            | 07:40    | 01:00       |                    |                     | AB:Less Work Hrs |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |                  |
    And Daily Attendance View for userid "AtdCorr_Ur2" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark           |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | AB       | 00:20   | 07:40      |            | 07:40    | 01:00       |                    |                     | AB:Less Work Hrs |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    | 01:00       | 04:00              | 04:00               |                  |
    And Daily Attendance View for userid "AtdCorr_Ur3" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Late-IN | Work Hours | Extra Work | Net-Work | Break Hours | Generated Overtime | Authorized Overtime | Remark           |
      |   -1 | AM-Normal | 09:20    | 18:00    | PR       | AB       | 00:20   | 07:40      |            | 07:40    |             |                    |                     | AB:Less Work Hrs |
      |   -2 | AM-Normal | 07:00    | 20:00    | PR       | PR       |         | 12:00      | 04:00      | 12:00    |             | 04:00              | 04:00               |                  |
      