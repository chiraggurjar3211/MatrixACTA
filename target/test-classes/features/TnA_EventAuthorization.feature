@T&A
Feature: Event Authorization
  I want to use this template for my feature file

  @TA_EventAuth1
  Scenario: Event Authorization (select one by one) -  punch from ESS and authorized by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | EventSource | AuthReqforatleastoneEventoftheday | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | ESS         | false                             |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         | AnyOne     | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
    Then Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time | I/O   | Source | Status       |
      |    0 |      | Entry | ESS    | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    And Approve Reject "Event Authorization" Application from RIC Date from= "-1" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |    0 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    And Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time | I/O   | Source | Status     |
      |    0 |      | Entry | ESS    | Authorized |

  @TA_EventAuth2
  Scenario: Event Authorization (select one by one) - punch from ESS and authorized by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Delete user via API
      | UserID |
      | EA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | EventSource | AuthReqforatleastoneEventoftheday | validation         |
      | EA_AtdPlc1 |                4 | true         | ESS         | false                             | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | EA_Ur1 | True   |                | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | EA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
    And Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time | I/O   | Source | Status       |
      |    0 |      | Entry | ESS    | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Approve Reject Event Authorization Application from SA Date from= "-1" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |    0 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time | I/O   | Source | Status     |
      |    0 |      | Entry | ESS    | Authorized |

  @TA_EventAuth3
  Scenario: Event Authorization (Select All) - Set event via api and Authorized by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | false                             | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         |        1 | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -1 |     090000 |      0 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 09:00 | Entry | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    And Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |   -1 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    And Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -1 | 09:00 | Entry | Others | Authorized |

  @TA_EventAuth4
  Scenario: Event Authorization (Select All) - Set event via api and Authorized by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | EA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | false                             | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | EA_Ur1 | True   |                | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | EA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -1 |     090000 |      0 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |    -1 | 09:00 | Entry | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Event Authorization Application from SA Date from= "-2" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |   -1 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -1 | 09:00 | Entry | Others | Authorized |

  @TA_EventAuth5
  Scenario: Event Authorization - "Auth Required for at least one Event of the day"= true - first punch authorized by ric
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | true                              | ESS         |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         |        1 | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O   | Source | Status       |
      |    0 |      | Entry | ESS    | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-1" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |    0 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O   | Source | Status     |
      |    0 |      | Entry | ESS    | Authorized |
    And Mark punch via ESS
      | SpecialFunction |
      | Regular OUT     |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O  | Source | Status     |
      |    0 |      | Exit | ESS    | Authorized |

  @TA_EventAuth6
  Scenario: Event Authorization - "Auth Required for at least one Event of the day"= true - first punch authorized by System Admin
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Delete user via API
      | UserID |
      | EA_Ur1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | true                              | ESS         |          |               |            |                  |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | EA_Ur1 | True   |                | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | EA_Ur1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
    Then Validate "Attendance Events" Application in ESS date From= "-1" To= "0"
      | Date | Time | I/O   | Source | Status       |
      |    0 |      | Entry | ESS    | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Approve Reject Event Authorization Application from SA Date from= "-1" To= "0"
      | UserID | Date | Authorize | Validation         |
      | EA_Ur1 |    0 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O   | Source | Status     |
      |    0 |      | Entry | ESS    | Authorized |
    And Mark punch via ESS
      | SpecialFunction |
      | Regular OUT     |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O  | Source | Status     |
      |    0 |      | Exit | ESS    | Authorized |

  @TA_EventAuth7
  Scenario: Event Authorization - "Auth Required for at least one Event of the day"= true - event status= pending from unauthorized source and event status= authorized from authorized source
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set ESS parameteres in GP
      | SpecialFunction   | Checkbox |
      | Regular IN        | True     |
      | Official Work IN  | True     |
      | Short Leave IN    | True     |
      | Break End         | True     |
      | Overtime IN       | True     |
      | Regular OUT       | True     |
      | Official Work OUT | True     |
      | Short Leave OUT   | True     |
      | Break Start       | True     |
      | Overtime OUT      | True     |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | true                              | ESS         |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         |        1 | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    And Mark punch via ESS
      | SpecialFunction |
      | Regular IN      |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O   | Source | Status       |
      |    0 |      | Entry | ESS    | Unauthorized |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |          0 |     090000 |      0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |    0 | 09:00 | Entry | Others | Authorized |
    And Mark punch via ESS
      | SpecialFunction |
      | Regular OUT     |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time | I/O  | Source | Status     |
      |    0 |      | Exit | ESS | Authorized |

  @TA_EventAuth8
  Scenario: Event Authorization - "Auth Required for at least one Event of the day"= true - multiple events status= Unauthorized (which authorized one by one from RIC)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | EA      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "EA" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | EA      |               7 |
    And Configure Off Day Configuration in Shift Schedule "EA"
      | OffDay1 |
      | None    |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | true                              | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         |        1 | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | EA            | True      | True      | True      | True               |                        4 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -1 |     090000 |      0 |
      | EA_Ur1 |         -1 |     130000 |      1 |
      | EA_Ur1 |         -1 |     140000 |      0 |
      | EA_Ur1 |         -1 |     180000 |      1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 09:00 | Entry | Others | Unauthorized |
      |   -1 | 13:00 | Exit  | Others | Unauthorized |
      |   -1 | 14:00 | Entry | Others | Unauthorized |
      |   -1 | 18:00 | Exit  | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -1 | 09:00 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -1 | 09:00    |          |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 09:00 | Entry | Others | Authorized   |
      |   -1 | 13:00 | Exit  | Others | Unauthorized |
      |   -1 | 14:00 | Entry | Others | Unauthorized |
      |   -1 | 18:00 | Exit  | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -1 | 13:00 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -1 | 09:00    | 13:00    |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 09:00 | Entry | Others | Authorized   |
      |   -1 | 13:00 | Exit  | Others | Authorized   |
      |   -1 | 14:00 | Entry | Others | Unauthorized |
      |   -1 | 18:00 | Exit  | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -1 | 14:00 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -1 | 09:00    | 14:00    |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 09:00 | Entry | Others | Authorized   |
      |   -1 | 13:00 | Exit  | Others | Authorized   |
      |   -1 | 14:00 | Entry | Others | Authorized   |
      |   -1 | 18:00 | Exit  | Others | Unauthorized |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -1 | 18:00 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -1 | 09:00    | 18:00    |
    And Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -1 | 09:00 | Entry | Others | Authorized |
      |   -1 | 13:00 | Exit  | Others | Authorized |
      |   -1 | 14:00 | Entry | Others | Authorized |
      |   -1 | 18:00 | Exit  | Others | Authorized |

   @TA_EventAuth9
  Scenario: Event Authorization - "Auth Required for at least one Event of the day"= true - Shift= Night Shift - event need to authorize after day change
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | EA_Ur1   |
      | EA_Ric_1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | IncGrcTimeInWrkHrs | GrcTimeforShiftLateIN | OverlapShiftLateIn | Validation         |
      | AF      | 21:00     | 06:00   | 04:00   | 08:00   | 23:45      | 00:45    |                    |                       |                    | Saved Successfully |
    And Create Shift Schedule "AF" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | AF      |               7 |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | EventAuthReq | AuthReqforatleastoneEventoftheday | EventSource                                                         | LiEoMode | LiCheckEnable | LiMaxCount | LiAbsentMarkType | LiMarkAbsent | validation         |
      | EA_AtdPlc1 |                4 | true         | true                              | Device,ESS,User Assigned Locations,User Unassigned Locations,Others |          |               |            |                  |              | Saved Successfully |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | EA_Ric_1 | EA_Ric_1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | EA_RGrp1         |        1 | EA_Ric_1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup | AtdEnable | AttendancePlc | AbsenteePlc | ShiftSchedule | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered |  Validation         |
      | EA_Ur1 | True   | EA_RGrp1       | true      | EA_AtdPlc1    |             | AF            | True      | True      | True      | True               |                        4 |  Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | EA_Ur1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | EA_Ur1   |                          1 | admin        |    1 |
      | EA_Ric_1 |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -2 |     210000 |      0 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -2 | 21:00 | Entry | Others | Unauthorized |
    And Daily Attendance View for period "Date" on "-3" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -2 |          |          |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -2 | 21:00 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -2 | 21:00 | Entry | Others | Authorized |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -2 | 21:00    |          |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -2 |     234500 |      1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -2 | 23:45 | Exit | Others | Authorized |
    And Daily Attendance View for period "Date" on "-3" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -2 | 21:00    | 23:45    |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -1 |     004500 |      0 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status       |
      |   -1 | 00:45 | Entry | Others | Unauthorized |
    And Daily Attendance View for period "Date" on "-2" and "0" in ESS
      | Date | First IN | Last OUT |
      |   -2 | 21:00    | 23:45    |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | EA_Ric_1 | admin    | Welcome EA_Ric_1 |
    When Approve Reject "Event Authorization" Application from RIC Date from= "-2" To= "0"
      | UserID | Date | Time  | Authorize | Validation         |
      | EA_Ur1 |   -1 | 00:45 | true      | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | EA_Ur1   | admin    | Welcome EA_Ur1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -1 | 00:45 | Entry | Others | Authorized |
    And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT |
      |   -2 | 21:00    | 00:45    |
    When Set event via Event Set API
      | Userid | event-date | event-time | In-out |
      | EA_Ur1 |         -1 |     060000 |      1 |
    Then Validate "Attendance Events" Application in ESS date From= "-2" To= "0"
      | Date | Time  | I/O   | Source | Status     |
      |   -1 | 06:00 | Exit | Others | Authorized |
    And Daily Attendance View for period "Date" on "-2" and "2" in ESS
      | Date | First IN | Last OUT |
      |   -2 | 21:00    | 06:00    |
      