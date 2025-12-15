#****************************** WEEK OFF GROUP **********************************************************************
@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @SS_1
  Scenario: Week off group configuration - Off day1 = Sunday.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_1   |
    And Delete Week off group
      | WOName |
      | WOSS1  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_1 | SS_1 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | WOSS1  | Sunday  | None    |                |                 |               | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_1   |                |                |            | WOSS1        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_1   |
    Then Validate code = "WO" in shift assigned for userid = "SS_1" and Month = "January" and Year = "2023"
      | Validation   |
      | 1,8,15,22,29 |

  @SS_2
  Scenario: Week off group configuration - Off day1 = Monday.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_2   |
    And Delete Week off group
      | WOName |
      | WOSS2  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_2 | SS_2 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | WOSS2  | Monday  | None    |                |                 |               | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_2   |                |                |            | WOSS2        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_2   |
    Then Validate code = "WO" in shift assigned for userid = "SS_2" and Month = "January" and Year = "2023"
      | Validation   |
      | 2,9,16,23,30 |

  @SS_3
  Scenario: Week off group configuration - Off day1 = Sunday AND Off day2 = Monday on week = W1.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_3   |
    And Delete Week off group
      | WOName |
      | WOSS3  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_3 | SS_3 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | WOSS3  | Sunday  | Monday  | W1             |                 |               | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_3   |                |                |            | WOSS3        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_3   |
    Then Validate code = "WO" in shift assigned for userid = "SS_3" and Month = "January" and Year = "2023"
      | Validation     |
      | 1,2,8,15,22,29 |

  @SS_4
  Scenario: Week off group configuration - Off day1 = Sunday AND Off day2 = Monday on week = ALL.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_4   |
    And Delete Week off group
      | WOName |
      | WOSS4  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_4 | SS_4 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | WOSS4  | Sunday  | Monday  | ALL            |                 |               | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_4   |                |                |            | WOSS4        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_4   |
    Then Validate code = "WO" in shift assigned for userid = "SS_4" and Month = "January" and Year = "2023"
      | Validation                |
      | 1,2,8,9,15,16,22,23,29,30 |

  @SS_5
  Scenario: Week off group configuration - Off day1 = Sunday AND Week off rotation enable and count = 8
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_5   |
    And Delete Week off group
      | WOName |
      | WOSS5  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_5 | SS_5 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | validation         |
      | WOSS5  | Sunday  | None    |                | True            |             8 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_5   |                |                |            | WOSS5        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_5   |
    Then Validate code = "WO" in shift assigned for userid = "SS_5" and Month = "January" and Year = "2023"
      | Validation |
      | 3,11,19,27 |

  @SS_6
  Scenario: Week off group configuration - Off day1 = Sunday AND Auto Week Off Assignment = Enable, weekly basis
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_6   |
    And Delete Week off group
      | WOName |
      | WOSS6  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_6 | SS_6 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | AutoWeekOffAssignment | AutoWeekOffAssignmentBasis | validation         |
      | WOSS6  | Sunday  | None    |                |                 |               | True                  | Weekly Basis               | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_6   |                |                |            | WOSS6        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_6   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | SS_6   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | SS_6   |   01012023 |     090000 |
      | SS_6   |   01012023 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | SS_6   |
    Then Validate code = "WO" in shift assigned for userid = "SS_6" and Month = "January" and Year = "2023"
      | Validation |
      |          2 |

  @SS_7
  Scenario: Week off group configuration - Off day1 = Sunday AND Auto Week Off Assignment = Enable, Monthly basis
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_7   |
    And Delete Week off group
      | WOName |
      | WOSS7  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_7 | SS_7 |               1 |         1 |               1 |                  1 |
    When Create Week Off Group
      | WOName | OffDay1 | OffDay2 | OffDay2OnWeeks | WeekOffRotation | RotationCount | AutoWeekOffAssignment | AutoWeekOffAssignmentBasis | validation         |
      | WOSS7  | Sunday  | None    |                |                 |               | True                  | Monthly Basis              | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_7   |                |                |            | WOSS7        | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_7   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | SS_7   |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | SS_7   |   01012023 |     090000 |
      | SS_7   |   01012023 |     180000 |
      | SS_7   |   02012023 |     090000 |
      | SS_7   |   02012023 |     180000 |
      | SS_7   |   03012023 |     090000 |
      | SS_7   |   03012023 |     180000 |
      | SS_7   |   04012023 |     090000 |
      | SS_7   |   04012023 |     180000 |
      | SS_7   |   05012023 |     090000 |
      | SS_7   |   05012023 |     180000 |
      | SS_7   |   06012023 |     090000 |
      | SS_7   |   06012023 |     180000 |
      | SS_7   |   07012023 |     090000 |
      | SS_7   |   07012023 |     180000 |
      | SS_7   |   08012023 |     090000 |
      | SS_7   |   08012023 |     180000 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | SS_7   |
    Then Validate code = "WO" in shift assigned for userid = "SS_7" and Month = "January" and Year = "2023"
      | Validation |
      |       9,10 |

  #****************************** HOLIDAY GROUP **********************************************************************
  @SS_8
  Scenario: Holiday schedule AND holiday count = 1
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_8   |
    And Delete Holiday Schedule
      | HSName |
      | HSSS8  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_8 | SS_8 |               1 |         1 |               1 |                  1 |
    When Create Holiday Schedule "HSSS8"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 26/01/2023 | 26/01/2023 | RepublicDay | False        |
    And Create user from user configuration
      | userid | name | HolidaySchedule | Validation         |
      | SS_8   | SS_8 | HSSS8           | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_8   |
    Then Validate code = "PH" in shift assigned for userid = "SS_8" and Month = "January" and Year = "2023"
      | Validation |
      |         26 |

  @SS_9
  Scenario: Holiday schedule AND holiday count = 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_9   |
    And Delete Holiday Schedule
      | HSName |
      | HSSS9  |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_9 | SS_9 |               1 |         1 |               1 |                  1 |
    When Create Holiday Schedule "HSSS9"
      | FromDate   | ToDate     | HolidayName | DeviceSynced |
      | 14/01/2023 | 14/01/2023 | Uttrayan    | True         |
      | 26/01/2023 | 26/01/2023 | RepublicDay | False        |
    And Create user from user configuration
      | userid | name | HolidaySchedule | Validation         |
      | SS_9   | SS_9 | HSSS9           | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_9   |
    Then Validate code = "PH" in shift assigned for userid = "SS_9" and Month = "January" and Year = "2023"
      | Validation |
      |      14,26 |

  @SS_10
  Scenario: Holiday schedule AND holiday count = 1 and holidays for 2 days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_10  |
    And Delete Holiday Schedule
      | HSName |
      | HSSS10 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_10 | SS_10 |               1 |         1 |               1 |                  1 |
    When Create Holiday Schedule "HSSS10"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 26/01/2023 | 27/01/2023 | RepublicConnect | True         |
    And Create user from user configuration
      | userid | name  | HolidaySchedule | Validation         |
      | SS_10  | SS_10 | HSSS10          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_10  |
    Then Validate code = "PH" in shift assigned for userid = "SS_10" and Month = "January" and Year = "2023"
      | Validation |
      |      26,27 |

  #****************************** RESTRICTED HOLIDAY GROUP **********************************************************************
  @SS_12
  Scenario: Restricted Holiday Allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_12  |
    And Delete Holiday Schedule
      | HSName |
      | HSSS12 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_12 | SS_12 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | SS_12  |                          1 | admin        |    1 |
    When Create Holiday Schedule "HSSS12"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 23/01/2025 | 24/01/2025 | RepublicConnect | True         |
    And Create Restricted Holidays for Holiday Schedule "HSSS12"
      | Date       | RestrictedHolidayName |
      | 22/01/2025 | ConnectOnRepublic     |
    And Create user from user configuration
      | userid | name  | HolidaySchedule | Validation         |
      | SS_12  | SS_12 | HSSS12          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2025"
      | UserID |
      | SS_12  |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | R1      | R1        | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "ShiftLG1" with Pro-rata "False"
      | LeaveID |
      | R1      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_12  |                |                | ShiftLG1   |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | days | leave-code | period | month   | year | remark |
      | SS_12  |          0 |           0 |    1 | R1         |      0 | January | 2025 | credit |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | SS_12    | admin    | Welcome SS_12 |
    Then Apply Leave Application from ESS
      | FromDate   | ToDate     | Leave   | Validation                   |
      | 22/01/2025 | 22/01/2025 | R1 - R1 | No more absent records exist |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date   |
      |        1 | ApprovedRequest | SA    | SS_12  | 22/01/2025 | 22/01/2025 |

  @SS_13
  Scenario: Restricted Holiday Not allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_13  |
    And Delete Holiday Schedule
      | HSName |
      | HSSS13 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_13 | SS_13 |               1 |         1 |               1 |                  1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | SS_13  |                          1 | admin        |    1 |
    When Create Holiday Schedule "HSSS13"
      | FromDate   | ToDate     | HolidayName     | DeviceSynced |
      | 23/01/2025 | 24/01/2025 | RepublicConnect | True         |
    And Create Restricted Holidays for Holiday Schedule "HSSS13"
      | Date       | RestrictedHolidayName |
      | 22/01/2025 | ConnectOnRepublic     |
    And Create user from user configuration
      | userid | name  | HolidaySchedule | Validation         |
      | SS_13  | SS_13 | HSSS13          | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2025"
      | UserID |
      | SS_13  |
    And Create Leave
      | LeaveID | LeaveName | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | R2      | R2        | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "ShiftLG2" with Pro-rata "False"
      | LeaveID |
      | R2      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | SS_13  |                |                | ShiftLG2   |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | days | leave-code | period | month   | year | remark |
      | SS_13  |          0 |           0 |    1 | R2         |      0 | January | 2025 | credit |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | SS_13    | admin    | Welcome SS_13 |
    Then Apply Leave Application from ESS
      | FromDate   | ToDate     | Leave   | Validation                                       |
      | 21/01/2025 | 21/01/2025 | R2 - R2 | Restricted Holiday is not declared for this date |

  #********************************** CHANGE SCHEDULE *********************************************************
  @SS_14
  Scenario: Change schedule Temporary
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_14  |
    And Delete "SS_SS141" shift schedule
    And Delete "SA" shift
    And Delete "SS_SS142" shift schedule
    And Delete "SB" shift
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_14 | SS_14 |               1 |         1 |               1 |                  1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | SA      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
      | SB      | 20:00     | 04:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "SS_SS141" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SA      |               7 |
    And Create Shift Schedule "SS_SS142" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SB      |               7 |
    And Create user from user configuration
      | userid | ShiftSchedule | Validation         |
      | SS_14  | SS_SS141      | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_14  |
    And Change shift schedule from Shift and Schedule Module
      | ChangeType | FromDate   | ToDate     | ScheduleName | StartShiftID | SelectUsers | UserIDs |
      | Temporary  | 06/01/2023 | 15/01/2023 | SS_SS142     | SB           | User Wise   | SS_14   |
    Then Validate code = "SB" in shift assigned for userid = "SS_14" and Month = "January" and Year = "2023"
      | Validation                |
      | 6,7,8,9,10,11,12,13,14,15 |
    Then Validate code = "SA" in shift assigned for userid = "SS_14" and Month = "January" and Year = "2023"
      | Validation                                                |
      | 1,2,3,4,5,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 |

  @SS_15
  Scenario: Change schedule Permanent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_15  |
    And Delete "SS_SS151" shift schedule
    And Delete "SC" shift
    And Delete "SS_SS152" shift schedule
    And Delete "SD" shift
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_15 | SS_15 |               1 |         1 |               1 |                  1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | SC      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
      | SD      | 20:00     | 04:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "SS_SS151" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SC      |               7 |
    And Create Shift Schedule "SS_SS152" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SD      |               7 |
    And Create user from user configuration
      | userid | ShiftSchedule | Validation         |
      | SS_15  | SS_SS151      | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_15  |
    And Change shift schedule from Shift and Schedule Module
      | ChangeType | FromDate   | ToDate | ScheduleName | StartShiftID | SelectUsers | UserIDs |
      | Permanent  | 06/01/2023 |        | SS_SS152     | SD           | User Wise   | SS_15   |
    Then Validate code = "SD" in shift assigned for userid = "SS_15" and Month = "January" and Year = "2023"
      | Validation                                                                |
      | 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 |
    Then Validate code = "SC" in shift assigned for userid = "SS_15" and Month = "January" and Year = "2023"
      | Validation |
      |  1,2,3,4,5 |

  #****************************************************** CHANGE WEEK OFF ******************************************************
  @SS_16
  Scenario: Change WEEK OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_16  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_16 | SS_16 |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_16  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2023"
      | UserID |
      | SS_16  |
    And Change Week Off from shift and schedule module
      | CurrentWeekOffDate | NewWeekOffDate | SelectUsers | UserIDs | validation                                   |
      | 15/01/2023         | 16/01/2023     | User Wise   | SS_16   | You need to run monthly process for Jan-2023 |
    Then Validate code = "WO" in shift assigned for userid = "SS_16" and Month = "January" and Year = "2023"
      | Validation |
      |         16 |

  #*************************************************** Manual Schedule Import ******************************************************
  @SS_17
  Scenario Outline: Imoprt Manual Schedule from xls
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | SS_17  |
    And Delete "SS_SS171" shift schedule
    And Delete "SE" shift
    And Delete "SS_SS172" shift schedule
    And Delete "SF" shift
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | SS_17 | SS_17 |               1 |         1 |               1 |                  1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | SE      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
      | SF      | 20:00     | 04:00   | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "SS_SS171" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SE      |               7 |
    And Create Shift Schedule "SS_SS172" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | SF      |               7 |
    And Create user from user configuration
      | userid | ShiftSchedule | Validation         |
      | SS_17  | SS_SS171      | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2023"
      | UserID |
      | SS_17  |
    When Import Data "Shift Schedule"
      | UserID | Shift ID/Day Marking | FROM Date  | TO Date    |
      | SS_17  | SF                   | 03/01/2023 | 05/01/2023 |
    And Import "<File Format>" and check Imported Data for "Shift Schedule"
      | UserID | Result  | Description            |
      | SS_17  | Success | Shift updated/modified |
    Then Validate code = "SF" in shift assigned for userid = "SS_17" and Month = "January" and Year = "2023"
      | Validation |
      |      3,4,5 |
    Then Validate code = "SE" in shift assigned for userid = "SS_17" and Month = "January" and Year = "2023"
      | Validation                                                                    |
      | 1,2,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |
  #****************************************************** Manage shifts Import ******************************************************
  #@19
  #Scenario: Manage shift via import using xls
    #Given Open cosec web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Create shift in Shift Configuration
      #| ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      #| GS      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
      #| NS      | 15:00     | 23:00   | 04:00   | 08:00   | Saved Successfully |
    #And Create Shift Schedule "Schedule1" with Start Date "01/01/2010"
      #| ShiftID | RepeatShiftDays |
      #| GS      |               7 |
      #| NS      |               7 |
        #And Create user from user configuration
      #| userid  | ShiftSchedule | Validation         |
      #| Manualschedule  | Schedule1    | Saved Successfully |
    #
    #And Run Shift Process for Month = "January" and Year = "2023"
      #| UserID         |
      #| Manualschedule |
    #When import sheet from Manage shifts	 Page
      #| File format | Validation         |
      #| xls         | Saved Successfully |
    #Then Validate code = "NS" in shift assigned for userid = "MS1" and Month = "January" and Year = "2023"
      #| Validation |
      #|          2 |
      #|          3 |
      #|          4 |
    #And Delete user via API
      #| UserID |
      #| MS1    |
    #And Delete Shift Schedule
      #| GroupName |
      #| Schedule1 |
    #And Delete Shift
      #| Shift name |
      #| GS         |
      #| NS         |
