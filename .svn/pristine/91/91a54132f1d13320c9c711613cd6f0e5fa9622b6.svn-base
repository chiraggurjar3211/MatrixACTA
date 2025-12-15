@T&A
Feature: Overtime/C-OFF Entry
  I want to use this template for my feature file

     @OTCOFFEntry1
  Scenario: Credit and Debit - OT1, OT2, OT3, OT4, OT5, C-OFF, OT/C-OFF Eligibility= Only C-OFF (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTCOFFEntry_U1 |
    And Delete "AK" shift schedule
    And Delete "AK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTCOFFEntry1 |
    And Create NetWork Hours Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTCOFFEntry1 | OTCOFFEntry1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | OTCOFFEntry1 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AK      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOFFEntry_U1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTCOFFEntry1 |           |             | OTCOFFEntry1 | True      | AK            | AK         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | OTCOFFEntry_U1 |         -1 |     070000 |
      | OTCOFFEntry_U1 |         -1 |     130000 |
      | OTCOFFEntry_U1 |         -1 |     140000 |
      | OTCOFFEntry_U1 |         -1 |     200000 |
    And Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
      | C-OFF     | Debit     | 01:00 | Saved Successfully |
      | OT1       | Credit    | 04:00 | Saved Successfully |
      | OT1       | Debit     | 01:00 | Saved Successfully |
      | OT2       | Credit    | 04:00 | Saved Successfully |
      | OT2       | Debit     | 01:00 | Saved Successfully |
      | OT3       | Credit    | 04:00 | Saved Successfully |
      | OT3       | Debit     | 01:00 | Saved Successfully |
      | OT4       | Credit    | 04:00 | Saved Successfully |
      | OT4       | Debit     | 01:00 | Saved Successfully |
      | OT5       | Credit    | 04:00 | Saved Successfully |
      | OT5       | Debit     | 01:00 | Saved Successfully |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Component | Processed | Authorized | Manual Credit | Manual Debit |
      | OT1       | 08:00     |  00:00     | 04:00         | 01:00        |
      | OT2       | 02:00     |  00:00    | 04:00         | 01:00        |
      | OT3       | 02:00     |      | 04:00         | 01:00        |
      | OT4       |           |            | 04:00         | 01:00        |
      | OT5       |           |            | 04:00         | 01:00        |
      | C-OFF     |           | 12:00           | 04:00         | 01:00        |
    And Verify Total OT/C-OFF Credit/Debit Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Date | TotalOTCredit | TotalOTDebit | TotalC-OFFCredit | TotalC-OFFDebit |
      |   -1 | 20:00         | 05:00        | 04:00            | 01:00           |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTCOFFEntry_U1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username        | password | Validation              |
      | OTCOFFEntry_U1 | admin    | Welcome OTCOFFEntry_U1 |
    And Verify Overtime Details from Attendance Details page in ESS for AtdDate= "-1"
	    | OT1   | Authorized OT1 | OT2   | Authorized OT2 | OT3   | Authorized OT3 | OT4 | Authorized OT4 | OT5 | Authorized OT5 | Total Unauthorized Overtime | Total Authorized Overtime | Total Manual Credit | Total Manual Debit | Availed Overtime | Available Overtime |
	    | 08:00 | 03:00         | 02:00 | 03:00         | 02:00 | 03:00         |     |  03:00        |     |  03:00        |                     | 15:00                   | 20:00             | 05:00            |                 |    15:00               |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Manual Credit | Manual Debit | Available |
      |   -1 | 12:00      | 04:00         | 01:00        | 15:00     |
      
  @OTCOFFEntry2
  Scenario: Credit and Debit - OT1, OT2, OT3, OT4, OT5, C-OFF, OT/C-OFF Eligibility= Only Overtime(4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTCOFFEntry_U1 |
    And Delete "AK" shift schedule
    And Delete "AK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTCOFFEntry1 |
    And Create NetWork Hours Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTCOFFEntry1 | OTCOFFEntry1   | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | OTCOFFEntry1 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AK      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOFFEntry_U1 | True   | True      |                        4 | Only Overtime     |              |               |             | OTCOFFEntry1 |           |             | OTCOFFEntry1 | True      | AK            | AK         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | OTCOFFEntry_U1 |         -1 |     070000 |
      | OTCOFFEntry_U1 |         -1 |     130000 |
      | OTCOFFEntry_U1 |         -1 |     140000 |
      | OTCOFFEntry_U1 |         -1 |     200000 |
    Then Daily Attendance View for userid "OTCOFFEntry_U1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              | 12:00               |
    When Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
      | C-OFF     | Debit     | 01:00 | Saved Successfully |
      | OT1       | Credit    | 04:00 | Saved Successfully |
      | OT1       | Debit     | 01:00 | Saved Successfully |
      | OT2       | Credit    | 04:00 | Saved Successfully |
      | OT2       | Debit     | 01:00 | Saved Successfully |
      | OT3       | Credit    | 04:00 | Saved Successfully |
      | OT3       | Debit     | 01:00 | Saved Successfully |
      | OT4       | Credit    | 04:00 | Saved Successfully |
      | OT4       | Debit     | 01:00 | Saved Successfully |
      | OT5       | Credit    | 04:00 | Saved Successfully |
      | OT5       | Debit     | 01:00 | Saved Successfully |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Component | Processed | Authorized | Manual Credit | Manual Debit |
      | OT1       | 08:00     | 08:00      | 04:00         | 01:00        |
      | OT2       | 02:00     | 02:00      | 04:00         | 01:00        |
      | OT3       | 02:00     | 02:00      | 04:00         | 01:00        |
      | OT4       |           |            | 04:00         | 01:00        |
      | OT5       |           |            | 04:00         | 01:00        |
      | C-OFF     |           |            | 04:00         | 01:00        |
    And Verify Total OT/C-OFF Credit/Debit Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Date | TotalOTCredit | TotalOTDebit | TotalC-OFFCredit | TotalC-OFFDebit |
      |   -1 | 20:00           | 05:00          | 04:00              | 01:00             |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTCOFFEntry_U1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username        | password | Validation              |
      | OTCOFFEntry_U1 | admin    | Welcome OTCOFFEntry_U1 |
    And Verify Overtime Details from Attendance Details page in ESS for AtdDate= "-1"
	    | OT1   | Authorized OT1 | OT2   | Authorized OT2 | OT3   | Authorized OT3 | OT4 | Authorized OT4 | OT5 | Authorized OT5 | Total Unauthorized Overtime | Total Authorized Overtime | Total Manual Credit | Total Manual Debit | Availed Overtime | Available Overtime |
	    | 08:00 | 11:00         | 02:00 | 05:00         | 02:00 | 05:00         |     |  03:00        |     |     03:00     |                     | 27:00                   | 20:00             | 05:00            |                 | 27:00             |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Manual Credit | Manual Debit | Available |
      |   -1 |            | 04:00         | 01:00        | 03:00     |
   
   
 @OTCOFFEntry3
  Scenario: Credit and Debit - OT1, OT2, OT3, OT4, OT5, C-OFF, OT/C-OFF Eligibility= Both (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID          |
      | OTCOFFEntry_U1 |
    And Delete "AK" shift schedule
    And Delete "AK" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTCOFFEntry1 |
    And Create NetWork Hours Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTCOFFEntry1 | OTCOFFEntry1   | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTCOFFEntry1"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | OTCOFFEntry1 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AK      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AK" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AK      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AK"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid          | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | OTCOFFEntry_U1 | True   | True      |                        4 | Both              |              |               |             | OTCOFFEntry1 |           |             | OTCOFFEntry1 | True      | AK            | AK         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID          |
      | OTCOFFEntry_U1 |
    When Set event via Event Set API
      | Userid          | event-date | event-time |
      | OTCOFFEntry_U1 |         -1 |     070000 |
      | OTCOFFEntry_U1 |         -1 |     130000 |
      | OTCOFFEntry_U1 |         -1 |     140000 |
      | OTCOFFEntry_U1 |         -1 |     200000 |
    Then Daily Attendance View for userid "OTCOFFEntry_U1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Overtime/C-OFF Authorization for "Single Record" and Period "Daily" from SA on "-1" and "0"
      | UserID          | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | OTCOFFEntry_U1 |   -1 | OT1    | 08:00   | 005:00   | 003:00     | Saved Successfully |
      | OTCOFFEntry_U1 |   -1 | OT2    | 02:00   | 001:00   | 001:00     | Saved Successfully |
      | OTCOFFEntry_U1 |   -1 | OT3    | 02:00   | 001:00   | 001:00     | Saved Successfully |
    And Validate Overtime/C-OFF Application from SA for Period "Daily" on "-1" and "0"
      | PanelName  | UserID          | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | OTCOFFEntry_U1 |   -1 | OT1    | 08:00   | 05:00    | 03:00      | Authorized |
      | Authorized | OTCOFFEntry_U1 |   -1 | OT2    | 02:00   | 01:00    | 01:00      | Authorized |
      | Authorized | OTCOFFEntry_U1 |   -1 | OT3    | 02:00   | 01:00    | 01:00      | Authorized |
    When Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" on AtdDate= "-1"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
      | C-OFF     | Debit     | 01:00 | Saved Successfully |
      | OT1       | Credit    | 04:00 | Saved Successfully |
      | OT1       | Debit     | 01:00 | Saved Successfully |
      | OT2       | Credit    | 04:00 | Saved Successfully |
      | OT2       | Debit     | 01:00 | Saved Successfully |
      | OT3       | Credit    | 04:00 | Saved Successfully |
      | OT3       | Debit     | 01:00 | Saved Successfully |
      | OT4       | Credit    | 04:00 | Saved Successfully |
      | OT4       | Debit     | 01:00 | Saved Successfully |
      | OT5       | Credit    | 04:00 | Saved Successfully |
      | OT5       | Debit     | 01:00 | Saved Successfully |
    Then Verify Manual Overtime/C-OFF Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Component | Processed | Authorized | Manual Credit | Manual Debit |
      | OT1       | 08:00     | 05:00      | 04:00         | 01:00        |
      | OT2       | 02:00     | 01:00      | 04:00         | 01:00        |
      | OT3       | 02:00     | 01:00      | 04:00         | 01:00        |
      | OT4       |           |            | 04:00         | 01:00        |
      | OT5       |           |            | 04:00         | 01:00        |
      | C-OFF     |           | 05:00      | 04:00         | 01:00        |
    And Verify Total OT/C-OFF Credit/Debit Entry for UserID= "OTCOFFEntry_U1" and AtdDate= "-1"
      | Date | TotalOTCredit | TotalOTDebit | TotalC-OFFCredit | TotalC-OFFDebit |
      |   -1 | 20:00         | 05:00        | 04:00            | 01:00           |
    And Set Password via API
      | Userid          | user-verified-for-password | new-password | type |
      | OTCOFFEntry_U1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username        | password | Validation              |
      | OTCOFFEntry_U1 | admin    | Welcome OTCOFFEntry_U1 |
    And Verify Overtime Details from Attendance Details page in ESS for AtdDate= "-1"
	    | OT1   | Authorized OT1 | OT2   | Authorized OT2 | OT3   | Authorized OT3 | OT4 | Authorized OT4 | OT5 | Authorized OT5 | Total Unauthorized Overtime | Total Authorized Overtime | Total Manual Credit | Total Manual Debit | Availed Overtime | Available Overtime |
	    | 08:00 | 08:00         | 02:00 | 04:00         | 02:00 | 04:00         |     |    03:00      |     |  03:00     |                     | 22:00                   | 20:00             | 05:00            |                 | 22:00             |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Manual Credit | Manual Debit | Available |
      |   -1 | 05:00      | 04:00         | 01:00        | 08:00     |