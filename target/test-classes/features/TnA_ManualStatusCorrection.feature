@tag
Feature: T&A - Manual Status Correction
  I want to use this template for my feature file

  @MSC_1
  Scenario: Manual Status Marking = First Half Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ManStsCorrec |   01012024 |     080000 |
      | ManStsCorrec |   01012024 |     190000 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | First Half Absent   | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 | 08:00    | 19:00    | AB       | PR       | Manual Absent/Present Marking |

  @MSC_2
  Scenario: Manual Status Marking = Second Half Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ManStsCorrec |   01012024 |     080000 |
      | ManStsCorrec |   01012024 |     190000 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Second Half Absent  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 | 08:00    | 19:00    | PR       | AB       | Manual Absent/Present Marking |

  @MSC_3
  Scenario: Manual Status Marking = Full Day Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Set event via Event Set API
      | Userid       | event-date | event-time |
      | ManStsCorrec |   01012024 |     080000 |
      | ManStsCorrec |   01012024 |     190000 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Full Day Absent     | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 | 08:00    | 19:00    | AB       | AB       | Manual Absent/Present Marking |

  @MSC_4
  Scenario: Manual Status Marking = First Half Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | First Half Present  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | PR       | AB       | Manual Absent/Present Marking |

  @MSC_5
  Scenario: Manual Status Marking = Second Half Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Second Half Present | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | AB       | PR       | Manual Absent/Present Marking |

  @MSC_6
  Scenario: Manual Status Marking = Full Day Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Full Day Present    | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | PR       | PR       |        |

  @MSC_7
  Scenario: Manual Status Marking = Absent-Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | AB       | PR       | Manual Absent/Present Marking |

  @MSC_8
  Scenario: Manual Status Marking = Present-Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Present-Absent      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | PR       | AB       | Manual Absent/Present Marking |

  @MSC_10
  Scenario: Manual Status Marking = Full Day Present & Multiple Users
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID         |
      | U1ManStsCorrec |
      | U2ManStsCorrec |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | U1ManStsCorrec | U1ManStsCorrec |               1 |         1 |               1 |                  1 |
      | U2ManStsCorrec | U2ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID         |
      | U1ManStsCorrec |
      | U2ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID         |
      | U1ManStsCorrec |
      | U2ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs                       |
      | 01/01/2024 | 01/01/2024 | Full Day Present    | ByAutomation | User Wise   | U1ManStsCorrec,U2ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId         | Validation        |
      | U1ManStsCorrec | Process Completed |
      | U2ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "U1ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | PR       | PR       |        |
    And Daily Attendance View for userid "U2ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | PR       | PR       |        |

  @MSC_11
  Scenario: Manual Status Marking = Absent-Present & Multiple Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 03/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "03/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | AB       | PR       | Manual Absent/Present Marking |
      | 02/01/2024 |          |          | AB       | PR       | Manual Absent/Present Marking |
      | 03/01/2024 |          |          | AB       | PR       | Manual Absent/Present Marking |

  @MSC_12
  Scenario: Manual status marking on Weekoff day of user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |        1 |                |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                           |
      | ManStsCorrec | This User had Week-Off on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | WO       | WO       |        |

  @MSC_13
  Scenario: Manual status marking on Holiday day of user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |          |              1 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                          |
      | ManStsCorrec | This User had Holiday on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | PH       | PH       |        |

  @MSC_14
  Scenario: Leave = Full Day & Manual Status Marking = First Half Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  1 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | First Half Present  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                        |
      | ManStsCorrec | This User was on Leave for Full Day on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | ZB       | ZB       |        |

  @MSC_15
  Scenario: Leave = Second Half & Manual Status Marking = First Half Present
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  3 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | First Half Present  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | PR       | ZB       |        |

  @MSC_16
  Scenario: Leave = Second Half & Manual Status Marking = Second Half Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  3 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Second Half Absent  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                           |
      | ManStsCorrec | This User was on Leave for Second Half on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | AB       | ZB       | No Punches Available       |

  @MSC_17
  Scenario: Leave = First Half & Manual Status Marking = Full Day Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  2 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Full Day Absent     | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                          |
      | ManStsCorrec | This User was on Leave for First Half on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | ZB       | AB       |  No Punches Available      |

  @MSC_18
  Scenario: Leave = First Half & Manual Status Marking = Second Half Absent
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  2 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Second Half Absent  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation        |
      | ManStsCorrec | Process Completed |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark                        |
      | 01/01/2024 |          |          | ZB       | AB       | Manual Absent/Present Marking |

  @MSC_19
  Scenario: User Shift is not scheduled
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | First Half Present  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                        |
      | ManStsCorrec | This User's shift was not scheduled on 01/01/2024 |

  @MSC_20
  Scenario: User left the Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | joining-date | Leaving-date |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 | 01/01/2020   | 02/01/2024   |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | joining-date | Leaving-date |
      | ManStsCorrec | ManStsCorrec | 01/01/2020   | 02/01/2024   |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 03/01/2024 | 03/01/2024 | First Half Present  | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                    |
      | ManStsCorrec | This User left the organization on 02/01/2024 |

  @MSC_21
  Scenario: User has Weekoff and Holiday on same date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | ManStsCorrec | ManStsCorrec |               1 |         1 |               1 |                  1 |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |        1 |              1 |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                       |
      | ManStsCorrec | This User had Week-Off and Holiday on 01/01/2024 |
    Then Daily Attendance View for userid "ManStsCorrec" and period "Date" on "01/01/2024" and "01/01/2024"
      | Date       | First IN | Last OUT | 1st Half | 2nd Half | Remark |
      | 01/01/2024 |          |          | WO       | WO       |        |

  @MSC_22
  Scenario: User monthly attendance process done with close attendance period
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                               |
      | ManStsCorrec | This User's data is closed to be processed on 01/01/2024 |

  @MSC_23
  Scenario: User left the Organization & Attendance Period Closed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Create User via api
      | Id           | name         | joining-date | Leaving-date |
      | ManStsCorrec | ManStsCorrec | 01/01/2020   | 28/12/2023   |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                    |
      | ManStsCorrec | This User left the organization on 28/12/2023 |

  @MSC_24
  Scenario: User has Weekoff & Attendance Period Closed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |        1 |                |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                               |
      | ManStsCorrec | This User's data is closed to be processed on 01/01/2024 |

  @MSC_25
  Scenario: User has Holiday & Attendance Period Closed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |          |              1 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                               |
      | ManStsCorrec | This User's data is closed to be processed on 01/01/2024 |

  @MSC_26
  Scenario: User has WeekOff and Holiday & Attendance Period Closed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Change Shift via API
      | userid       | FromDt     | ToDt       | shift-id | week-off | public-holiday |
      | ManStsCorrec | 01/01/2024 | 01/01/2024 |          |        1 |              1 |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                               |
      | ManStsCorrec | This User's data is closed to be processed on 01/01/2024 |

  @MSC_27
  Scenario: User has Leave & Attendance Period Closed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID       |
      | ManStsCorrec |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | AtdCorrectionInClosedPeriod | validation         |
      | ManStsCorrec |                2 | False                       | Saved Successfully |
    And Create user from user configuration
      | userid       | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | MaxPunchesToBeConsidered | AttendancePlc | Validation         |
      | ManStsCorrec | True   | True      | True      | True      | True      | True               |                        2 | ManStsCorrec  | Saved Successfully |
    And Run Shift Process for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | ZB      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "MSCLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | ZB      |
    And Assign groups to user from user configuration
      | UserID       | ReportingGroup | ApprovalPolicy | LeaveGroup  | WeekOffGroup | Validation         |
      | ManStsCorrec |                |                | MSCLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid       | entry-type | credit-mode | days | accrual-policy | leave-code | period | month   | year | pro-rata | remark |
      | ManStsCorrec |          0 |           0 |   10 |              1 | ZB         |        | January | 2024 |          | credit |
    And Apply Leave Application via API
      | userid       | half-consideration | Start-date | end-date   | leave-code | return-transaction-id | appliedBy |
      | ManStsCorrec |                  1 | 01/01/2024 | 01/01/2024 | ZB         |                     1 | SA        |
    And Run Monthly Attendance Process with Close Attendance Period = "True" for Month = "January" and Year = "2024"
      | UserID       |
      | ManStsCorrec |
    When Manual Status correction done from TnA module
      | FromDt     | ToDt       | ManualStatusMarking | Remark       | SelectUsers | UserIDs      |
      | 01/01/2024 | 01/01/2024 | Absent-Present      | ByAutomation | User Wise   | ManStsCorrec |
    And Verify Manual Correction Status from TnA module
      | UserId       | Validation                                               |
      | ManStsCorrec | This User's data is closed to be processed on 01/01/2024 |
