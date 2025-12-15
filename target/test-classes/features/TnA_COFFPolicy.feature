@T&A
Feature: C-OFF Policy
  I want to use this template for my feature file

  @COPlc1
  Scenario: Check C-OFF generated on WO,PH,WO/PH Or shift FB,RD while Calculation On WO/PH/FB/RD As Per Weekday checkbox checked, Mon TO Sun checked in Days, Mon to Sun selected in Work Hours Within Shift drop down, and OT/C-OFF Eligibility= Only C-OFF (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete "FF" shift
    And Delete "RR" shift
    And Delete Holiday Schedule
      | HSName     |
      | AJ_HldSchl |
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT                     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | True              | True               | True      | Mon,Tue,Wed,Thu,Fri,Sat,Sun | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays       |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Su,Mo,Tu,We,Th,Fr,Sa |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create Holiday Schedule "AJ_HldSchl"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Uttarayan   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FF      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RR      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | FF      |               1 |
      | RR      |               1 |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | FF         | AJ_HldSchl      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |   01012024 |     070000 |
      | COPlc_Ur1 |   01012024 |     130000 |
      | COPlc_Ur1 |   01012024 |     140000 |
      | COPlc_Ur1 |   01012024 |     200000 |
      | COPlc_Ur1 |   02012024 |     070000 |
      | COPlc_Ur1 |   02012024 |     130000 |
      | COPlc_Ur1 |   02012024 |     140000 |
      | COPlc_Ur1 |   02012024 |     200000 |
      | COPlc_Ur1 |   03012024 |     070000 |
      | COPlc_Ur1 |   03012024 |     130000 |
      | COPlc_Ur1 |   03012024 |     140000 |
      | COPlc_Ur1 |   03012024 |     200000 |
      | COPlc_Ur1 |   06012024 |     070000 |
      | COPlc_Ur1 |   06012024 |     130000 |
      | COPlc_Ur1 |   06012024 |     140000 |
      | COPlc_Ur1 |   06012024 |     200000 |
      | COPlc_Ur1 |   14012024 |     070000 |
      | COPlc_Ur1 |   14012024 |     130000 |
      | COPlc_Ur1 |   14012024 |     140000 |
      | COPlc_Ur1 |   14012024 |     200000 |
      | COPlc_Ur1 |   15012024 |     070000 |
      | COPlc_Ur1 |   15012024 |     130000 |
      | COPlc_Ur1 |   15012024 |     140000 |
      | COPlc_Ur1 |   15012024 |     200000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "01/01/2024" and "16/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | FF-Normal | 07:00    | 20:00    | FB       | FB       | 08:00              |                     |
      | 02/01/2024 | RR-Normal | 07:00    | 20:00    | RD       | RD       | 08:00              |                     |
      | 03/01/2024 | AJ-Normal | 07:00    | 20:00    | PR       | PR       | 12:00              |                     |
      | 06/01/2024 | AJ-WO     | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 14/01/2024 | AJ-WO/PH  | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 15/01/2024 | AJ-PH     | 07:00    | 20:00    | PH       | PH       | 12:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date       | Authorized | Available |
      | 01/01/2024 | 08:00      | 08:00     |
      | 02/01/2024 | 08:00      | 08:00     |
      | 03/01/2024 | 12:00      | 12:00     |
      | 06/01/2024 | 12:00      | 12:00     |
      | 14/01/2024 | 12:00      | 12:00     |
      | 15/01/2024 | 12:00      | 12:00     |

  @COPlc2
  Scenario: Check C-OFF generated on WO,PH Or shift FB,RD while Calculation On WO/PH/FB/RD As Per Weekday checkbox unchecked, All checked in Days To Consider For Calculation in Overtime Configuration, all selected in Work Hours Within Shift drop down, and OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= WO,PH,WO/PH,FB,RD in user configuration (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete "FF" shift
    And Delete "RR" shift
    And Delete Holiday Schedule
      | HSName     |
      | AJ_HldSchl |
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | false             | false              | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create Holiday Schedule "AJ_HldSchl"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Uttarayan   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FF      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RR      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | FF      |               1 |
      | RR      |               1 |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff      | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Both              | WO,PH,WO/PH,FB,RD |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | FF         | AJ_HldSchl      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |   01012024 |     070000 |
      | COPlc_Ur1 |   01012024 |     130000 |
      | COPlc_Ur1 |   01012024 |     140000 |
      | COPlc_Ur1 |   01012024 |     200000 |
      | COPlc_Ur1 |   02012024 |     070000 |
      | COPlc_Ur1 |   02012024 |     130000 |
      | COPlc_Ur1 |   02012024 |     140000 |
      | COPlc_Ur1 |   02012024 |     200000 |
      | COPlc_Ur1 |   03012024 |     070000 |
      | COPlc_Ur1 |   03012024 |     130000 |
      | COPlc_Ur1 |   03012024 |     140000 |
      | COPlc_Ur1 |   03012024 |     200000 |
      | COPlc_Ur1 |   06012024 |     070000 |
      | COPlc_Ur1 |   06012024 |     130000 |
      | COPlc_Ur1 |   06012024 |     140000 |
      | COPlc_Ur1 |   06012024 |     200000 |
      | COPlc_Ur1 |   14012024 |     070000 |
      | COPlc_Ur1 |   14012024 |     130000 |
      | COPlc_Ur1 |   14012024 |     140000 |
      | COPlc_Ur1 |   14012024 |     200000 |
      | COPlc_Ur1 |   15012024 |     070000 |
      | COPlc_Ur1 |   15012024 |     130000 |
      | COPlc_Ur1 |   15012024 |     140000 |
      | COPlc_Ur1 |   15012024 |     200000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "01/01/2024" and "16/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | FF-Normal | 07:00    | 20:00    | FB       | FB       | 08:00              |                     |
      | 02/01/2024 | RR-Normal | 07:00    | 20:00    | RD       | RD       | 08:00              |                     |
      | 03/01/2024 | AJ-Normal | 07:00    | 20:00    | PR       | PR       | 12:00              | 12:00               |
      | 06/01/2024 | AJ-WO     | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 14/01/2024 | AJ-WO/PH  | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 15/01/2024 | AJ-PH     | 07:00    | 20:00    | PH       | PH       | 12:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date       | Authorized | Available |
      | 01/01/2024 | 08:00      | 08:00     |
      | 02/01/2024 | 08:00      | 08:00     |
      | 06/01/2024 | 12:00      | 12:00     |
      | 14/01/2024 | 12:00      | 12:00     |
      | 15/01/2024 | 12:00      | 12:00     |

  @COPlc3
  Scenario: Check C-OFF generated on WO,PH Or shift FB,RD while Calculation On WO/PH/FB/RD As Per Weekday checkbox checked, only WO/PH checked in Days To Consider For Calculation in Overtime Configuration, WO/PH selected in Work Hours Within Shift drop down, and OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= WO,PH,WO/PH,FB,RD in user configuration (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete "FF" shift
    And Delete "RR" shift
    And Delete Holiday Schedule
      | HSName     |
      | AJ_HldSchl |
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | WO/PH   | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | WO/PH          |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO/PH          |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO/PH          |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create Holiday Schedule "AJ_HldSchl"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Uttarayan   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FF      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RR      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | FF      |               1 |
      | RR      |               1 |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff      | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Both              | WO,PH,WO/PH,FB,RD |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | FF         | AJ_HldSchl      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |   01012024 |     070000 |
      | COPlc_Ur1 |   01012024 |     130000 |
      | COPlc_Ur1 |   01012024 |     140000 |
      | COPlc_Ur1 |   01012024 |     200000 |
      | COPlc_Ur1 |   02012024 |     070000 |
      | COPlc_Ur1 |   02012024 |     130000 |
      | COPlc_Ur1 |   02012024 |     140000 |
      | COPlc_Ur1 |   02012024 |     200000 |
      | COPlc_Ur1 |   03012024 |     070000 |
      | COPlc_Ur1 |   03012024 |     130000 |
      | COPlc_Ur1 |   03012024 |     140000 |
      | COPlc_Ur1 |   03012024 |     200000 |
      | COPlc_Ur1 |   06012024 |     070000 |
      | COPlc_Ur1 |   06012024 |     130000 |
      | COPlc_Ur1 |   06012024 |     140000 |
      | COPlc_Ur1 |   06012024 |     200000 |
      | COPlc_Ur1 |   14012024 |     070000 |
      | COPlc_Ur1 |   14012024 |     130000 |
      | COPlc_Ur1 |   14012024 |     140000 |
      | COPlc_Ur1 |   14012024 |     200000 |
      | COPlc_Ur1 |   15012024 |     070000 |
      | COPlc_Ur1 |   15012024 |     130000 |
      | COPlc_Ur1 |   15012024 |     140000 |
      | COPlc_Ur1 |   15012024 |     200000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "01/01/2024" and "16/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | FF-Normal | 07:00    | 20:00    | FB       | FB       |                    |                     |
      | 02/01/2024 | RR-Normal | 07:00    | 20:00    | RD       | RD       |                    |                     |
      | 03/01/2024 | AJ-Normal | 07:00    | 20:00    | PR       | PR       |                    |                     |
      | 06/01/2024 | AJ-WO     | 07:00    | 20:00    | WO       | WO       |                    |                     |
      | 14/01/2024 | AJ-WO/PH  | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 15/01/2024 | AJ-PH     | 07:00    | 20:00    | PH       | PH       |                    |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date       | Authorized | Available |
      | 14/01/2024 | 12:00      | 12:00     |

  @COPlc4
  Scenario: Check C-OFF generated on PH,WO/PH,WO,FB,RD only, while Calculation On WO/PH/FB/RD As Per Weekday checkbox checked,(PH,WO,WO/PH)checked in Days To Consider For Calculation in Overtime Configuration and (PH,WO,WO/PH) selected in Work Hours Within Shift drop down, and OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= WO,PH,WO/PH,FB,RD in user configuration(4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete "FF" shift
    And Delete "RR" shift
    And Delete Holiday Schedule
      | HSName     |
      | AJ_HldSchl |
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT     | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | PH,WO,WO/PH | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | PH,WO,WO/PH    |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | WO             |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | WO             |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create Holiday Schedule "AJ_HldSchl"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2024 | 15/01/2024 | Uttarayan   | False        |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType   | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |             | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
      | FF      | Field Break |           |         |         |         |            |          | Saved Successfully |
      | RR      | Rest Day    |           |         |         |         |            |          | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2024"
      | ShiftID | RepeatShiftDays |
      | FF      |               1 |
      | RR      |               1 |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 | OffDay2  | OffDay2OnWeeks |
      | Sunday  | Saturday | All            |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff      | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Both              | WO,PH,WO/PH,FB,RD |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | FF         | AJ_HldSchl      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |   01012024 |     070000 |
      | COPlc_Ur1 |   01012024 |     130000 |
      | COPlc_Ur1 |   01012024 |     140000 |
      | COPlc_Ur1 |   01012024 |     200000 |
      | COPlc_Ur1 |   02012024 |     070000 |
      | COPlc_Ur1 |   02012024 |     130000 |
      | COPlc_Ur1 |   02012024 |     140000 |
      | COPlc_Ur1 |   02012024 |     200000 |
      | COPlc_Ur1 |   03012024 |     070000 |
      | COPlc_Ur1 |   03012024 |     130000 |
      | COPlc_Ur1 |   03012024 |     140000 |
      | COPlc_Ur1 |   03012024 |     200000 |
      | COPlc_Ur1 |   06012024 |     070000 |
      | COPlc_Ur1 |   06012024 |     130000 |
      | COPlc_Ur1 |   06012024 |     140000 |
      | COPlc_Ur1 |   06012024 |     200000 |
      | COPlc_Ur1 |   12012024 |     070000 |
      | COPlc_Ur1 |   12012024 |     130000 |
      | COPlc_Ur1 |   12012024 |     140000 |
      | COPlc_Ur1 |   12012024 |     200000 |
      | COPlc_Ur1 |   13012024 |     070000 |
      | COPlc_Ur1 |   13012024 |     130000 |
      | COPlc_Ur1 |   13012024 |     140000 |
      | COPlc_Ur1 |   13012024 |     200000 |
      | COPlc_Ur1 |   14012024 |     070000 |
      | COPlc_Ur1 |   14012024 |     130000 |
      | COPlc_Ur1 |   14012024 |     140000 |
      | COPlc_Ur1 |   14012024 |     200000 |
      | COPlc_Ur1 |   15012024 |     070000 |
      | COPlc_Ur1 |   15012024 |     130000 |
      | COPlc_Ur1 |   15012024 |     140000 |
      | COPlc_Ur1 |   15012024 |     200000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "01/01/2024" and "16/01/2024"
      | Date       | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      | 01/01/2024 | FF-Normal | 07:00    | 20:00    | FB       | FB       |                    |                     |
      | 02/01/2024 | RR-Normal | 07:00    | 20:00    | RD       | RD       |                    |                     |
      | 03/01/2024 | AJ-Normal | 07:00    | 20:00    | PR       | PR       |                    |                     |
      | 06/01/2024 | AJ-WO     | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 12/01/2024 | AJ-Normal | 07:00    | 20:00    | PR       | PR       |                    |                     |
      | 13/01/2024 | AJ-WO     | 07:00    | 20:00    | WO       | WO       | 12:00              |                     |
      | 14/01/2024 | AJ-WO/PH  | 07:00    | 20:00    | WO       | WO       | 08:00              |                     |
      | 15/01/2024 | AJ-PH     | 07:00    | 20:00    | PH       | PH       | 08:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date       | Authorized | Available |
      | 06/01/2024 | 12:00      | 12:00     |
      | 13/01/2024 | 12:00      | 12:00     |
      | 14/01/2024 | 08:00      | 08:00     |
      | 15/01/2024 | 08:00      | 08:00     |

  @COPlc5
  Scenario: Check boundry value analysis of Minimum Overtime Required for C-OFF= 2  (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | OTPlcDaily11 |
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | True              | True               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 02:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -3 |     080000 |
      | COPlc_Ur1 |         -3 |     130000 |
      | COPlc_Ur1 |         -3 |     140000 |
      | COPlc_Ur1 |         -3 |     180000 |
      | COPlc_Ur1 |         -2 |     080000 |
      | COPlc_Ur1 |         -2 |     130000 |
      | COPlc_Ur1 |         -2 |     140000 |
      | COPlc_Ur1 |         -2 |     190000 |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     190000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-3" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -3 | AJ-Normal | 08:00    | 18:00    | PR       | PR       | 01:00              |                     |
      |   -2 | AJ-Normal | 08:00    | 19:00    | PR       | PR       | 02:00              |                     |
      |   -1 | AJ-Normal | 07:00    | 19:00    | PR       | PR       | 03:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date | Authorized | Available |
      |   -2 | 02:00      | 02:00     |
      |   -1 | 03:00      | 03:00     |
    And Verify Manual Overtime/C-OFF Entry for UserID= "COPlc_Ur1" and AtdDate= "-3"
      | Component | Processed | Authorized | Manual Credit | Manual Debit |
      | OT1       | 01:00     | 00:00      |               |              |
   
		
		
      @COPlc6
  Scenario: C-OFF Authorized In Multiples Of= 1 and generated OT= 03:30 but Authorized C-OFF= 03:00(4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     193000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -1 | AJ-Normal | 07:00    | 19:30    | PR       | PR       | 03:30              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date | Authorized | Available |
      |   -1 | 03:00      | 03:00     |
   And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COPlc_Ur1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
   And Verify Overtime Details from Attendance Details page in ESS for AtdDate= "-1"
  		|Total Unauthorized Overtime|
  		|		00:30						|		
 

  @COPlc7
  Scenario: C-OFF Authorized In Multiples Of= 00:30 and generated OT= 03:30 and Authorized C-OFF= 03:30 (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT1        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:30           | 00:30            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     193000 |
      | COPlc_Ur1 |         -2 |     070000 |
      | COPlc_Ur1 |         -2 |     130000 |
      | COPlc_Ur1 |         -2 |     140000 |
      | COPlc_Ur1 |         -2 |     190000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-2" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -1 | AJ-Normal | 07:00    | 19:30    | PR       | PR       | 03:30              |                     |
      |   -2 | AJ-Normal | 07:00    | 19:00    | PR       | PR       | 03:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date | Authorized | Available |
      |   -1 | 03:30      | 03:30     |
      |   -2 | 03:00      | 03:00     |

  @COPlc8
  Scenario: C-OFF Validity Type= Monthly, C-OFF Validity (Months)= 1 configuration in C-OFF policy and C-OFF Application after validity month and within validity month (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                  1 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   |            | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COPlc_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-time | CurrentDtTominusMonthDate | event-date |
      | COPlc_Ur1 |     070000 |                        -1 |         -1 |
      | COPlc_Ur1 |     130000 |                        -1 |         -1 |
      | COPlc_Ur1 |     140000 |                        -1 |         -1 |
      | COPlc_Ur1 |     200000 |                        -1 |         -1 |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-35" and "0"
      | PanelName  | UserID    | CurrentDtTominusMonthDate | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | COPlc_Ur1 |                        -1 |   -1 | OT1    | 08:00   |          | 08:00      | Authorized |
      | Authorized | COPlc_Ur1 |                        -1 |   -1 | OT2    | 02:00   |          | 02:00      | Authorized |
      | Authorized | COPlc_Ur1 |                        -1 |   -1 | OT3    | 02:00   |          | 02:00      | Authorized |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | CurrentDtTominusMonthDate | ValidityFrom | ValidityTo |TableRecord|
      |                        -1 |              |          0 |No Data|
    When Set event via Event Set API
      | Userid    | event-time | CurrentDtTominusMonthDate | event-date |
      | COPlc_Ur1 |     070000 |                        -1 |            |
      | COPlc_Ur1 |     130000 |                        -1 |            |
      | COPlc_Ur1 |     140000 |                        -1 |            |
      | COPlc_Ur1 |     200000 |                        -1 |            |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | CurrentDtTominusMonthDate | ValidityFrom | ValidityTo | Date | Authorized | Available |
      |                        -1 |              |          0 |      | 12:00      | 12:00     |

   
 @COPlc9
  Scenario: C-OFF Validity Type= Yearly configuration in C-OFF policy and C-OFF Application after validity year and within validity year (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor |ApplicableDays|
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 |Check All|
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All|
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 |Check All|
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType |   MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Yearly           |    04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | 			      | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COPlc_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-time |  event-date							 |
      | COPlc_Ur1 |     070000 |                        -1 | 
      | COPlc_Ur1 |     130000 |                        -1 |     
      | COPlc_Ur1 |     140000 |                        -1 |        
      | COPlc_Ur1 |     200000 |                        -1 |        
   Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-2" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | COPlc_Ur1 |   -1	| OT1    | 08:00   | 			    |  08:00     | Authorized | 
      | Authorized | COPlc_Ur1 |   -1	| OT2    | 02:00   | 			    |  02:00     | Authorized |
      | Authorized | COPlc_Ur1 |   -1	| OT3    | 02:00   | 			    |  02:00     | Authorized |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      |ValidityFrom|ValidityTo |TableRecord|
      |-1				|			0			|No Data|
		When Set event via Event Set API
      | Userid    | event-time |  event-date|
      | COPlc_Ur1 |     070000 |  0 				| 	
      | COPlc_Ur1 |     130000 |  0 				|  	
      | COPlc_Ur1 |     140000 |  0 				|  		
      | COPlc_Ur1 |     200000 |  0 				|  			
    Then Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
		  |ValidityFrom | ValidityTo |Date | Authorized | Available |
		  |       -1    |          0 |	0	 | 12:00      | 12:00     |
 
		  
 @COPlc10
  Scenario: C-OFF Validity Type= Days configuration in C-OFF policy and C-OFF Application after validity days and within validity days (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityDays | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Days             |                2 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   |            | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COPlc_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     070000 |         -3 |
      | COPlc_Ur1 |     130000 |         -3 |
      | COPlc_Ur1 |     140000 |         -3 |
      | COPlc_Ur1 |     200000 |         -3 |
    Then Validate Overtime/C-OFF Application from SA for Period "Daily" on "-35" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | COPlc_Ur1 |   -3 | OT1    | 08:00   |          | 08:00      | Authorized |
      | Authorized | COPlc_Ur1 |   -3 | OT2    | 02:00   |          | 02:00      | Authorized |
      | Authorized | COPlc_Ur1 |   -3 | OT3    | 02:00   |          | 02:00      | Authorized |
    And Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-3" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -3 | 07:00    | 20:00    | PR       | PR       | 12:00              |                     |
    Then Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | ValidityFrom | ValidityTo |TableRecord|
      |           -2 |          0 |No Data|
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     070000 |         -2 |
      | COPlc_Ur1 |     130000 |         -2 |
      | COPlc_Ur1 |     140000 |         -2 |
      | COPlc_Ur1 |     200000 |         -2 |
    And Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 20:00    | PR       | PR       | 12:00              |                     |
    Then Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | ValidityFrom | ValidityTo | Date | Authorized | Available |
      |           -2 |          0 |   -2 | 12:00      | 12:00     |
      
  @COPlc11
  Scenario: Minimum C-OFF For Half Day Off (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay      |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                  2 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EV      | EV        | Compensatory Off |           0.0 |        99.0 | Single App     |          | Saved Successfully |
    And Create Leave Group "EV_LvGrp" with Pro-rata "False"
      | LeaveID |
      | EV      |
    And Create user from user configuration
      | userid    | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | EV_LvGrp   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COPlc_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     080000 |         -2 |
      | COPlc_Ur1 |     130000 |         -2 |
      | COPlc_Ur1 |     140000 |         -2 |
      | COPlc_Ur1 |     200000 |         -2 |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -2 | 08:00    | 20:00    | PR       | PR       | 03:00              |                     |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Available |
      |   -2 | 03:00      | 03:00     |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Duration   | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                   |
      |        0 |      0 | First Half | EV - EV |      -2 | 03:00         | sick   | Total C-OFF Hours selected is not sufficient |
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     070000 |         -1 |
      | COPlc_Ur1 |     130000 |         -1 |
      | COPlc_Ur1 |     140000 |         -1 |
      | COPlc_Ur1 |     200000 |         -1 |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -2 | 08:00    | 20:00    | PR       | PR       | 03:00              |                     |
      |   -1 | 07:00    | 20:00    | PR       | PR       | 04:00              |                     |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Available |
      |   -1 | 04:00      | 04:00     |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Duration   | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        0 |      0 | First Half | EV - EV |      -1 | 04:00         | sick   | No more absent records exist |

  @COPlc12
  Scenario: Minimum C-OFF For Full Day Off (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | EV      | EV        | Compensatory Off |           0.0 |        99.0 | Single App     |          | Saved Successfully |
    And Create Leave Group "EV_LvGrp" with Pro-rata "False"
      | LeaveID |
      | EV      |
    And Create user from user configuration
      | userid    | Active | LeaveGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | EV_LvGrp   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COPlc_Ur1 |                          1 | admin        |    1 |
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     070000 |         -2 |
      | COPlc_Ur1 |     130000 |         -2 |
      | COPlc_Ur1 |     140000 |         -2 |
      | COPlc_Ur1 |     200000 |         -2 |
    And Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-2" and "0"
      | Date | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -2 | 07:00    | 20:00    | PR       | PR       | 12:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date | Authorized | Available |
      |   -2 | 12:00      | 12:00     |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                                   |
      |        0 |      0 | EV - EV |      -2 | 04:00         | sick   | Total C-OFF Hours selected is not sufficient |
    When Set event via Event Set API
      | Userid    | event-time | event-date |
      | COPlc_Ur1 |     070000 |         -1 |
      | COPlc_Ur1 |     130000 |         -1 |
      | COPlc_Ur1 |     140000 |         -1 |
      | COPlc_Ur1 |     200000 |         -1 |
    Then Apply COff Application from ESS
      | UserID    | FromDate | ToDate | Leave   | AtdDate | SelectCOffHrs | Reason | Validation                   |
      | COPlc_Ur1 |        0 |      0 | EV - EV |      -1 | 08:00         | sick   | No more absent records exist |

  @COPlc13
  Scenario: Auto Authorize C-OFF= unchecked, Authorize from RIC (4 punch user)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | COPlc_Ur1  |
      | COPlc_Ric1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | false           |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                 99 | 04:00              | 08:00              | false        | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | COPlc_Ric1 | COPlc_Ric1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1       | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COPlc_RGrp1      | AnyOne     | COPlc_Ric1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | COPlc_RGrp1    | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     200000 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | COPlc_Ur1  |                          1 | admin        |    1 |
      | COPlc_Ric1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
    Then Daily Attendance View for period "Date" on "-1" and "0" in ESS
      | Date | First IN | Last OUT | Generated Overtime | Authorized Overtime |
      |   -1 | 07:00    | 20:00    | 12:00              |                     |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | COPlc_Ric1 | admin    | Welcome COPlc_Ric1 |
    When "Overtime/C-OFF" Authorization for "Single Record" and Period "Daily" from RIC on "-1" and "0"
      | PanelName | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Validation         |
      | Pending   | COPlc_Ur1 |   -1 | OT1    | 08:00   |          | 008:00     | Saved Successfully |
      | Pending   | COPlc_Ur1 |   -1 | OT2    | 02:00   |          | 002:00     | Saved Successfully |
      | Pending   | COPlc_Ur1 |   -1 | OT3    | 02:00   |          | 002:00     | Saved Successfully |
    Then Validate "Overtime/C-OFF" Application from RIC for Period "Daily" on "-1" and "0"
      | PanelName  | UserID    | Date | OTType | OTHours | AuthAsOT | AuthAsCOFF | Status     |
      | Authorized | COPlc_Ur1 |   -1 | OT1    | 08:00   |          | 08:00      | Authorized |
      | Authorized | COPlc_Ur1 |   -1 | OT2    | 02:00   |          | 02:00      | Authorized |
      | Authorized | COPlc_Ur1 |   -1 | OT3    | 02:00   |          | 02:00      | Authorized |
    And Logout from Cosec Web
    And Login with user
      | username  | password | Validation        |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
    And Verify C-OFF Balance from Leave Balance Page in ESS
      | Date | Authorized | Available |
      |   -1 | 12:00      | 12:00     |

  @COPlc14
  Scenario: C-OFF Authorized In Multiples Of= 1, Auto Authorize C-OFF= checked configuration in C-OFF Policy, Auto Authorize Overtime Component= checked configuration in Overtime Policy, OT/C-OFF Eligibility= Both, Auto Authorize C-OFF= true(WO,PH,WO/PH,FB,RD,Normal Day) in user configuration and generated OT= 03:30, Verify the unauthorized OT (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff                 | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Both              | WO,PH,WO/PH,FB,RD,Normal Day |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     193000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -1 | AJ-Normal | 07:00    | 19:30    | PR       | PR       | 11:30              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date                | Authorized              | Available |
      |                  -1 | 11:00                   | 11:00     |
   And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COPlc_Ur1  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username   | password | Validation         |
      | COPlc_Ur1 | admin    | Welcome COPlc_Ur1 |
   And Verify Overtime Details from Attendance Details page in ESS for AtdDate= "-1"
      | Total Unauthorized Overtime |  
      | 00:30               |      
  
  
  @COPlc15
  Scenario: OT/C-OFF Eligibility= Only C-OFF in User Configuration, Auto Authorize C-OFF= checked configuration in C-OFF Policy, Auto Authorize Overtime Component= checked configuration in Overtime Policy (4 Punch User)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID    |
      | COPlc_Ur1 |
    And Delete "AJ" shift schedule
    And Delete "AJ" shift
    And Delete Overtime Policy from TnA module
    	|Name				 |
    	|OTPlcDaily11|
    And Create NetWork Hours Policy "NetWrkHrsPlc_Daily11"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName       | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | OTPlcDaily11 | NetWrkHrsPlc_Daily11 | true              | true               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "OTPlcDaily11"
      | WorkComponent           | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Early-IN                |      0000 |    0200 |      0000 | OT2        |   1.00 | Check All      |
      | Overstay                |      0000 |    0200 |      0000 | OT3        |   1.00 | Check All      |
    And Create C-OFF Policy
      | PlcName      | MinOTReqForCOFF | COFFAuthInMultOf | COffValidityType | COffValidityMonths | MinCOff4HalfDayOff | MinCOff4FullDayOff | AutoAuthCOFF | Validation         |
      | COPlcDaily11 | 01:00           | 01:00            | Monthly          |                  3 | 04:00              | 08:00              | true         | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | ShiftType | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AJ      |           | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AJ" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AJ      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AJ"
      | OffDay1 |
      | None    |
    And Create user from user configuration
      | userid    | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AutoAuthCoff | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc      | ACSEnable | ShiftSchedule | StartShift | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | COPlc_Ur1 | True   | True      |                        4 | Only C-OFF        |              |               |             | OTPlcDaily11 |           |             | COPlcDaily11 | True      | AJ            | AJ         |                 | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COPlc_Ur1 |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COPlc_Ur1 |         -1 |     070000 |
      | COPlc_Ur1 |         -1 |     130000 |
      | COPlc_Ur1 |         -1 |     140000 |
      | COPlc_Ur1 |         -1 |     200000 |
    Then Daily Attendance View for userid "COPlc_Ur1" and period "Date" on "-1" and "0"
      | Date | Shift     | First IN | Last OUT | 1st Half | 2nd Half | Generated Overtime | Authorized Overtime |
      |   -1 | AJ-Normal | 07:00    | 20:00    | PR       | PR       | 12:00              |                     |
    And Verify C-OFF Balance in Leave Balance Page for UserID= "COPlc_Ur1"
      | Date | Authorized | Available |
      |   -1 | 12:00      | 12:00     |
