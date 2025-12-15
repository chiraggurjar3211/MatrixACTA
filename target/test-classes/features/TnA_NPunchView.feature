@T&A
Feature: N-Punch View
  I want to use this template for my feature file

  @TA_NPunchView1
  Scenario: N-Punch View
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | NPunch_Ur1 |
    And Delete "AL" shift schedule
    And Delete "AL" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | NPunchOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AL"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NPunchNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | NPunchOTPlc1 | NPunchNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NPunchOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT2        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc  | OtCoffEligibility | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | NPunch_Ur1 | True   |                | True      |               | NPunchOTPlc1 | Both              | AL            | AL         | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time | Spfid |
      | NPunch_Ur1 |         -1 |     070000 |     5 |
      | NPunch_Ur1 |         -1 |     090000 |     2 |
      | NPunch_Ur1 |         -1 |     093000 |     1 |
      | NPunch_Ur1 |         -1 |     130000 |     8 |
      | NPunch_Ur1 |         -1 |     133000 |     7 |
      | NPunch_Ur1 |         -1 |     140000 |     2 |
      | NPunch_Ur1 |         -1 |     143000 |     1 |
      | NPunch_Ur1 |         -1 |     190000 |     6 |
    Then Verify N-Punch details from N-Punch View page
      | UserId     | AttendanceDate | GrossWorkHours | TotalOutTime | N-PunchWorkHours | ExtraWorkHours | AuthorizedOvertime | Status |
      | NPunch_Ur1 |             -1 | 12:00          | 01:30        | 10:30            | 03:00          | 03:00              | PR-PR  |

  @TA_NPunchView2
  Scenario: Manual Entry added/edit in N-Punch View with/without special function
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | NPunch_Ur1 |
    And Delete "AL" shift schedule
    And Delete "AL" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | NPunchOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AL"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NPunchNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | NPunchOTPlc1 | NPunchNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NPunchOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT2        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc  | OtCoffEligibility | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | NPunch_Ur1 | True   |                | True      |               | NPunchOTPlc1 | Both              | AL            | AL         | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | NPunch_Ur1 |         -1 |     070000 |
      | NPunch_Ur1 |         -1 |     090000 |
      | NPunch_Ur1 |         -1 |     093000 |
      | NPunch_Ur1 |         -1 |     130000 |
      | NPunch_Ur1 |         -1 |     133000 |
      | NPunch_Ur1 |         -1 |     140000 |
      | NPunch_Ur1 |         -1 |     143000 |
      | NPunch_Ur1 |         -1 |     190000 |
    Then Verify N-Punch details from N-Punch View page
      | UserId     | AttendanceDate | GrossWorkHours | TotalOutTime | N-PunchWorkHours | ExtraWorkHours | AuthorizedOvertime | Status |
      | NPunch_Ur1 |             -1 | 12:00          | 01:30        | 10:30            | 03:00          | 03:00              | PR-PR  |
    When Add/Edit punch in N-Punch View for UserID= "NPunch_Ur1" and AtdDate= "-1"
      | ActualTime | Action | NewTime | SpecialFunction |
      |            | add    | 08:00   |                 |
      |            | add    | 08:45   |                 |
      | 07:00      | edit   |         | Regular IN      |
      | 08:00      | edit   | 08:30   | Official Out    |
      | 08:45      | edit   |         | Official IN     |
    Then Verify N-Punch details from N-Punch View page
      | UserId     | AttendanceDate | GrossWorkHours | TotalOutTime | N-PunchWorkHours | ExtraWorkHours | AuthorizedOvertime | Status |
      | NPunch_Ur1 |             -1 | 12:00          | 01:45        | 10:30            | 02:45          | 02:45              | PR-PR  |

  @TA_NPunchView3
  Scenario: Delete punch scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | NPunch_Ur1 |
    And Delete "AL" shift schedule
    And Delete "AL" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | NPunchOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AL"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NPunchNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | NPunchOTPlc1 | NPunchNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NPunchOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT2        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc  | OtCoffEligibility | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | NPunch_Ur1 | True   |                | True      |               | NPunchOTPlc1 | Both              | AL            | AL         | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID     |
      | NPunch_Ur1 |
    When Set event via Event Set API
      | Userid     | event-date | event-time |
      | NPunch_Ur1 |         -1 |     070000 |
      | NPunch_Ur1 |         -1 |     090000 |
      | NPunch_Ur1 |         -1 |     093000 |
      | NPunch_Ur1 |         -1 |     130000 |
      | NPunch_Ur1 |         -1 |     133000 |
      | NPunch_Ur1 |         -1 |     140000 |
      | NPunch_Ur1 |         -1 |     143000 |
      | NPunch_Ur1 |         -1 |     190000 |
    And Verify N-Punch details from N-Punch View page
      | UserId     | AttendanceDate | GrossWorkHours | TotalOutTime | N-PunchWorkHours | ExtraWorkHours | AuthorizedOvertime | Status |
      | NPunch_Ur1 |             -1 | 12:00          | 01:30        | 10:30            | 03:00          | 03:00              | PR-PR  |
    Then Add/Edit punch in N-Punch View for UserID= "NPunch_Ur1" and AtdDate= "-1"
      | ActualTime | Action | NewTime | SpecialFunction |
      | 09:00      | delete |         |                 |
      | 09:30      | delete |         |                 |

  @TA_NPunchView4
  Scenario: Export N-Punch Data
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | NPunch_Ur1 |
    And Delete "AL" shift schedule
    And Delete "AL" shift
    And Delete Overtime Policy from TnA module
      | Name         |
      | NPunchOTPlc1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | Validation         |
      | AL      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | Saved Successfully |
    And Create Shift Schedule "AL" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AL      |               7 |
    And Configure Off Day Configuration in Shift Schedule "AL"
      | OffDay1 |
      | None    |
    And Create NetWork Hours Policy "NPunchNetWrkPlc1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName   | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | DailyOT | OTR4FracEnable | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | NPunchOTPlc1 | NPunchNetWrkPlc1 | True              | True               | True      | All     | true           | Daily 1    | true            |                       | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "NPunchOTPlc1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT2        |   1.00 | Check All      |
    And Create user from user configuration
      | userid     | Active | ReportingGroup | AtdEnable | AttendancePlc | OvertimePlc  | OtCoffEligibility | ShiftSchedule | StartShift | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | NPunch_Ur1 | True   |                | True      |               | NPunchOTPlc1 | Both              | AL            | AL         | True      | True      | True      | True               | N-Punch                  | Saved Successfully |
    And Run Shift Process for Month = "April" and Year = "2024"
      | UserID     |
      | NPunch_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "April" and Year = "2024"
      | UserID     |
      | NPunch_Ur1 |
    And Set event via Event Set API
      | Userid     | event-date | event-time |
      | NPunch_Ur1 |   08042024 |     070000 |
      | NPunch_Ur1 |   08042024 |     090000 |
      | NPunch_Ur1 |   08042024 |     093000 |
      | NPunch_Ur1 |   08042024 |     130000 |
      | NPunch_Ur1 |   08042024 |     133000 |
      | NPunch_Ur1 |   08042024 |     140000 |
      | NPunch_Ur1 |   08042024 |     143000 |
      | NPunch_Ur1 |   08042024 |     190000 |
    When Export N-Punch Data from N-Punch View Page
      | UserID     | AttendanceDate |
      | NPunch_Ur1 | 08/04/2024     |
    Then Validate exported file from UI selection.
      | FileName       | FileFormat | Compare  |
      | N-Punch_export | XLS        | Compared |