#
  #@20
  #Scenario: Manage shift via import using csv
    #Given Open cosec web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Create shift in Shift Configuration
      #| ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      #| GS      | 09:00     | 18:00   | 04:00   | 08:00   | Saved Successfully |
      #| NS      | 15:00     | 23:00   | 04:00   | 08:00   | Saved Successfully |
    #And Create Shift Schedule "Schedule1" with Start Date "01/01/2010"
      #| ShiftID | RepeatShiftDays |
      #| GS      |               7 |
      #| NS      |               7 |
      #And Create user from user configuration
      #| userid  | ShiftSchedule | Validation         |
      #| Manualschedule  | Schedule1    | Saved Successfully |
    #And Run Shift Process for Month = "January" and Year = "2023"
      #| UserID         |
      #| Manualschedule |
    #When import sheet from Manage shifts	 Page
      #| File format | Validation         |
      #| CSV         | Saved Successfully |
    #Then Validate code = "NS" in shift assigned for userid = "MS1" and Month = "January" and Year = "2023"
      #| Validation |
      #|          2 |
      #|          3 |
      #|          4 |
    #And Delete user via API
      #| UserID |
      #| MS1    |
    #And Delete Shift Schedule
      #| GroupName |
      #| Schedule1 |
    #And Delete Shift
      #| Shift name |
      #| GS         |
      #| NS         |
