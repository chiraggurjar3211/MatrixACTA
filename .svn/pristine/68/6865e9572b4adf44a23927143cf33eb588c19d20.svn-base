@T&A
Feature: Daily Attendance Process
  I want to use this template for my feature file

  @TA_DAP1
  Scenario: Daily Attendance Process -> Attendance Marking Type changed in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AtdMarkingType | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |                | True      | Normal         |               |             |                   | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |         -1 |     090000 |
      | DAP_Ur1 |          0 |     080000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
      |    0 | 08:00    |          | IN       |  __      |
    When Create user from user configuration
      | userid  | Active | AtdMarkingType   |  Validation         |
      | DAP_Ur1 | True   | First Punch Only | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | IN       | AB       |
      |    0 | 08:00    |          | IN       | __      |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-7" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | 09:00    |          | PR       | PR       |
      |    0 | 08:00    |          | PR       | PR       |
  

  @TA_DAP2
  Scenario: Daily Attendance Process -> Auto Authorize Overtime Component= false then true in Overtime Policy
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Delete Overtime Policy from TnA module
      | Name      |
      | DAPOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "DAPOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | DAPOTPlc1 | DAPOTPlc1      | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "DAPOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | AtdMarkingType | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |                | True      |                |               | DAPOTPlc1   | Only Overtime     | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |         -1 |     080000 |
      | DAP_Ur1 |         -1 |     200000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              |                     |
    When Create Overtime Policy
      | PlcName   | NetWorkPlcName|DailyAutoAuthOT | validation         |
      | DAPOTPlc1 | DAPOTPlc1|true            | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              |                     |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-2" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              | 03:00               |
  
  	@TA_DAP3
  Scenario: Do Daily Attendance Process after OT/C-OFF Eligibility= Only Overtime change to Only C-OFF in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Delete Overtime Policy from TnA module
      | Name      |
      | DAPOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "DAPOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
      | Overstay      |      0000 |    0200 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | DAPOTPlc1 | DAPOTPlc1      | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "DAPOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName     | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | DAPCOffPlc1 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | OtCoffEligibility | AttendancePlc | OvertimePlc | CoffPlc     | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |                | True      | Only Overtime     |               | DAPOTPlc1   | DAPCOffPlc1 | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |         -1 |     080000 |
      | DAP_Ur1 |         -1 |     200000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              | 03:00               |
    When Create user from user configuration
      | userid  |  OtCoffEligibility | Validation         |
      | DAP_Ur1 |  Only C-OFF        | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              | 03:00               |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-2" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 08:00    | 20:00    | 03:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "DAP_Ur1"
      | Date | Authorized | Available |
      |   -1 | 03:00      | 03:00     |
  
   @TA_DAP4
  Scenario: Daily Attendance Process -> Shift Schedule Changed in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AV" shift schedule
    And Delete "AU" shift
    And Delete "AV" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 06:00     | 14:00   | 04:00   | 08:00   | 10:00      | 11:00    | Saved Successfully |
      | AV      | 14:00     | 22:00   | 04:00   | 08:00   | 16:00      | 17:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Create Shift Schedule "AV" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AV      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Configure Off Day Configuration in Shift Schedule "AV"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | OtCoffEligibility | AttendancePlc | OvertimePlc | CoffPlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |                | True      |                   |               |             |         | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |         -1 |     060000 |
      | DAP_Ur1 |         -1 |     140000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AU-Normal | 06:00    | 14:00    | PR       | PR       |
    When Create user from user configuration
      | userid  | Active | ShiftSchedule |  Validation         |
      | DAP_Ur1 | True   |  AV            | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AU-Normal | 06:00    | 14:00    | PR       | PR       |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-2" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      |   -1 | AV-Normal | 06:00    | 14:00    | PR       | AB       |
 

   @TA_DAP5
  Scenario: Daily Attendance Process -> Shift Changed in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AV" shift schedule
    And Delete "AU" shift
    And Delete "AV" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 06:00     | 14:00   | 04:00   | 08:00   | 10:00      | 11:00    | Saved Successfully |
      | AV      | 14:00     | 22:00   | 04:00   | 08:00   | 16:00      | 17:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
      | AV      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid  | Active | ReportingGroup | AtdEnable | OtCoffEligibility | AttendancePlc | OvertimePlc | CoffPlc | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |                | True      |                   |               |             |         | AU            | AU         | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |   02042024 |     060000 |
      | DAP_Ur1 |   02042024 |     140000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "03/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 02/04/2024 | AU-Normal | 06:00    | 14:00    | PR       | PR       |
    When Create user from user configuration
      | userid  | Active | ShiftSchedule | StartShift | Validation         |
      | DAP_Ur1 | True   | AU            | AV         | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "03/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 02/04/2024 | AU-Normal | 06:00    | 14:00    | PR       | PR       |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "01/04/2024" To "30/04/2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "02/04/2024" and "02/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 02/04/2024 | AV-Normal | 06:00    | 14:00    | PR       | AB       |
   
 @TA_DAP6
  Scenario: Daily Attendance Process -> Add Week Off Group in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Delete Week off group
      | WOName |
      | DAPWO1 |
    And Create Week Off Group
      | WOName | OffDay1 | OffDay2  | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | DAPWO1 | Sunday  | Saturday | ALL            |                 |               | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/04/2024"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName   | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | DAPAbPlc1 | true             | True             | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | WeekOffGroup | AtdEnable | OtCoffEligibility | AttendancePlc | AbsenteePlc | CoffPlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |              | True      |                   |               | DAPAbPlc1   |         | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | 1st Half | 2nd Half |
      | 06/04/2024 | AU-Normal | AB       | AB       |
      | 07/04/2024 | AU-Normal | AB       | AB       |
      | 13/04/2024 | AU-Normal | AB       | AB       |
      | 14/04/2024 | AU-Normal | AB       | AB       |
      | 20/04/2024 | AU-Normal | AB       | AB       |
      | 21/04/2024 | AU-Normal | AB       | AB       |
      | 27/04/2024 | AU-Normal | AB       | AB       |
      | 28/04/2024 | AU-Normal | AB       | AB       |
    When Create user from user configuration
      | userid  | Active | WeekOffGroup |  Validation         |
      | DAP_Ur1 | True   | DAPWO1       |  Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | 1st Half | 2nd Half |
      | 06/04/2024 | AU-Normal | AB       | AB       |
      | 07/04/2024 | AU-Normal | AB       | AB       |
      | 13/04/2024 | AU-Normal | AB       | AB       |
      | 14/04/2024 | AU-Normal | AB       | AB       |
      | 20/04/2024 | AU-Normal | AB       | AB       |
      | 21/04/2024 | AU-Normal | AB       | AB       |
      | 27/04/2024 | AU-Normal | AB       | AB       |
      | 28/04/2024 | AU-Normal | AB       | AB       |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "01/04/2024" To "30/04/2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift | 1st Half | 2nd Half |
      | 06/04/2024 | AU-WO | WO       | WO       |
      | 07/04/2024 | AU-WO | WO       | WO       |
      | 13/04/2024 | AU-WO | WO       | WO       |
      | 14/04/2024 | AU-WO | WO       | WO       |
      | 20/04/2024 | AU-WO | WO       | WO       |
      | 21/04/2024 | AU-WO | WO       | WO       |
      | 27/04/2024 | AU-WO | WO       | WO       |
      | 28/04/2024 | AU-WO | WO       | WO       |
      
 @TA_DAP7
  Scenario: Daily Attendance Process -> Add Holiday Schedule in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Delete Holiday Schedule
      | HSName |
      | DAPHS1 |
    And Create Holiday Schedule "DAPHS1"
      | FromDate | ToDate | HolidayName  | DeviceSynced |
      |       -1 |     -1 | HolidayTest1 | False        |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create Absentee Policy
      | PlcName   | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | DAPAbPlc1 | false            | false            | false                     | true              | true              | false                      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | WeekOffGroup | AtdEnable | OtCoffEligibility | AttendancePlc | AbsenteePlc | CoffPlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |              | True      |                   |               | DAPAbPlc1   |         | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | 1st Half | 2nd Half |
      |   -1 | AU-Normal | AB       | AB       |
    When Create user from user configuration
      | userid  | Active |  HolidaySchedule |  Validation         |
      | DAP_Ur1 | True   |   DAPHS1          |  Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | 1st Half | 2nd Half |
      |   -1 | AU-Normal | AB       | AB       |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-2" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift | 1st Half | 2nd Half |
      |   -1 | AU-PH | PH       | PH       |
 
  @TA_DAP8
  Scenario: Daily Attendance Process -> Change Week Off from Change Week-Off page in Shift and Shchedule
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Create Absentee Policy
      | PlcName   | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | DAPAbPlc1 | true             | True             | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | WeekOffGroup | AtdEnable | OtCoffEligibility | AttendancePlc | AbsenteePlc | CoffPlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |              | True      |                   |               | DAPAbPlc1   |         | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | 1st Half | 2nd Half |
      | 07/04/2024 | AU-WO     | WO       | WO       |
      | 10/04/2024 | AU-Normal | AB       | AB       |
    When Change Week Off from shift and schedule module
      | CurrentWeekOffDate | NewWeekOffDate | SelectUsers | UserIDs | validation                                   |
      | 07/04/2024         | 10/04/2024     | User Wise   | DAP_Ur1   | You need to run monthly process for Apr-2024 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift | 1st Half | 2nd Half |
      | 07/04/2024 | AU-Normal | WO       | WO       |
      | 10/04/2024 | AU-WO | WO       | WO       |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "01/04/2024" To "30/04/2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | 1st Half | 2nd Half |
      | 07/04/2024 | AU-Normal | AB       | AB       |
      | 10/04/2024 | AU-WO | WO       | WO       |
  
  
  @TA_DAP9
  Scenario: Daily Attendance Process -> Change leaving date in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AU"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid  | Active | JoiningDate | AtdEnable | AtdMarkingType | AttendancePlc | OvertimePlc | OtCoffEligibility | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |         -12 | True      | Normal         |               |             |                   | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | DAP_Ur1 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |         -3 |     090000 |
      | DAP_Ur1 |         -3 |     180000 |
      | DAP_Ur1 |         -2 |     090000 |
      | DAP_Ur1 |         -2 |     180000 |
      | DAP_Ur1 |         -1 |     090000 |
      | DAP_Ur1 |         -1 |     180000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -3 | 09:00    | 18:00    | PR       | PR       |
      |   -2 | 09:00    | 18:00    | PR       | PR       |
      |   -1 | 09:00    | 18:00    | PR       | PR       |
    When Create user from user configuration
      | userid  | Active | LeavingDate | Validation         |
      | DAP_Ur1 | True   |          -2 | Saved Successfully |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -3 | 09:00    | 18:00    | PR       | PR       |
      |   -2 | 09:00    | 18:00    | PR       | PR       |
      |   -1 | 09:00    | 18:00    | PR       | PR       |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "-7" To "0"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half |
      |   -3 | 09:00    | 18:00    | PR       | PR       |
      |   -2 | 09:00    | 18:00    | PR       | PR       |
      |   -1 | 09:00    | 18:00    | __       | __       |
  
   @TA_DAP10
  Scenario: Daily Attendance Process -> Allowed On Single Sided Absent= true in Absentee Policy, make punches before/after Week Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID  |
      | DAP_Ur1 |
    And Delete "AU" shift schedule
    And Delete "AU" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AU      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AU" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AU      |               7 |
    And Create Absentee Policy
      | PlcName   | WOAlwOnSnglSidAb | WOAlwOnBothSidAb | WOAtlstFullDayAbForClbCvr | HldAlwOnSnglSidAb | HldAlwOnBothSidAb | HldAtLstFullDayAbForClbCvr | Validation         |
      | DAPAbPlc1 | true             | false            | false                     | false             | false             | false                      | Saved Successfully |
    And Create user from user configuration
      | userid  | Active | WeekOffGroup | AtdEnable | OtCoffEligibility | AttendancePlc | AbsenteePlc | CoffPlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | DAP_Ur1 | True   |              | True      |                   |               | DAPAbPlc1   |         | AU            | True      | True      | True      | True               |                          | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 06/04/2024 | AU-Normal |          |          | AB       | AB       |
      | 07/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 14/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 15/04/2024 | AU-Normal |          |          | AB       | AB       |
      | 20/04/2024 | AU-Normal |          |          | AB       | AB       |
      | 21/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 27/04/2024 | AU-Normal |          |          | AB       | AB       |
      | 28/04/2024 | AU-WO     |          |          | AB       | AB       |
    When Set event via Event Set API
      | Userid  | event-date | event-time |
      | DAP_Ur1 |   06042024 |     090000 |
      | DAP_Ur1 |   06042024 |     180000 |
      | DAP_Ur1 |   15042024 |     090000 |
      | DAP_Ur1 |   15042024 |     180000 |
      | DAP_Ur1 |   20042024 |     090000 |
      | DAP_Ur1 |   20042024 |     180000 |
      | DAP_Ur1 |   27042024 |     090000 |
      | DAP_Ur1 |   27042024 |     180000 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 06/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 07/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 14/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 15/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 20/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 21/04/2024 | AU-WO     |          |          | AB       | AB       |
      | 27/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 28/04/2024 | AU-WO     |          |          | AB       | AB       |
    Then Run Daily Attendance Process with Reprocess Attendance Events = "false" and Include Denied Events= "false" for Date= "01/04/2024" To "30/04/2024"
      | UserID  |
      | DAP_Ur1 |
    And Daily Attendance View for userid "DAP_Ur1" and period "Date" on "01/04/2024" and "30/04/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half |
      | 06/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 07/04/2024 | AU-WO     |          |          | WO       | WO       |
      | 14/04/2024 | AU-WO     |          |          | WO       | WO       |
      | 15/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 20/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 21/04/2024 | AU-WO     |          |          | WO       | WO       |
      | 27/04/2024 | AU-Normal | 09:00    | 18:00    | PR       | PR       |
      | 28/04/2024 | AU-WO     |          |          | WO       | WO       |
  