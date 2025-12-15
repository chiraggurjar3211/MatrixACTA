@Alert
Feature: Default

  @ASA-16
  Scenario: Alert - User - Missing InOut User and Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID  |
      | INUSER  |
      | OUTUSER |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email              |
      |   9898981231 | INUSER@gmail.com   |
      |   9898981232 | OUTUSER@gmail.com  |
      |   9898981233 | InOutRIC@gmail.com |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email     |
      | INUSER   | INUSER   |               1 |         1 |               1 |                  1 |    9898981231 | INUSER@gmail.com   |
      | OUTUSER  | OUTUSER  |               1 |         1 |               1 |                  1 |    9898981232 | OUTUSER@gmail.com  |
      | InOutRIC | InOutRIC |               1 |         1 |               1 |                  1 |    9898981233 | InOutRIC@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | InOutReporting   |        1 | InOutRIC |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID  | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | INUSER  | InOutReporting |                |            |              | Saved Successfully |
      | OUTUSER | InOutReporting |                |            |              | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | IO      |        -8 |       0 | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "IOSchedule" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | IO      |               7 |
    And Create user from user configuration
      | userid  | ShiftSchedule | Validation         |
      | INUSER  | IOSchedule    | Saved Successfully |
      | OUTUSER | IOSchedule    | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | INUSER   |
      | OUTUSER  |
      | InOutRIC |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | INUSER   |
      | OUTUSER  |
      | InOutRIC |
    And Set Alert Configuration "Missing In Punch - Users"
    And Update Alert Configuration "Missing In Punch - Users"
      | PostShiftStart |
      |            484 |
    And Assign User in Alert "Missing In Punch - Users"
      | UserID |
      | INUSER |
    And Set Alert Configuration "Missing In Punch - Group Incharge"
    And Update Alert Configuration "Missing In Punch - Group Incharge"
      | PostShiftStart |
      |            484 |
    And Assign User in Alert "Missing In Punch - Group Incharge"
      | UserID   |
      | InOutRIC |
    And Set Alert Configuration "Missing Out Punch - Users"
    And Update Alert Configuration "Missing Out Punch - Users"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            4 |
    And Assign User in Alert "Missing Out Punch - Users"
      | UserID  |
      | OUTUSER |
    And Set Alert Configuration "Missing Out Punch - Group Incharge"
    And Update Alert Configuration "Missing Out Punch - Group Incharge"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            4 |
    And Assign User in Alert "Missing Out Punch - Group Incharge"
      | UserID   |
      | InOutRIC |
    And Start Stop Service from Command Propmt
      | Service      | Status |
      | AlertService | stop   |
      | AlertService | start  |
    When Wait for "5" min
    Then Validate SMS and Email Alert for Users
      | userid   | mobilenumber | Email              | SMSCount | EmailCount |
      | INUSER   |   9898981231 | INUSER@gmail.com   |        1 |          1 |
      | OUTUSER  |   9898981232 | OUTUSER@gmail.com  |        1 |          1 |
      | InOutRIC |   9898981233 | InOutRIC@gmail.com |        2 |          2 |

  @ASA-8
  Scenario: Alert - User - 11New Joining - Confirmation & 12Validity/Expiry Date & 14Birthday Greetings & 1516Health Declaration Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID         |
      | COS_11         |
      | COS_11_Alert   |
      | COS_14         |
      | COS_14_RIC1    |
      | COS_15         |
      | COS_15_RIC1    |
      | COS_15_LinkESS |
      | COS_16         |
      | COS_16_RIC1    |
      | COS_16_LinkESS |
    And Delete SMS and Mail log
      | mobilenumber | Email                  |
      |   1100000011 | cos11Alert@gmail.com   |
      |   1400000001 | cos14@gmail.com        |
      |   1400000011 | cos14ric1@gmail.com    |
      |   1500000001 | cos15@gmail.com        |
      |   1500000011 | cos15ric1@gmail.com    |
      |   1500000021 | cos15LinkESS@gmail.com |
      |   1600000001 | cos16@gmail.com        |
      |   1600000011 | cos16ric1@gmail.com    |
      |   1600000021 | cos16LinkESS@gmail.com |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email         |
      | COS_11         | COS_11         |               1 |         1 |               1 |                  1 |    1100000001 | cos11@gmail.com        |
      | COS_11_Alert   | COS_11_Alert   |               1 |         1 |               1 |                  1 |    1100000011 | cos11Alert@gmail.com   |
      | COS_14         | COS_14         |               1 |         1 |               1 |                  1 |    1400000001 | cos14@gmail.com        |
      | COS_14_RIC1    | COS_14_RIC1    |               1 |         1 |               1 |                  1 |    1400000011 | cos14ric1@gmail.com    |
      | COS_15         | COS_15         |               1 |         1 |               1 |                  1 |    1500000001 | cos15@gmail.com        |
      | COS_15_RIC1    | COS_15_RIC1    |               1 |         1 |               1 |                  1 |    1500000011 | cos15ric1@gmail.com    |
      | COS_15_LinkESS | COS_15_LinkESS |               1 |         1 |               1 |                  1 |    1500000021 | cos15LinkESS@gmail.com |
      | COS_16         | COS_16         |               1 |         1 |               1 |                  1 |    1600000001 | cos16@gmail.com        |
      | COS_16_RIC1    | COS_16_RIC1    |               1 |         1 |               1 |                  1 |    1600000011 | cos16ric1@gmail.com    |
      | COS_16_LinkESS | COS_16_LinkESS |               1 |         1 |               1 |                  1 |    1600000021 | cos16LinkESS@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_15 | COS_15_LinkESS | Saved Successfully |
      | SA_COS_16 | COS_16_LinkESS | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS14RICGrp      |        1 | COS_14_RIC1 |      |      |      |      | Saved Successfully |
      | COS15RICGrp      |        1 | COS_15_RIC1 |      |      |      |      | Saved Successfully |
      | COS16RICGrp      |        1 | COS_16_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_14 | COS14RICGrp    |                |            |              | Saved Successfully |
      | COS_15 | COS15RICGrp    |                |            |              | Saved Successfully |
      | COS_16 | COS16RICGrp    |                |            |              | Saved Successfully |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And ESS Roles and Rights set from User Module
      | PageRights       | value |
      | Health Records   | True  |
      | Self Declaration | True  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_15 |
      | COS_16 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_15 |
      | COS_16 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_15 |          0 |     090000 |
    And Create User via api
      | Id     | name   | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_11 | COS_11 |           -3 |               |         |             |                 |                        |             |                 |
      | COS_14 | COS_14 |              |             0 |         |             |                 |                        |             |                 |
    And Update Alert Configuration "New Joining - Confirmation"
      | Confirmation | SetReminderDaysbeforeConfirmation | ReminderTime | UserID       |
      |            5 |                                 2 |            4 | COS_11_Alert |
    And Set Alert Configuration "New Joining - Confirmation"
    And Set Alert Configuration "Birthday Greetings"
    And Set Send Alert to parameters for "Birthday Greetings" Alert
    And Update Alert Configuration "Birthday Greetings"
      | AdditionalRecipients | ScheduleTime |
      | mayank@matrix.com    |            4 |
    And Assign User in Alert "Birthday Greetings"
      | UserID |
      | COS_14 |
    And Update Alert Configuration "Health Declaration Pending"
      | SendAlertAsPer | ScheduleTime |
      | Schedule Time  |            2 |
    And Set Alert Configuration "Health Declaration Pending"
    And Set Send Alert to parameters for "Health Declaration Pending" Alert
    And Assign User in Alert "Health Declaration Pending"
      | UserID |
      | COS_15 |
      | COS_16 |
    When Wait for "5" min
    Then Validate SMS and Email Alert for Users
      | userid         | mobilenumber | Email                  | SMSCount | EmailCount |
      | COS_11_Alert   |   1100000011 | cos11Alert@gmail.com   |        1 |          1 |
      | COS_14         |   1400000001 | cos14@gmail.com        |        1 |          1 |
      | COS_15         |   1500000001 | cos15@gmail.com        |        1 |          1 |
      | COS_15_RIC1    |   1500000011 | cos15ric1@gmail.com    |        1 |          1 |
      | COS_15_LinkESS |   1500000021 | cos15LinkESS@gmail.com |        1 |          1 |
      | COS_16         |   1600000001 | cos16@gmail.com        |        0 |          0 |
      | COS_16_RIC1    |   1600000011 | cos16ric1@gmail.com    |        0 |          0 |
      | COS_16_LinkESS |   1600000021 | cos16LinkESS@gmail.com |        1 |          1 |
    And Delete user via API
      | UserID |
      | COS_15 |
      | COS_16 |

  @ASA-51
  Scenario: Alert - User - Validity/Expiry Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID      |
      | COS_12      |
      | COS_12_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   1200000001 | cos12@gmail.com     |
      |   1200000011 | cos12ric1@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_12      | COS_12      |               1 |         1 |               1 |                  1 |    1200000001 | cos12@gmail.com     |
      | COS_12_RIC1 | COS_12_RIC1 |               1 |         1 |               1 |                  1 |    1200000011 | cos12ric1@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS12RICGrp      |        1 | COS_12_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_12 | COS12RICGrp    |                |            |              | Saved Successfully |
    And Create User via api
      | Id     | name   | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_12 | COS_12 |              |               |    1211 |           2 |            1212 |                      2 |        1213 |               1 |
    And Set Alert Configuration "Validity/Expiry Date"
    And Set Send Alert to parameters for "Validity/Expiry Date" Alert
    And Update Alert Configuration "Validity/Expiry Date"
      | SendAlertFor | Document        | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      | True         | Visa            |                2 |            2 | False          |                    1 |
      | True         | Driving License |                2 |            2 | False          |                    1 |
      | True         | Passport        |                2 |            2 | True           |                    1 |
    And Assign User in Alert "Validity/Expiry Date"
      | UserID |
      | COS_12 |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount |
      | COS_12      |   1200000001 | cos12@gmail.com     |        3 |          3 |
      | COS_12_RIC1 |   1200000011 | cos12ric1@gmail.com |        3 |          3 |

  @ASA-2
  Scenario: Alert - User - User Events - Event Selection = First
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_1  |
    And Delete SMS and Mail log
      | mobilenumber | Email          |
      |   1000000001 | cos1@gmail.com |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | COS_1 | COS_1 |               1 |         1 |               1 |                  1 |    1000000001 | cos1@gmail.com |
    And Assign users to device from API
      | Userid |
      | COS_1  |
    And Set Alert Configuration "User Events"
    And Update Alert Configuration "User Events"
      | EventSelection |
      | First          |
    And Assign User in Alert "User Events"
      | UserID |
      | COS_1  |
    When Generate User Event "2" times for User via API
      | UserID |
      | COS_1  |
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email          | SMSCount | EmailCount |
      | COS_1  |   1000000001 | cos1@gmail.com |        1 |          1 |

  @ASA-3
  Scenario: Alert - User - User Events - Event Selection = All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_2  |
    And Delete SMS and Mail log
      | mobilenumber | Email          |
      |   2000000001 | cos2@gmail.com |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email |
      | COS_2 | COS_2 |               1 |         1 |               1 |                  1 |    2000000001 | cos2@gmail.com |
    And Assign users to device from API
      | Userid |
      | COS_2  |
    And Set Alert Configuration "User Events"
    And Update Alert Configuration "User Events"
      | EventSelection |
      | All            |
    And Assign User in Alert "User Events"
      | UserID |
      | COS_2  |
    When Generate User Event "2" times for User via API
      | UserID |
      | COS_2  |
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email          | SMSCount | EmailCount |
      | COS_2  |   2000000001 | cos2@gmail.com |        2 |          2 |

  @ASA-4
  Scenario: Alert - User - User Allowed - Alert Sent on within given time period
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID      |
      | COS_7       |
      | COS_7_Alert |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   7000000011 | cos7Alert@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_7       | COS_7       |               1 |         1 |               1 |                  1 |    7000000001 | cos7@gmail.com      |
      | COS_7_Alert | COS_7_Alert |               1 |         1 |               1 |                  1 |    7000000011 | cos7Alert@gmail.com |
    And Assign users to device from API
      | Userid |
      | COS_7  |
    And Update Alert Configuration "User Allowed"
      | StartTime | EndTime | SendAlertToUser |
      |        -2 |       2 | COS_7_Alert     |
    And Set Alert Configuration "User Allowed"
    And Assign User in Alert "User Allowed"
      | UserID |
      | COS_7  |
    When Generate User Event "1" times for User via API
      | UserID |
      | COS_7  |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount |
      | COS_7_Alert |   7000000011 | cos7Alert@gmail.com |        1 |          1 |

  @ASA-5
  Scenario: Alert - User - User Allowed - Alert is not Sent on Outside given time period
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID      |
      | COS_8       |
      | COS_8_Alert |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   8000000011 | cos8Alert@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_8       | COS_8       |               1 |         1 |               1 |                  1 |    8000000001 | cos8@gmail.com      |
      | COS_8_Alert | COS_8_Alert |               1 |         1 |               1 |                  1 |    8000000011 | cos8Alert@gmail.com |
    And Assign users to device from API
      | Userid |
      | COS_8  |
    And Update Alert Configuration "User Allowed"
      | StartTime | EndTime | SendAlertToUser |
      |        -5 |      -3 | COS_8_Alert     |
    And Set Alert Configuration "User Allowed"
    And Assign User in Alert "User Allowed"
      | UserID |
      | COS_8  |
    When Generate User Event "1" times for User via API
      | UserID |
      | COS_8  |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount |
      | COS_8_Alert |   8000000011 | cos8Alert@gmail.com |        0 |          0 |

  @ASA-6
  Scenario: Alert - User - Self-Enrollment Notification
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_13 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   1300000001 | cos13@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  | pin |
      | COS_13 | COS_13 |               1 |         1 |               1 |                  1 |    1300000001 | cos13@gmail.com | 133 |
    And Set Alert Configuration "Self-Enrollment Notification"
    When Create user from user configuration
      | userid | EnableSelfEnrollment | Validation         |
      | COS_13 | True                 | Saved Successfully |
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_13 |   1300000001 | cos13@gmail.com |        1 |          1 |
    And Create user from user configuration
      | userid | EnableSelfEnrollment | Validation         |
      | COS_13 | False                | Saved Successfully |

  @ASA-7
  Scenario: Alert - User - Exceeding Health Declaration Parameters
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID         |
      | COS_17         |
      | COS_17_RIC1    |
      | COS_17_LinkESS |
    And Delete SMS and Mail log
      | mobilenumber | Email                  |
      |   1700000011 | cos17ric1@gmail.com    |
      |   1700000021 | cos17LinkESS@gmail.com |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email         |
      | COS_17         | COS_17         |               1 |         1 |               1 |                  1 |    1700000001 | cos17@gmail.com        |
      | COS_17_RIC1    | COS_17_RIC1    |               1 |         1 |               1 |                  1 |    1700000011 | cos17ric1@gmail.com    |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |    1700000021 | cos17LinkESS@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS17RICGrp      |        1 | COS_17_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_17 | COS17RICGrp    |                |            |              | Saved Successfully |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          98.0 | True           | Any one           | Saved Successfully |
    And ESS Roles and Rights set from User Module
      | PageRights       | value |
      | Health Records   | True  |
      | Self Declaration | True  |
    And Set Alert Configuration "Exceeding Health Declaration Parameters"
    And Set Send Alert to parameters for "Exceeding Health Declaration Parameters" Alert
    And Assign User in Alert "Exceeding Health Declaration Parameters"
      | UserID      |
      | COS_17_RIC1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_17 |                          1 | admin        |    1 |
    And Declare Temperature and Symptoms for Self Declaration of ESSUser from API
      | UserID | Temperature | Symptoms | declaration-date |
      | COS_17 |        99.0 |        1 |                0 |
    Then Validate SMS and Email Alert for Users
      | userid         | mobilenumber | Email                  | SMSCount | EmailCount |
      | COS_17_RIC1    |   1700000011 | cos17ric1@gmail.com    |        1 |          1 |
      | COS_17_LinkESS |   1700000021 | cos17LinkESS@gmail.com |        1 |          1 |

  @ASA-9
  Scenario: Alert - System - Database Backup
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_21 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2100000001 | cos21@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_21 | COS_21 |               1 |         1 |               1 |                  1 |    2100000001 | cos21@gmail.com |
    And Set Alert Configuration "Database Backup"
    And Assign User in Alert "Database Backup"
      | UserID |
      | COS_21 |
    When Create Task scheduler "Database Backup"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime |
      | DBBackup      | Monthly     |                  0 |               0 |
    And Wait for "1" min
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_21 |   2100000001 | cos21@gmail.com |        1 |          1 |
    And Delete Task Scheduler
      | SchedulerName |
      | DBBackup      |

  @ASA-10
  Scenario: Alert - System - Password Generated
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_22 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2200000001 | cos22@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  | date-of-birth |
      | COS_22 | COS_22 |               1 |         1 |               1 |                  1 |    2200000001 | cos22@gmail.com |             1 |
    And Set Alert Configuration "Password Generated"
    When Generate Password via API
      | UserID | BirthDate |
      | COS_22 |         1 |
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_22 |   2200000001 | cos22@gmail.com |        1 |          1 |

  @ASA-11
  Scenario: Alert - System - OTP Generated
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_23 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2300000001 | cos23@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_23 | COS_23 |               1 |         1 |               1 |                  1 |    2300000001 | cos23@gmail.com |
    And Set Alert Configuration "OTP Generated"
    And Login Authentication Mode set "Password OR OTP" in GP
    And Logout from Cosec Web
    When Enter "COS_23" and click on OTP
    And Refresh page
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_23 |   2300000001 | cos23@gmail.com |        1 |          1 |

  @ASA-12
  Scenario: Alert - System - Identification Server Inactive
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_24 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2400000001 | cos24@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_24 | COS_24 |               1 |         1 |               1 |                  1 |    2400000001 | cos24@gmail.com |
    And Update Alert Configuration "Identification Server Inactive"
      | StartTime | EndTime | TolerancePeriodMin | UserID |
      | 00:00     | 23:59   |                  0 | COS_24 |
    And Set Alert Configuration "Identification Server Inactive"
    When Start Stop Service from Command Propmt
      | Service              | Status |
      | IdentificationServer | stop   |
    And Wait for "1.5" min
    Then Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_24 |   2400000001 | cos24@gmail.com |        1 |          1 |
    And Start Stop Service from Command Propmt
      | Service              | Status |
      | IdentificationServer | start  |

  @ASA-13
  Scenario: Alert - System - Pending Applications For Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID      |
      | COS_25      |
      | COS_25_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   2500000001 | cos25@gmail.com     |
      |   2500000011 | cos25ric1@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_25      | COS_25      |               1 |         1 |               1 |                  1 |    2500000001 | cos25@gmail.com     |
      | COS_25_RIC1 | COS_25_RIC1 |               1 |         1 |               1 |                  1 |    2500000011 | cos25ric1@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS25RICGrp      |        1 | COS_25_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_25 | COS25RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_25 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_25 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_25 |
    And Set Alert Configuration "Pending Applications For Approval"
    And Update Alert Configuration "Pending Applications For Approval"
      | SetReminder | ReminderTime |
      | Daily       |            2 |
    And Assign User in Alert "Pending Applications For Approval"
      | UserID      |
      | COS_25_RIC1 |
    When Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_25 |            0 |            0900 |            1800 | GS    | COS_25    |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   2500000001 | cos25@gmail.com     |
      |   2500000011 | cos25ric1@gmail.com |
    And Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount |
      | COS_25_RIC1 |   2500000011 | cos25ric1@gmail.com |        1 |          1 |

  @ASA-14
  Scenario: Alert - System - Login Account Locked
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Delete user via API
      | UserID |
      | COS_26 |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2600000001 | cos26@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_26 | COS_26 |               1 |         1 |               1 |                  1 |    2600000001 | cos26@gmail.com |
    And Set Alert Configuration "Login Account Locked"
    And Login Authentication Mode set "Password" in GP
    And Set Lock Account for Invalid Attempts "True" and Maximum Invalid Attempts "1" and Auto Unlock Timer (Min)"1" in GP
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | COS_26 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation                                                   |
      | COS_26   | admin12  | Maximum Invalid attempts reached. Please try after 1 minutes |
      | COS_26   | admin12  | Account has been locked due to maximum Invalid attempts      |
    Then Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Validate SMS and Email Alert for Users
      | userid | mobilenumber | Email           | SMSCount | EmailCount |
      | COS_26 |   2600000001 | cos26@gmail.com |        1 |          1 |
    And Reset "Password Policy" page to default

  #@ASA-15
  #Scenario: Alert - System - APTA Auto Sign-In Configuration
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID  |
      #| COS_27  |
      #| COS_271 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email            |
      #|   2700000001 | cos27@gmail.com  |
      #|   2710000001 | cos271@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_27 | COS_27 |               1 |         1 |               1 |                  1 |    2700000001 | cos27@gmail.com |
    #And Set Alert Configuration "APTA Auto Sign-In Configuration"
    #When Send Alert APTA Auto Sign-In Configuration from Alert Configuration
      #| UserID |
      #| COS_27 |
    #And Create User via api
      #| Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      #| COS_271 | COS_271 |               1 |         1 |               1 |                  1 |    2710000001 | cos271@gmail.com |
    #Then Validate SMS and Email Alert for Users
      #| userid  | mobilenumber | Email            | SMSCount | EmailCount |
      #| COS_27  |   2700000001 | cos27@gmail.com  |        1 |          1 |
      #| COS_271 |   2710000001 | cos271@gmail.com |        1 |          1 |
#
  #@ASA-17
  #Scenario: Alert - T&A - Monthly Attendance
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| SA       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_41 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   4100000001 | cos41@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_41 | COS_41 |               1 |         1 |               1 |                  1 |    4100000001 | cos41@gmail.com |
    #And Set Alert Configuration "Monthly Attendance"
    #And Update Alert Configuration "Monthly Attendance"
      #| ShowMonthlyLeaveBal |
      #| True                |
    #And Assign User in Alert "Monthly Attendance"
      #| UserID |
      #| COS_41 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_41 |
    #When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_41 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_41 |   4100000001 | cos41@gmail.com |        1 |          1 |
#
  #@ASA-18
  #Scenario: Alert - T&A - Attendance Correction Application & Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_42      |
      #| COS_42_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   4200000001 | cos42@gmail.com     |
      #|   4200000011 | cos42ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_42      | COS_42      |               1 |         1 |               1 |                  1 |    4200000001 | cos42@gmail.com     |
      #| COS_42_RIC1 | COS_42_RIC1 |               1 |         1 |               1 |                  1 |    4200000011 | cos42ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_42      |                          1 | admin        |    1 |
      #| COS_42_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS42RICGrp      |        1 | COS_42_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_42 | COS42RICGrp    |                |            |              | Saved Successfully |
    #And Set Alert Configuration "Attendance Correction Application"
    #And Update Alert Configuration "Attendance Correction Application"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Attendance Correction Application"
      #| UserID      |
      #| COS_42_RIC1 |
    #And Set Alert Configuration "Attendance Correction Approval/Rejection"
    #And Assign User in Alert "Attendance Correction Approval/Rejection"
      #| UserID |
      #| COS_42 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_42 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_42 |
    #When Generate Attendance Correction Application via API
      #| userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      #| COS_42 |            0 |            0900 |            1800 | GS    | COS_42    |
    #And Approve Reject Attendance Correction Application via API
      #| userid | Verdict | remark         | ricID       | process-date |
      #| COS_42 |       1 | AtdCorApproved | COS_42_RIC1 |            0 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_42      |   4200000001 | cos42@gmail.com     |        1 |          1 |
      #| COS_42_RIC1 |   4200000011 | cos42ric1@gmail.com |        1 |          1 |
#
  #@ASA-19
  #Scenario: Alert - T&A - Attendance Correction Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_43 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   4300000001 | cos43@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_43 | COS_43 |               1 |         1 |               1 |                  1 |    4300000001 | cos43@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_43 |                          1 | admin        |    1 |
    #And Set Alert Configuration "Attendance Correction Approval/Rejection"
    #And Assign User in Alert "Attendance Correction Approval/Rejection"
      #| UserID |
      #| COS_43 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_43 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_43 |
    #And Generate Attendance Correction Application via API
      #| userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      #| COS_43 |            0 |            0900 |            1800 | GS    | COS_43    |
    #When Approve Reject Attendance Correction Application via API
      #| userid | Verdict | remark         | ricID | process-date |
      #| COS_43 |       0 | AtdCorRejected | SA    |            0 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_43 |   4300000001 | cos43@gmail.com |        1 |          1 |
#
  #@ASA-20
  #Scenario: Alert - T&A - Short Leave Application & Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_44      |
      #| COS_44_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   4400000001 | cos44@gmail.com     |
      #|   4400000011 | cos44ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    4400000001 | cos44@gmail.com     |
      #| COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4400000011 | cos44ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_44      |                          1 | admin        |    1 |
      #| COS_44_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    #And Create Attendance Policy
      #| PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      #| ShortApp1 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    #And Set Alert Configuration "Short Leave/Official Hours Application"
    #And Update Alert Configuration "Short Leave/Official Hours Application"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Short Leave/Official Hours Application"
      #| UserID      |
      #| COS_44_RIC1 |
    #And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    #And Assign User in Alert "Short Leave/Official Approval/Rejection"
      #| UserID |
      #| COS_44 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_44 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_44 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_44 |          0 |     100000 |
      #| COS_44 |          0 |     180000 |
    #When Generate ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      #| COS_44 |               0 |      2 | p1short  | COS_44    |
    #And Approve Reject ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | Authorization-for | Verdict | remark        | ricID       |
      #| COS_44 |               0 |                 2 |       1 | ShortApproved | COS_44_RIC1 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_44      |   4400000001 | cos44@gmail.com     |        1 |          1 |
      #| COS_44_RIC1 |   4400000011 | cos44ric1@gmail.com |        1 |          1 |
#
  #@ASA-21
  #Scenario: Alert - T&A - Short Leave Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_45 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   4500000001 | cos45@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_45 | COS_45 |               1 |         1 |               1 |                  1 |    4500000001 | cos45@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_45 |                          1 | admin        |    1 |
    #And Create Attendance Policy
      #| PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      #| ShortApp2 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_45 | ShortApp2     |             |             |           |             |         | Saved Successfully |
    #And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    #And Assign User in Alert "Short Leave/Official Approval/Rejection"
      #| UserID |
      #| COS_45 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_45 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_45 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_45 |          0 |     100000 |
      #| COS_45 |          0 |     180000 |
    #When Generate ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      #| COS_45 |               0 |      2 | p1short  | COS_45    |
    #And Approve Reject ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | Authorization-for | Verdict | remark        | ricID |
      #| COS_45 |               0 |                 2 |       2 | ShortRejected | SA    |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_45 |   4500000001 | cos45@gmail.com |        1 |          1 |
#
  #@ASA-22
  #Scenario: Alert - T&A - Official Hours Application & Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_46      |
      #| COS_46_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   4600000001 | cos46@gmail.com     |
      #|   4600000011 | cos46ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_46      | COS_46      |               1 |         1 |               1 |                  1 |    4600000001 | cos46@gmail.com     |
      #| COS_46_RIC1 | COS_46_RIC1 |               1 |         1 |               1 |                  1 |    4600000011 | cos46ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_46      |                          1 | admin        |    1 |
      #| COS_46_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS46RICGrp      |        1 | COS_46_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_46 | COS46RICGrp    |                |            |              | Saved Successfully |
    #And Create Attendance Policy
      #| PlcName      | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      #| OfficialApp1 |                2 | false         | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_46 | OfficialApp1  |             |             |           |             |         | Saved Successfully |
    #And Set Alert Configuration "Short Leave/Official Hours Application"
    #And Update Alert Configuration "Short Leave/Official Hours Application"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Short Leave/Official Hours Application"
      #| UserID      |
      #| COS_46_RIC1 |
    #And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    #And Assign User in Alert "Short Leave/Official Approval/Rejection"
      #| UserID |
      #| COS_46 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_46 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_46 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_46 |          0 |     090000 |
      #| COS_46 |          0 |     170000 |
    #When Generate ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | spfid2 | reason-2   | appliedBy |
      #| COS_46 |               0 |      1 | p2official | COS_46    |
    #And Approve Reject ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | Authorization-for | Verdict | remark           | ricID       |
      #| COS_46 |               0 |                 1 |       1 | OfficialApproved | COS_46_RIC1 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_46      |   4600000001 | cos46@gmail.com     |        1 |          1 |
      #| COS_46_RIC1 |   4600000011 | cos46ric1@gmail.com |        1 |          1 |
#
  #@ASA-23
  #Scenario: Alert - T&A - Official Hours Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_47 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   4700000001 | cos47@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_47 | COS_47 |               1 |         1 |               1 |                  1 |    4700000001 | cos47@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_47 |                          1 | admin        |    1 |
    #And Create Attendance Policy
      #| PlcName      | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      #| OfficialApp2 |                2 | false         | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_47 | OfficialApp2  |             |             |           |             |         | Saved Successfully |
    #And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    #And Assign User in Alert "Short Leave/Official Approval/Rejection"
      #| UserID |
      #| COS_47 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_47 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_47 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_47 |          0 |     090000 |
      #| COS_47 |          0 |     170000 |
    #When Generate ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | spfid2 | reason-2   | appliedBy |
      #| COS_47 |               0 |      1 | p2official | COS_47    |
    #And Approve Reject ShortLeave OfficialInOut Application via API
      #| Userid | Attendance-date | Authorization-for | Verdict | remark           | ricID |
      #| COS_47 |               0 |                 1 |       2 | OfficialRejected | SA    |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_47 |   4700000001 | cos47@gmail.com |        1 |          1 |
#
  #@ASA-24
  #Scenario: Alert - T&A - Overtime/C-OFF Authorization & Overtime Limit Exceeded - User & Overtime Limit Exceeded - Group Incharge
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_48      |
      #| COS_48_RIC1 |
      #| COS_51      |
      #| COS_51_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   4800000001 | cos48@gmail.com     |
      #|   4800000011 | cos48ric1@gmail.com |
      #|   5100000001 | cos51@gmail.com     |
      #|   5100000011 | cos51ric1@gmail.com |
    #And Delete Overtime Policy from TnA module
      #| Name    |
      #| AlertOT |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_48      | COS_48      |               1 |         1 |               1 |                  1 |    4800000001 | cos48@gmail.com     |
      #| COS_48_RIC1 | COS_48_RIC1 |               1 |         1 |               1 |                  1 |    4800000011 | cos48ric1@gmail.com |
      #| COS_51      | COS_51      |               1 |         1 |               1 |                  1 |    5100000001 | cos51@gmail.com     |
      #| COS_51_RIC1 | COS_51_RIC1 |               1 |         1 |               1 |                  1 |    5100000011 | cos51ric1@gmail.com |
    #And Create user from user configuration
      #| userid | AtdEnable | OtCoffEligibility | Validation         |
      #| COS_48 | True      | Both              | Saved Successfully |
      #| COS_51 | True      | Both              | Saved Successfully |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS48RICGrp      |        1 | COS_48_RIC1 |      |      |      |      | Saved Successfully |
      #| COS51RICGrp      |        1 | COS_51_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_48 | COS48RICGrp    |                |            |              | Saved Successfully |
      #| COS_51 | COS51RICGrp    |                |            |              | Saved Successfully |
    #And Create NetWork Hours Policy "AlertNW"
      #| WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      #| Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    #And Create Overtime Policy
      #| PlcName | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      #| AlertOT | AlertNW        | True      | ALL     | Daily 1    | false           | true                  | Generated Overtime |         0300 |         99959 | Monday           |         99959 | Saved Successfully |
    #And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AlertOT"
      #| WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      #| Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      #| Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_48 |               |             | AlertOT     |           |             |         | Saved Successfully |
      #| COS_51 |               |             | AlertOT     |           |             |         | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_48 |
      #| COS_51 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_48 |
      #| COS_51 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_48 |          0 |     070000 |
      #| COS_48 |          0 |     180000 |
      #| COS_51 |          0 |     070000 |
      #| COS_51 |          0 |     200000 |
    #And Set Alert Configuration "Overtime/C-OFF Authorization"
    #And Update Alert Configuration "Overtime/C-OFF Authorization"
      #| ScheduleTime | ProcessingPeriod |
      #|            2 | Current          |
    #And Assign User in Alert "Overtime/C-OFF Authorization"
      #| UserID      |
      #| COS_48_RIC1 |
    #And Set Alert Configuration "Overtime Limit Exceeded - User"
    #And Update Alert Configuration "Overtime Limit Exceeded - User"
      #| ScheduleTime | ProcessingPeriod |
      #|            2 | Current          |
    #And Assign User in Alert "Overtime Limit Exceeded - User"
      #| UserID |
      #| COS_51 |
    #And Set Alert Configuration "Overtime Limit Exceeded - Group Incharge"
    #And Update Alert Configuration "Overtime Limit Exceeded - Group Incharge"
      #| ScheduleTime | ProcessingPeriod |
      #|            2 | Current          |
    #And Assign User in Alert "Overtime Limit Exceeded - Group Incharge"
      #| UserID      |
      #| COS_51_RIC1 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_48_RIC1 |   4800000011 | cos48ric1@gmail.com |        1 |          1 |
      #| COS_51      |   5100000001 | cos51@gmail.com     |        1 |          1 |
      #| COS_51_RIC1 |   5100000011 | cos51ric1@gmail.com |        1 |          1 |
#
  #@ASA-25
  #Scenario: Alert - T&A - Shift Change
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_49 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   4900000001 | cos49@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_49 | COS_49 |               1 |         1 |               1 |                  1 |    4900000001 | cos49@gmail.com |
    #And Create shift in Shift Configuration
      #| ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      #| S1      |        -4 |       4 | 04:00   | 08:00   | Saved Successfully |
      #| S2      |        -2 |       6 | 04:00   | 08:00   | Saved Successfully |
    #And Create Shift Schedule "ShiftChng" with Start Date "01/01/2010"
      #| ShiftID | RepeatShiftDays |
      #| S1      |               7 |
      #| S2      |               7 |
    #And Create user from user configuration
      #| userid | ShiftSchedule | Validation         |
      #| COS_49 | ShiftChng     | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_49 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_49 |
    #And Set Alert Configuration "Shift Change"
    #And Update Alert Configuration "Shift Change"
      #| AlertForNormalShift | AlertForFBShift | AlertForRDShift |
      #| True                | True            | True            |
    #And Assign User in Alert "Shift Change"
      #| UserID |
      #| COS_49 |
    #And Get Shift and Change Shift via API for Alert
      #| userid | date-range | shift-id1 | shift-id2 |
      #| COS_49 |          0 | S1        | S2        |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_49 |   4900000001 | cos49@gmail.com |        1 |          1 |
#
  #@ASA-26
  #Scenario: Alert - T&A - Event Authorization
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_50      |
      #| COS_50_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   5000000001 | cos50@gmail.com     |
      #|   5000000011 | cos50ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_50      | COS_50      |               1 |         1 |               1 |                  1 |    5000000001 | cos50@gmail.com     |
      #| COS_50_RIC1 | COS_50_RIC1 |               1 |         1 |               1 |                  1 |    5000000011 | cos50ric1@gmail.com |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS50RICGrp      |        1 | COS_50_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_50 | COS50RICGrp    |                |            |              | Saved Successfully |
    #And Create Attendance Policy
      #| PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | EventSource | AuthReqforatleastoneEventoftheday | validation         |
      #| EventAuth |                2 | false         | True                 | False            | true               | false                 | true         | All         | True                              | Saved Successfully |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_50 | EventAuth     |             |             |           |             |         | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_50 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_50 |
    #And Set Alert Configuration "Event Authorization"
    #And Update Alert Configuration "Event Authorization"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Event Authorization"
      #| UserID      |
      #| COS_50_RIC1 |
    #When Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_50 |          0 |     090000 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_50_RIC1 |   5000000011 | cos50ric1@gmail.com |        1 |          1 |
#
  #@ASA-27
  #Scenario: Alert - T&A - Advance Overtime Application & Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_52      |
      #| COS_52_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   5200000001 | cos52@gmail.com     |
      #|   5200000011 | cos52ric1@gmail.com |
    #And Delete Overtime Policy from TnA module
      #| Name      |
      #| AdvOTApp1 |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_52      | COS_52      |               1 |         1 |               1 |                  1 |    5200000001 | cos52@gmail.com     |
      #| COS_52_RIC1 | COS_52_RIC1 |               1 |         1 |               1 |                  1 |    5200000011 | cos52ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_52      |                          1 | admin        |    1 |
      #| COS_52_RIC1 |                          1 | admin        |    1 |
    #And Create user from user configuration
      #| userid | AtdEnable | OtCoffEligibility | Validation         |
      #| COS_52 | True      | Both              | Saved Successfully |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS52RICGrp      |        1 | COS_52_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_52 | COS52RICGrp    |                |            |              | Saved Successfully |
    #And Create NetWork Hours Policy "AlertNW1"
      #| WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      #| Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    #And Create Overtime Policy
      #| PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      #| AdvOTApp1 | AlertNW1       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    #And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp1"
      #| WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      #| Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      #| Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_52 |               |             | AdvOTApp1   |           |             |         | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_52 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_52 |
    #And Set Alert Configuration "Advance Overtime Application"
    #And Update Alert Configuration "Advance Overtime Application"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Advance Overtime Application"
      #| UserID      |
      #| COS_52_RIC1 |
    #And Set Alert Configuration "Advance Overtime Approval/Rejection"
    #And Assign User in Alert "Advance Overtime Approval/Rejection"
      #| UserID |
      #| COS_52 |
    #When Generate Advance Overtime Application via API
      #| userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      #| COS_52 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52    |
    #And Approve Reject Advance Overtime Application via API
      #| approved | ot-hours | remark        | ricID       | userid | OT-date |
      #|        1 |     0200 | AdvOTApproved | COS_52_RIC1 | COS_52 |       1 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_52      |   5200000001 | cos52@gmail.com     |        1 |          1 |
      #| COS_52_RIC1 |   5200000011 | cos52ric1@gmail.com |        1 |          1 |
#
  #@ASA-28
  #Scenario: Alert - T&A - Advance Overtime Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_53 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   5300000001 | cos53@gmail.com |
    #And Delete Overtime Policy from TnA module
      #| Name      |
      #| AdvOTApp2 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_53 | COS_53 |               1 |         1 |               1 |                  1 |    5300000001 | cos53@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_53 |                          1 | admin        |    1 |
    #And Create user from user configuration
      #| userid | AtdEnable | OtCoffEligibility | Validation         |
      #| COS_53 | True      | Both              | Saved Successfully |
    #And Create NetWork Hours Policy "AlertNW2"
      #| WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      #| Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      #| Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    #And Create Overtime Policy
      #| PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      #| AdvOTApp2 | AlertNW2       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    #And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp2"
      #| WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      #| Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      #| Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    #And Assign policy to user
      #| UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      #| COS_53 |               |             | AdvOTApp2   |           |             |         | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_53 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_53 |
    #And Set Alert Configuration "Advance Overtime Approval/Rejection"
    #And Assign User in Alert "Advance Overtime Approval/Rejection"
      #| UserID |
      #| COS_53 |
    #When Generate Advance Overtime Application via API
      #| userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      #| COS_53 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_53    |
    #And Approve Reject Advance Overtime Application via API
      #| approved | ot-hours | remark        | ricID | userid | OT-date |
      #|        1 |     0200 | AdvOTRejected | SA    | COS_53 |       1 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_53 |   5300000001 | cos53@gmail.com |        1 |          1 |
#
  #@ASA-29
  #Scenario: Alert - Leave - Leave Credit/Debit
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_31 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   3100000001 | cos31@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_31 | COS_31 |               1 |         1 |               1 |                  1 |    3100000001 | cos31@gmail.com |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_31 |                |                | AlertLeaveGrp |              | Saved Successfully |
    #And Set Alert Configuration "Leave Credit/Debit"
    #And Update Alert Configuration "Leave Credit/Debit"
      #| AlertReportingInCharge |
      #| True                   |
    #And Assign User in Alert "Leave Credit/Debit"
      #| UserID |
      #| COS_31 |
    #When Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_31 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_31 |   3100000001 | cos31@gmail.com |        1 |          1 |
#
  #@ASA-30
  #Scenario: Alert - Leave - Leave Application & Leave Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_32      |
      #| COS_32_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   3200000001 | cos32@gmail.com     |
      #|   3200000011 | cos32ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    3200000001 | cos32@gmail.com     |
      #| COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3200000011 | cos32ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_32      |                          1 | admin        |    1 |
      #| COS_32_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS32RICGrp      |        1 | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_32 | COS32RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_32 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Application"
    #And Update Alert Configuration "Leave Application"
      #| ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      #| True          | True                   | True              |
    #And Assign User in Alert "Leave Application"
      #| UserID      |
      #| COS_32_RIC1 |
    #And Set Alert Configuration "Leave Approval"
    #And Assign User in Alert "Leave Approval"
      #| UserID |
      #| COS_32 |
    #When Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_32 |                  1 |          0 |        0 | MV         |                     1 | COS_32    |
    #And Approve Reject Leave Application via API
      #| approved | remark          | ricID       | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | COS_32_RIC1 | COS_32 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_32      |   3200000001 | cos32@gmail.com     |        1 |          1 |
      #| COS_32_RIC1 |   3200000011 | cos32ric1@gmail.com |        1 |          1 |
#
  #@ASA-31
  #Scenario: Alert - Leave - Leave Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_33 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   3300000001 | cos33@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_33 | COS_33 |               1 |         1 |               1 |                  1 |    3300000001 | cos33@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_33 |                          1 | admin        |    1 |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_33 |                |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_33 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Rejection"
    #And Assign User in Alert "Leave Rejection"
      #| UserID |
      #| COS_33 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_33 |                  1 |          0 |        0 | MV         |                     1 | cos_33    |
    #When Approve Reject Leave Application via API
      #| approved | remark          | ricID | userid | Start-date | end-date |
      #|        2 | RejectedRequest | SA    | COS_33 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_33 |   3300000001 | cos33@gmail.com |        1 |          1 |
#
  #@ASA-32
  #Scenario: Alert - Leave - Leave Modification Application & Leave Modification Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_34      |
      #| COS_34_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   3400000001 | cos34@gmail.com     |
      #|   3400000011 | cos34ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_34      | COS_34      |               1 |         1 |               1 |                  1 |    3400000001 | cos34@gmail.com     |
      #| COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    3400000011 | cos34ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_34      |                          1 | admin        |    1 |
      #| COS_34_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS34RICGrp      |        1 | COS_34_RIC1 |      |      |      |      | Saved Successfully |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_34 | COS34RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_34 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Modification Application"
    #And Update Alert Configuration "Leave Modification Application"
      #| ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      #| True          | True                   | True              |
    #And Assign User in Alert "Leave Modification Application"
      #| UserID      |
      #| COS_34_RIC1 |
    #And Set Alert Configuration "Leave Modification Approval/Rejection"
    #And Assign User in Alert "Leave Modification Approval/Rejection"
      #| UserID |
      #| COS_34 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_34 |                  1 |          0 |        0 | MV         |                     1 | COS_34    |
    #And Approve Reject Leave Application via API
      #| approved | remark          | ricID       | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | COS_34_RIC1 | COS_34 |          0 |        0 |
    #When Apply Leave "Modification" Application via API
      #| userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      #| COS_34 |            1 |                  1 |         -1 |       -1 | COS_34    |            0 |          0 |
    #And Approve Reject Leave Application via API
      #| approved | remark           | ricID       | userid | Start-date | end-date |
      #|        1 | ApprovedModified | COS_34_RIC1 | COS_34 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_34      |   3400000001 | cos34@gmail.com     |        1 |          1 |
      #| COS_34_RIC1 |   3400000011 | cos34ric1@gmail.com |        1 |          1 |
#
  #@ASA-33
  #Scenario: Alert - Leave - Leave Modification Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_35 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   3500000001 | cos35@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_35 | COS_35 |               1 |         1 |               1 |                  1 |    3500000001 | cos35@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_35 |                          1 | admin        |    1 |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_35 |                |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_35 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Modification Approval/Rejection"
    #And Assign User in Alert "Leave Modification Approval/Rejection"
      #| UserID |
      #| COS_35 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_35 |                  1 |          0 |        0 | MV         |                     1 | COS_35    |
    #And Approve Reject Leave Application via API
      #| approved | remark          | ricID | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | SA    | COS_35 |          0 |        0 |
    #And Apply Leave "Modification" Application via API
      #| userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      #| COS_35 |            1 |                  1 |         -1 |       -1 | COS_35    |            0 |          0 |
    #When Approve Reject Leave Application via API
      #| approved | remark           | ricID | userid | Start-date | end-date |
      #|        2 | RejectedModified | SA    | COS_35 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_35 |   3500000001 | cos35@gmail.com |        1 |          1 |
#
  #@ASA-34
  #Scenario: Alert - Leave - Leave Cancellation Application & Leave Cancellation Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_36      |
      #| COS_36_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   3600000001 | cos36@gmail.com     |
      #|   3600000011 | cos36ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      #| COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    3600000001 | cos36@gmail.com     |
      #| COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    3600000011 | cos36ric1@gmail.com |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_36      |                          1 | admin        |    1 |
      #| COS_36_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS36RICGrp      |        1 | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_36 | COS36RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_36 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Cancellation Application"
    #And Update Alert Configuration "Leave Cancellation Application"
      #| ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      #| True          | True                   | True              |
    #And Assign User in Alert "Leave Cancellation Application"
      #| UserID      |
      #| COS_36_RIC1 |
    #And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    #And Assign User in Alert "Leave Cancellation Approval/Rejection"
      #| UserID |
      #| COS_36 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_36 |                  1 |          0 |        0 | MV         |                     1 | COS_36    |
    #And Approve Reject Leave Application via API
      #| approved | remark          | ricID       | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    #When Apply Leave "Cancellation" Application via API
      #| userid | request-type | appliedBy | OldStartdate | OldEnddate |
      #| COS_36 |            2 | COS_36    |            0 |          0 |
    #And Approve Reject Leave Application via API
      #| approved | remark            | ricID       | userid | Start-date | end-date |
      #|        1 | ApprovedCancelled | COS_36_RIC1 | COS_36 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_36      |   3600000001 | cos36@gmail.com     |        1 |          1 |
      #| COS_36_RIC1 |   3600000011 | cos36ric1@gmail.com |        1 |          1 |
#
  #@ASA-35
  #Scenario: Alert - Leave - Leave Cancellation Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_37 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   3700000001 | cos37@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_37 | COS_37 |               1 |         1 |               1 |                  1 |    3700000001 | cos37@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_37 |                          1 | admin        |    1 |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_37 |                |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_37 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    #And Assign User in Alert "Leave Cancellation Approval/Rejection"
      #| UserID |
      #| COS_37 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_37 |                  1 |          0 |        0 | MV         |                     1 | COS_37    |
    #When Approve Reject Leave Application via API
      #| approved | remark          | ricID | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | SA    | COS_37 |          0 |        0 |
    #When Apply Leave "Cancellation" Application via API
      #| userid | request-type | appliedBy | OldStartdate | OldEnddate |
      #| COS_37 |            2 | cos_37    |            0 |          0 |
    #And Approve Reject Leave Application via API
      #| approved | remark            | ricID | userid | Start-date | end-date |
      #|        2 | RejectedCancelled | SA    | COS_37 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_37 |   3700000001 | cos37@gmail.com |        1 |          1 |
#
  #@ASA-36
  #Scenario: Alert - Leave - Leave Status Update
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_38 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   3800000001 | cos38@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_38 | COS_38 |               1 |         1 |               1 |                  1 |    3800000001 | cos38@gmail.com |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_38 |                          1 | admin        |    1 |
    #And Create Leave
      #| LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      #| MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    #And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      #| LeaveID |
      #| MV      |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      #| COS_38 |                |                | AlertLeaveGrp |              | Saved Successfully |
    #And Credit_Debit_Encash Leave via API
      #| userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      #| COS_38 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    #And Set Alert Configuration "Leave Status Update"
    #And Assign User in Alert "Leave Status Update"
      #| UserID |
      #| COS_38 |
    #And Apply Leave Application via API
      #| userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      #| COS_38 |                  1 |          0 |        0 | MV         |                     1 | COS_38    |
    #When Approve Reject Leave Application via API
      #| approved | remark          | ricID | userid | Start-date | end-date |
      #|        1 | ApprovedRequest | SA    | COS_38 |          0 |        0 |
      #|        2 | RejectedRequest | SA    | COS_38 |          0 |        0 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_38 |   3800000001 | cos38@gmail.com |        1 |          1 |
#
  #@ASA-37
  #Scenario: Alert - JPC - Award/Penalty Application
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_56      |
      #| COS_56_RIC1 |
      #| COS_56_RIC2 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   5600000021 | cos56ric2@gmail.com |
    #And Delete Project from Job Processing and Costing
      #| ProjectName |
      #| AlrProject  |
    #And Delete Phase from Job Processing and Costing
      #| PhaseName |
      #| Phase1    |
    #And Delete Job from Job Processing and Costing
      #| JobCode |
      #| J1      |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      | job-assignment-type |
      #| COS_56      | COS_56      |               1 |         1 |               1 |                  1 |    5600000001 | cos56@gmail.com     |                   1 |
      #| COS_56_RIC1 | COS_56_RIC1 |               1 |         1 |               1 |                  1 |    5600000011 | cos56ric1@gmail.com |                     |
      #| COS_56_RIC2 | COS_56_RIC2 |               1 |         1 |               1 |                  1 |    5600000021 | cos56ric2@gmail.com |                     |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_56      |                          1 | admin        |    1 |
      #| COS_56_RIC1 |                          1 | admin        |    1 |
      #| COS_56_RIC2 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS56RIC1Grp     |        1 | COS_56_RIC1 |      |      |      |      | Saved Successfully |
      #| COS56RIC2Grp     |        1 | COS_56_RIC2 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID      | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_56      | COS56RIC1Grp   |                |            |              | Saved Successfully |
      #| COS_56_RIC1 | COS56RIC2Grp   |                |            |              | Saved Successfully |
    #And Create Job from Job Processing and Costing
      #| Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      #| J1   | J1   |            0 |          0 |        0002400 | Saved Successfully |
    #And Create Phase from Job Processing and Costing
      #| Name   | Description   | Validation         |
      #| Phase1 | JPCAutomation | Saved Successfully |
    #And Create Project "AlrProject" with StartDate "0" and EndDate "0" from Job Processing and Costing
      #| CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      #| Alert             | Phase1 |         0 |       0 |
    #And Set Job Configuration in Phase "Phase1" of Project "AlrProject" from Job Processing and Costing
      #| JobCode | StartDate | EndDate |
      #| J1      |         0 |       0 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_56 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_56 |
    #And Set event via Event Set API
      #| Userid | event-date | event-time |
      #| COS_56 |          0 |     090000 |
      #| COS_56 |          0 |     120000 |
    #And Apply Timesheet Correction Application via API
      #| userid | attendance-date | correction-type | job-code | job-count | reason           | appliedBy |
      #| COS_56 |               0 |               0 | J1       |         1 | TimesheetApplied | SA        |
    #And Set Alert Configuration "Award/Penalty Application"
    #And Update Alert Configuration "Award/Penalty Application"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Award/Penalty Application"
      #| UserID      |
      #| COS_56_RIC2 |
    #And Logout from Cosec Web
    #And Login with user
      #| username    | password | Validation          |
      #| COS_56_RIC1 | admin    | Welcome COS_56_RIC1 |
    #When Assign Award Penalty Hours from RIC ESS login
      #| Userid | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      #| COS_56 |    0 | Award          |  0200 | AwardGranted | GreatWork | Saved Successfully |
    #And Logout from Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_56_RIC2 |   5600000021 | cos56ric2@gmail.com |        1 |          1 |
    #And Delete user via API
      #| UserID      |
      #| COS_56      |
      #| COS_56_RIC1 |
      #| COS_56_RIC2 |
#
  #@ASA-38
  #Scenario: Alert - FVM - Schedule Unavailable - Users & Incharge
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_57      |
      #| COS_57_RIC1 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   5700000001 | cos57@gmail.com     |
      #|   5700000011 | cos57ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      | FVM-enable |
      #| COS_57      | COS_57      |               1 |         1 |               1 |                  1 |    5700000001 | cos57@gmail.com     |          1 |
      #| COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    5700000011 | cos57ric1@gmail.com |            |
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_57      |                          1 | admin        |    1 |
      #| COS_57_RIC1 |                          1 | admin        |    1 |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS57RICGrp      |        1 | COS_57_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_57 | COS57RICGrp    |                |            |              | Saved Successfully |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_57 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_57 |
    #And Set Alert Configuration "Schedule Unavailable - Users"
    #And Update Alert Configuration "Schedule Unavailable - Users"
      #| SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      #| Everyday    |            2 |                       1 |
    #And Assign User in Alert "Schedule Unavailable - Users"
      #| UserID |
      #| COS_57 |
    #And Set Alert Configuration "Schedule Unavailable - Group Incharge"
    #And Update Alert Configuration "Schedule Unavailable - Group Incharge"
      #| SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      #| Everyday    |            2 |                       1 |
    #And Assign User in Alert "Schedule Unavailable - Group Incharge"
      #| UserID      |
      #| COS_57_RIC1 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_57      |   5700000001 | cos57@gmail.com     |        1 |          1 |
      #| COS_57_RIC1 |   5700000011 | cos57ric1@gmail.com |        1 |          1 |
#
  #@ASA-39
  #Scenario: Alert - FVM - FVM - Schedule Modified
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_58 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   5800000001 | cos58@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  | FVM-enable |
      #| COS_58 | COS_58 |               1 |         1 |               1 |                  1 |    5800000001 | cos58@gmail.com |          1 |
    #And Run Shift Process for Month = "0" and Year = "0"
      #| UserID |
      #| COS_58 |
    #And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      #| UserID |
      #| COS_58 |
    #And Create Location from Location master
      #| Code  | Name  | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      #| Alert | Alert | Wi-Fi |         |         |          |           |                      | 00:00:00:02:02:02 | RnD2    | Saved Successfully |
    #And Create Task from Field Visit Management
      #| TaskName | Description              | Validation         |
      #| Alert1   | FVM Automation By Mayank | Saved Successfully |
    #And Create Field Visit Schedule for User "COS_58" and date "0" from Field Visit Management
      #| ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      #|                 0 |              0900 |               0 |            1000 | Alert1   | Alert    | Schedule By Mayank |
    #And Set Alert Configuration "Schedule Modified"
    #And Assign User in Alert "Schedule Modified"
      #| UserID |
      #| COS_58 |
    #And Create Field Visit Schedule for User "COS_58" and date "0" from Field Visit Management
      #| ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      #|                 0 |              1001 |               0 |            1100 | Alert1   | Alert    | Schedule By Mayank |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_58 |   5800000001 | cos58@gmail.com |        1 |          1 |
#
  #@ASA-46
  #Scenario: Alert - CWM - CSS Account Enable
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6100000001 | con61@gmail.com |
    #And Delete Contractor via API
      #| id     |
      #| CON_61 |
    #And Set Alert Configuration "CSS Account Enable"
    #When Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_61 | CON_61 |              10 | CON_61         |     6100000001 | con61@gmail.com |      6100 | Lic         | True          | True             | Saved Successfully |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| CON_61 |   6100000001 | con61@gmail.com |        1 |          1 |
#
  #@ASA-47
  #Scenario: Alert - CWM - 62Contractor Validity & 63Work Order Expiry
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6200000001 | cos62@gmail.com |
      #|   6200000011 | con62@gmail.com |
      #|   6300000011 | con63@gmail.com |
    #And Delete user via API
      #| UserID |
      #| COS_62 |
    #And Delete WorkOrder via API
      #| id    | contractorID | workerName |
      #| WO_63 | CON_63       | Worker_63  |
    #And Delete Contractor via API
      #| id     |
      #| CON_62 |
      #| CON_63 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_62 | COS_62 |               1 |         1 |               1 |                  1 |    6200000001 | cos62@gmail.com |
    #And Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_62 | CON_62 |               1 | CON_62         |     6200000011 | con62@gmail.com |      6200 | Lic1        | True          | True             | Saved Successfully |
      #| CON_63 | CON_63 |              10 | CON_63         |     6300000011 | con63@gmail.com |      6300 | Lic2        | True          | True             | Saved Successfully |
    #And Create WorkOrder from CWM module
      #| Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      #| WO_63 | WO_63 |             0 |           1 | CON_63                   | Approval Stage-1  |              5 | Saved Successfully |
    #And Set Alert Configuration "Contractor Validity"
    #And Set Send Alert to parameters for "Contractor Validity" Alert
    #And Update Alert Configuration "Contractor Validity"
      #| DaysBeforeValEndDate | ReminderTime | RepeatReminder | RepeatIntervalDays | UserID | ContractorID |
      #|                    1 |            2 | False          |                  1 | COS_62 | CON_62       |
    #And Set Alert Configuration "Work Order Expiry"
    #And Update Alert Configuration "Work Order Expiry"
      #| SendReminder | SetRemDaysBeforeValEnd | ReminderTime |
      #| Everyday     |                      1 |            2 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_62 |   6200000001 | cos62@gmail.com |        1 |          1 |
      #| CON_62 |   6200000011 | con62@gmail.com |        1 |          1 |
      #| CON_63 |   6300000011 | con63@gmail.com |        1 |          1 |
#
  #@ASA-48
  #Scenario: Alert - CWM - Worker Assignment & Worker Induction
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6400000001 | cos64@gmail.com |
    #And Delete user via API
      #| UserID |
      #| COS_64 |
    #And Delete Worker from CWM module
      #| WorkerName |
      #| Worker_64  |
    #And Delete WorkOrder via API
      #| id    | contractorID | workerName |
      #| WO_64 | CON_64       | Worker_64  |
    #And Delete Approval Stages from CWM module
      #| ApprovalStagesName |
      #| AlertAS1           |
    #And Delete Contractor via API
      #| id     |
      #| CON_64 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_64 | COS_64 |               1 |         1 |               1 |                  1 |    6400000001 | cos64@gmail.com |
    #And Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_64 | CON_64 |              10 | CON_64         |     6400000011 | con64@gmail.com |      6400 | lic1        | True          | True             | Saved Successfully |
    #And Create Induction Level from CWM module
      #| Name           | Description          | Validation         |
      #| AlertInduction | Automation By Mayank | Saved Successfully |
    #And Create Approval Stage "AlertAS1" from CWM module
      #| InductionLevelName | ApprovingInChargeID |
      #| AlertInduction     | COS_64              |
    #And Create WorkOrder from CWM module
      #| Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      #| WO_64 | WO_64 |             0 |          10 | CON_64                   | AlertAS1          |              5 | Saved Successfully |
    #And Set CWM Parameters in GP
      #| WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      #| True                    | Approval Stage     | Serial         | False                              |
    #And Set Alert Configuration "Worker Induction"
    #And Update Alert Configuration "Worker Induction"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Worker Induction"
      #| UserID |
      #| COS_64 |
    #And Logout from Cosec Web
    #And Set User password
      #| User   | NewPassword | ConfirmPassword | Validation |
      #| CON_64 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation     |
      #| CON_64   | admin    | Welcome CON_64 |
    #And Create Worker from worker profile in CSS login
      #| WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      #| Worker_64  |       1 | WO_64       |             0 |          10 | Saved Successfully |
    #And Logout from Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Alert Configuration "Worker Assignment"
    #And Update Alert Configuration "Worker Assignment"
      #| ScheduleTime | ProcessingPeriod |
      #|            2 | Current          |
    #And Assign User in Alert "Worker Assignment"
      #| UserID |
      #| COS_64 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_64 |   6400000001 | cos64@gmail.com |        2 |          2 |
#
  #@ASA-49
  #Scenario: Alert - CWM - Worker Approval & Worker Induction Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete Worker from CWM module
      #| WorkerName |
      #| Worker_65  |
    #And Delete WorkOrder via API
      #| id    | contractorID | workerName |
      #| WO_65 | CON_65       | Worker_65  |
    #And Delete Approval Stages from CWM module
      #| ApprovalStagesName |
      #| AlertAS2           |
    #And Delete Contractor via API
      #| id     |
      #| CON_65 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6500000011 | con65@gmail.com |
    #And Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_65 | CON_65 |              10 | CON_65         |     6500000011 | con65@gmail.com |      6500 | lic1        | True          | True             | Saved Successfully |
    #And Create Induction Level from CWM module
      #| Name           | Description          | Validation         |
      #| AlertInduction | Automation By Mayank | Saved Successfully |
    #And Create Approval Stage "AlertAS2" from CWM module
      #| InductionLevelName | ApprovingInChargeID |
      #| AlertInduction     |                     |
    #And Create WorkOrder from CWM module
      #| Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      #| WO_65 | WO_65 |             0 |          10 | CON_65                   | AlertAS2          |              5 | Saved Successfully |
    #And Set CWM Parameters in GP
      #| WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      #| True                    | Approval Stage     | Serial         | False                              |
    #And Logout from Cosec Web
    #And Set User password
      #| User   | NewPassword | ConfirmPassword | Validation |
      #| CON_65 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation     |
      #| CON_65   | admin    | Welcome CON_65 |
    #And Create Worker from worker profile in CSS login
      #| WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      #| Worker_65  |       1 | WO_65       |             0 |          10 | Saved Successfully |
    #And Logout from Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Alert Configuration "Worker Induction Approval/Rejection"
    #And Assign User in Alert "Worker Induction Approval/Rejection"
      #| UserID |
      #| CON_65 |
    #And Set Alert Configuration "Worker Approval"
    #And Update Alert Configuration "Worker Approval"
      #| ScheduleTime | ProcessingPeriod |
      #|            2 | Current          |
    #And Approve Reject Induction Approval from CWM module
      #| WorkOrderID | WorkerName | Approval | Validation         |
      #| WO_65       | Worker_65  | Approve  | Saved Successfully |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| CON_65 |   6500000011 | con65@gmail.com |        2 |          2 |
#
  #@ASA-50
  #Scenario: Alert - CWM - Worker Induction Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete Worker from CWM module
      #| WorkerName |
      #| Worker_66  |
    #And Delete WorkOrder via API
      #| id    | contractorID | workerName |
      #| WO_66 | CON_66       | Worker_66  |
    #And Delete Approval Stages from CWM module
      #| ApprovalStagesName |
      #| AlertAS3           |
    #And Delete Contractor via API
      #| id     |
      #| CON_66 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6600000011 | con66@gmail.com |
    #And Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_66 | CON_66 |              10 | CON_66         |     6600000011 | con66@gmail.com |      6600 | lic1        | True          | True             | Saved Successfully |
    #And Create Induction Level from CWM module
      #| Name           | Description          | Validation         |
      #| AlertInduction | Automation By Mayank | Saved Successfully |
    #And Create Approval Stage "AlertAS3" from CWM module
      #| InductionLevelName | ApprovingInChargeID |
      #| AlertInduction     |                     |
    #And Create WorkOrder from CWM module
      #| Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      #| WO_66 | WO_66 |             0 |          10 | CON_66                   | AlertAS3          |              5 | Saved Successfully |
    #And Set CWM Parameters in GP
      #| WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      #| True                    | Approval Stage     | Serial         | False                              |
    #And Logout from Cosec Web
    #And Set User password
      #| User   | NewPassword | ConfirmPassword | Validation |
      #| CON_66 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation     |
      #| CON_66   | admin    | Welcome CON_66 |
    #And Create Worker from worker profile in CSS login
      #| WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      #| Worker_66  |       1 | WO_66       |             0 |          10 | Saved Successfully |
    #And Logout from Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Alert Configuration "Worker Induction Approval/Rejection"
    #And Assign User in Alert "Worker Induction Approval/Rejection"
      #| UserID |
      #| CON_66 |
    #When Approve Reject Induction Approval from CWM module
      #| WorkOrderID | WorkerName | Approval | Validation         |
      #| WO_66       | Worker_66  | Reject   | Saved Successfully |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| CON_66 |   6600000011 | con66@gmail.com |        1 |          1 |
#
  #@VMM1
  #Scenario: Invite Visitor
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_71 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7100000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   7100000011 | visitor71@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      #| COS_71 | COS_71 |               1 |         1 |               1 |                  1 |                    1 |
    #And Set Alert Configuration "Invite Visitor"
    #When Invite Visitor via API
      #| visitor-name | Visitor-email-id    | Visitor-mobile-no | visit-date | visit-until-date | visit-start-time | visit-end-time | additional-visitors | host-id | purpose    | appliedBy |
      #| VIS_71       | visitor71@gmail.com |        7100000011 |          1 |                1 |             0900 |           1000 |                   0 | COS_71  | Automation | SA        |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email               | SMSCount | EmailCount |
      #| VIS_71 |   7100000011 | visitor71@gmail.com |        1 |          1 |
#
  #@VMM2
  #Scenario: Visitor Added - Watchlist
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_72 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7200000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   7200000001 | cos72@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_72 | COS_72 |               1 |         1 |               1 |                  1 |                    1 |    7200000001 | cos72@gmail.com |
    #And create visitor profile via API
      #| id  | name | active |
      #| v72 | v72  |      1 |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_72       | Matrix            | 7200000011 | visitor72@gmail.com | COS_72  | SA        | Default Location   |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_72 |
      #|         0 |            5 | SA        |         0 |       0 | COS_72 |
    #And Set Alert Configuration "Visitor Added - Watchlist/Blacklist"
    #When Add Visitor in Watchlist or Blacklist from Visitor module
      #| VisitorMobileNo | AddIn     | Validation         |
      #|      7200000011 | Watchlist | Saved Successfully |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_72 |   7200000001 | cos72@gmail.com |        1 |          1 |
#
  #@VMM3
  #Scenario: Visitor Added - Blacklist
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_73 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7300000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   7300000001 | cos73@gmail.com |
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_73V1 | COS_73V1 |      1 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_73 | COS_73 |               1 |         1 |               1 |                  1 |                    1 |    7300000001 | cos73@gmail.com |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_73       | Matrix            | 7300000011 | visitor73@gmail.com | COS_73  | SA        | Default Location   |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_73 |
      #|         0 |            5 | SA        |         0 |       0 | COS_73 |
    #And Set Alert Configuration "Visitor Added - Watchlist/Blacklist"
    #When Add Visitor in Watchlist or Blacklist from Visitor module
      #| VisitorMobileNo | AddIn     | Validation         |
      #|      7300000011 | Blacklist | Saved Successfully |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_73 |   7300000001 | cos73@gmail.com |        1 |          1 |
#
  #@VMM4
  #Scenario: Create Visit - Watchlist
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_74 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7400000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   7400000001 | cos74@gmail.com |
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_74V1 | COS_74V1 |      1 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_74 | COS_74 |               1 |         1 |               1 |                  1 |                    1 |    7400000001 | cos74@gmail.com |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_74       | Matrix            | 7400000011 | visitor74@gmail.com | COS_74  | SA        | Default Location   |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_74 |
      #|         0 |            5 | SA        |         0 |       0 | COS_74 |
    #And Add Visitor in Watchlist or Blacklist from Visitor module
      #| VisitorMobileNo | AddIn     | Validation         |
      #|      7400000011 | Watchlist | Saved Successfully |
    #And Set Alert Configuration "Create Visit - Watchlist/Blacklist"
    #And Set Send Alert to parameters for "Create Visit - Watchlist/Blacklist" Alert
    #And Open Cosec Visitor Portal in new tab
      #| StationLocation  | UserId | Password | validation     |
      #| Default Location | sa     | admin    | Visitor Portal |
    #And Login with Visitor in Visitor Portal
      #| MobileEmail | Validation                                   |
      #|  7400000011 | OTP (valid for 3 mins) has been sent to your |
    #And Go to previous Tab
    #And Get OTP from Alert view for "7400000011"
    #And Go to next Tab
    #And click on Login after entering OTP in Visitor Portal
      #| Validation   |
      #| Create Visit |
    #When Create Visit from visitor portal
      #| HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      #| COS_74 |         1 |         1 |         1 |      30 | automation | Visit Created |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_74 |   7400000001 | cos74@gmail.com |        1 |          1 |
#
  #@VMM5
  #Scenario: Create Visit - Blacklist
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_75 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7500000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   7500000001 | cos75@gmail.com |
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_75V1 | COS_75V1 |      1 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_75 | COS_75 |               1 |         1 |               1 |                  1 |                    1 |    7500000001 | cos75@gmail.com |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_75       | Matrix            | 7500000011 | visitor75@gmail.com | COS_75  | SA        | Default Location   |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_75 |
      #|         0 |            5 | SA        |         0 |       0 | COS_75 |
    #And Add Visitor in Watchlist or Blacklist from Visitor module
      #| VisitorMobileNo | AddIn     | Validation         |
      #|      7500000011 | Blacklist | Saved Successfully |
    #And Set Alert Configuration "Create Visit - Watchlist/Blacklist"
    #And Set Send Alert to parameters for "Create Visit - Watchlist/Blacklist" Alert
    #And Open Cosec Visitor Portal in new tab
      #| StationLocation  | UserId | Password | validation     |
      #| Default Location | sa     | admin    | Visitor Portal |
    #And Login with Visitor in Visitor Portal
      #| MobileEmail | Validation                                   |
      #|  7500000011 | OTP (valid for 3 mins) has been sent to your |
    #And Go to previous Tab
    #And Get OTP from Alert view for "7500000011"
    #And Go to next Tab
    #And click on Login after entering OTP in Visitor Portal
      #| Validation   |
      #| Create Visit |
    #When Create Visit from visitor portal
      #| HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation                                       |
      #| COS_75 |         1 |         1 |         1 |      30 | automation | Visit not allowed. Please contact administrator. |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_75 |   7500000001 | cos75@gmail.com |        1 |          1 |
#
  #@VMM6
  #Scenario: Visitor Pre-Registration  - send to Host
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_76 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7600000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   7600000001 | cos76@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_76 | COS_76 |               1 |         1 |               1 |                  1 |                    1 |    7600000001 | cos76@gmail.com |
    #And Set Alert Configuration "Visitor Pre-Registration"
    #And Set Send Alert to parameters for "Visitor Pre-Registration" Alert
    #And Update Alert Configuration "Visitor Pre-Registration"
      #| CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      #| True           | True          | True                   |
    #And Open Cosec Visitor Portal in new tab
      #| StationLocation  | UserId | Password | validation     |
      #| Default Location | sa     | admin    | Visitor Portal |
    #And Login with Visitor in Visitor Portal
      #| MobileEmail | Validation                                   |
      #|  7600000011 | OTP (valid for 3 mins) has been sent to your |
    #And Go to previous Tab
    #And Get OTP from Alert view for "7600000011"
    #And Go to next Tab
    #And click on Login after entering OTP in Visitor Portal
      #| Validation |
      #| Profile    |
    #And Enter visitor details in visitor portal
      #| Name   | Organization | Email               | validation                                   |
      #| VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    #And Go to previous Tab
    #And Get OTP from Alert view for "visitor76@gmail.com"
    #And Go to next Tab
    #And click on Verify after entering Email OTP in Visitor Portal
      #| Validation   |
      #| Create Visit |
    #When Create Visit from visitor portal
      #| HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      #| COS_76 |         1 |         1 |         1 |      30 | automation | Visit Created |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_76 |   7600000001 | cos76@gmail.com |        1 |          1 |
#
  #@VMM7
  #Scenario: Visitor Pre-Registration  - send to Visitor
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_77 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7700000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   7700000011 | visitor77@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_77 | COS_77 |               1 |         1 |               1 |                  1 |                    1 |    7700000001 | cos77@gmail.com |
    #And Set Alert Configuration "Visitor Pre-Registration"
    #And Set Send Alert to parameters for "Visitor Pre-Registration" Alert
    #And Update Alert Configuration "Visitor Pre-Registration"
      #| CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      #| True           | True          | True                   |
    #And Set default Visitor Pre-Registration Template
    #When Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_77       | Matrix            | 7700000011 | visitor77@gmail.com | COS_77  | SA        | Default Location   |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email               | SMSCount | EmailCount |
      #| VIS_77 |   7700000011 | visitor77@gmail.com |        1 |          1 |
#
  #@VMM8
  #Scenario: Visit Transfer
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_78_H1 |
      #| COS_78_H2 |
      #| COS_78ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7800000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   7800000021 | cos78h2@gmail.com   |
      #|   7800000011 | visitor78@gmail.com |
      #|   7800000031 | cos78ess@gmail.com  |
    #And Delete System Account User "SA_CS_78" from database
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_78_H1 | COS_78_H1 |               1 |         1 |               1 |                  1 |                    1 |    7800000001 | cos78h1@gmail.com  |
      #| COS_78_H2 | COS_78_H2 |               1 |         1 |               1 |                  1 |                    1 |    7800000021 | cos78h2@gmail.com  |
      #| COS_78ESS | COS_78ESS |               1 |         1 |               1 |                  1 |                    1 |    7800000031 | cos78ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | APIAccess | ValidationMessage  |
      #| SA_CS_78 | COS_78ESS | True      | Saved Successfully |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id   | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_78       | Matrix            | 7800000011 | visitor78@gmail.com | COS_78_H1 | SA        | Default Location   |
    #And Set Alert Configuration "Visit Transfer"
    #And Set Send Alert to parameters for "Visit Transfer" Alert
    #And Update Alert Configuration "Visit Transfer"
      #| CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      #| True           | True          | True                   |
    #When Visitor Invites Approval API
      #| user-type | verdict | transfer-host-id | StartDate | EndDate | HostID    | approvedBy |
      #|         0 |       3 | COS_78_H2        |         0 |       0 | COS_78_H1 | SA         |
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_78_H2 |   7800000021 | cos78h2@gmail.com   |        1 |          1 |
      #| COS_78ESS |   7800000031 | cos78ess@gmail.com  |        1 |          1 |
      #| VIS_78    |   7800000011 | visitor78@gmail.com |        1 |          1 |
#
  #@VMM9
  #Scenario: Visitor Pass
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_79 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   7900000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   7900000011 | visitor79@gmail.com |
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_79V1 | COS_79V1 |      1 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_79 | COS_79 |               1 |         1 |               1 |                  1 |                    1 |    7900000001 | cos79@gmail.com |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_79       | Matrix            | 7900000011 | visitor79@gmail.com | COS_79  | SA        | Default Location   |
    #And Set Alert Configuration "Visitor Pass"
    #And Update Alert Configuration "Visitor Pass"
      #| QR   | Barcode |
      #| True | True    |
    #When Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_79 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email               | SMSCount | EmailCount |
      #| VIS_79 |   7900000011 | visitor79@gmail.com |        1 |          1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            5 | SA        |         0 |       0 | COS_79 |
#
  #@VMM10
  #Scenario: Visit Reminder
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_80 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8000000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   8000000001 | cos80@gmail.com     |
      #|   8000000011 | visitor80@gmail.com |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_80 | COS_80 |               1 |         1 |               1 |                  1 |                    1 |    8000000001 | cos80@gmail.com |
    #And Set Alert Configuration "Visit Reminder"
    #And Set Send Alert to parameters for "Visit Reminder" Alert
    #And Update Alert Configuration "Visit Reminder"
      #| ReminderPriorHours | ReminderPriorDays |
      #|                  1 |                 0 |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |               62 |             66 | VIS_80       | Matrix            | 8000000011 | visitor80@gmail.com | COS_80  | SA        | Default Location   |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_80 |   8000000001 | cos80@gmail.com     |        1 |          1 |
      #| VIS_80 |   8000000011 | visitor80@gmail.com |        1 |          1 |
#
  #@VMM11
  #Scenario: Visitor Arrival
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID |
      #| COS_81 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8100000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   8100000001 | cos81@gmail.com |
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_81V1 | COS_81V1 |      1 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      #| COS_81 | COS_81 |               1 |         1 |               1 |                  1 |                    1 |    8100000001 | cos81@gmail.com |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              5 | VIS_81       | Matrix            | 8100000011 | visitor81@gmail.com | COS_81  | SA        | Default Location   |
    #And Set Alert Configuration "Visitor Arrival"
    #And Assign User in Alert "Visitor Arrival"
      #| UserID |
      #| COS_81 |
    #When Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_81 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_81 |   8100000001 | cos81@gmail.com |        1 |          1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            5 | SA        |         0 |       0 | COS_81 |
#
  #@VMM12
  #Scenario: Visitor Pass Expiry Reminder
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_82    |
      #| COS_82ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8200000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   8200000001 | cos82@gmail.com     |
      #|   8200000021 | cos82ess@gmail.com  |
      #|   8200000011 | visitor82@gmail.com |
    #And Delete System Account User "SA_CS_82" from database
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_82V1 | COS_82V1 |      1 |
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_82    | COS_82    |               1 |         1 |               1 |                  1 |                    1 |    8200000001 | cos82@gmail.com    |
      #| COS_82ESS | COS_82ESS |               1 |         1 |               1 |                  1 |                    1 |    8200000021 | cos82ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | APIAccess | ValidationMessage  |
      #| SA_CS_82 | COS_82ESS | True      | Saved Successfully |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              3 | VIS_82       | Matrix            | 8200000011 | visitor82@gmail.com | COS_82  | SA        | Default Location   |
    #And Set Alert Configuration "Visitor Pass Expiry Reminder"
    #And Set Send Alert to parameters for "Visitor Pass Expiry Reminder" Alert
    #And Update Alert Configuration "Visitor Pass Expiry Reminder"
      #| ExpiryReminderMinutes |
      #|                     1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_82 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_82    |   8200000001 | cos82@gmail.com     |        1 |          1 |
      #| COS_82ESS |   8200000021 | cos82ess@gmail.com  |        1 |          1 |
      #| VIS_82    |   8200000011 | visitor82@gmail.com |        1 |          1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            5 | SA        |         0 |       0 | COS_82 |
#
  #@VMM13
  #Scenario: Visitor Pass Expired
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_83    |
      #| COS_83ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8300000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   8300000001 | cos83@gmail.com     |
      #|   8300000021 | cos83ess@gmail.com  |
      #|   8300000011 | visitor83@gmail.com |
    #And Delete System Account User "SA_CS_83" from database
    #And create visitor profile via API
      #| id       | name     | active |
      #| COS_83V1 | COS_83V1 |      1 |
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_83    | COS_83    |               1 |         1 |               1 |                  1 |                    1 |    8300000001 | cos83@gmail.com    |
      #| COS_83ESS | COS_83ESS |               1 |         1 |               1 |                  1 |                    1 |    8300000021 | cos83ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | APIAccess | ValidationMessage  |
      #| SA_CS_83 | COS_83ESS | True      | Saved Successfully |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |              2 | VIS_83       | Matrix            | 8300000011 | visitor83@gmail.com | COS_83  | SA        | Default Location   |
    #And Set Alert Configuration "Visitor Pass Expired"
    #And Set Send Alert to parameters for "Visitor Pass Expired" Alert
    #And Update Alert Configuration "Visitor Pass Expired"
      #| ReminderPeriodMin |
      #|                 0 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            0 | SA        |         0 |       0 | COS_83 |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_83    |   8300000001 | cos83@gmail.com     |        1 |          1 |
      #| COS_83ESS |   8300000021 | cos83ess@gmail.com  |        1 |          1 |
      #| VIS_83    |   8300000011 | visitor83@gmail.com |        1 |          1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            5 | SA        |         0 |       0 | COS_83 |
#
  #@VMM14
  #Scenario: Visitor - Login without OTP
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_84    |
      #| COS_84ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8400000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email              |
      #|   8400000021 | cos84ess@gmail.com |
    #And Delete System Account User "SA_CS_84" from database
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_84    | COS_84    |               1 |         1 |               1 |                  1 |                    1 |    8400000001 | cos84@gmail.com    |
      #| COS_84ESS | COS_84ESS |               1 |         1 |               1 |                  1 |                    1 |    8400000021 | cos84ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | ValidationMessage  |
      #| SA_CS_84 | COS_84ESS | Saved Successfully |
    #And Logout from Cosec Web
    #And Set User password
      #| User     | NewPassword | ConfirmPassword | Validation |
      #| SA_CS_84 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Create station location from visitor module
      #| Name  | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      #| COS84 | Site-1   | False                     | Saved Successfully |
    #And Set Alert Configuration "Visitor - Login without OTP"
    #And Update Alert Configuration "Visitor - Login without OTP"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Open Cosec Visitor Portal in new tab
      #| StationLocation | UserId   | Password | validation     |
      #| COS84           | SA_CS_84 | admin    | Visitor Portal |
    #And SKIP TO LOGIN with Visitor in Visitor Portal
      #| MobileEmail | Validation |
      #|  8400000011 | Profile    |
    #And Enter visitor details in visitor portal
      #| Name   | Organization | Email               | validation                                                  |
      #| VIS_84 | Matrix       | visitor84@gmail.com | Request submitted successfully.Try to login after some time |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email              | SMSCount | EmailCount |
      #| COS_84ESS |   8400000021 | cos84ess@gmail.com |        1 |          1 |
#
  #@VMM15
  #Scenario: Visitor Form Execution
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_85    |
      #| COS_85ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8500000011 |
    #And Delete Visitor Form "Form85" from Database
    #And Delete SMS and Mail log
      #| mobilenumber | Email              |
      #|   8500000001 | cos85@gmail.com    |
      #|   8500000021 | cos85ess@gmail.com |
    #And Delete System Account User "SA_CS_85" from database
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_85    | COS_85    |               1 |         1 |               1 |                  1 |                    1 |    8500000001 | cos85@gmail.com    |
      #| COS_85ESS | COS_85ESS |               1 |         1 |               1 |                  1 |                    1 |    8500000021 | cos85ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | ValidationMessage  |
      #| SA_CS_85 | COS_85ESS | Saved Successfully |
    #And Logout from Cosec Web
    #And Set User password
      #| User     | NewPassword | ConfirmPassword | Validation |
      #| SA_CS_85 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Create Visitor Form from admin module
      #| Name   | ApproveOn     | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      #| Form85 | Any Condition | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    #And Create station location from visitor module
      #| Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      #| COS85 | Site-1   | True                      | Form85          | All Visits         |                 |                    | Saved Successfully |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_85       | Matrix            | 8500000011 | visitor85@gmail.com | COS_85  | SA        | COS85              |
    #And create visitor profile via API
      #| id  | name | active |
      #| v85 | v85  |      1 |
    #And Set Alert Configuration "Visitor Form Execution"
    #And Set Send Alert to parameters for "Visitor Form Execution" Alert
    #And Open Cosec Visitor Portal in new tab
      #| StationLocation | UserId   | Password | validation     |
      #| COS85           | SA_CS_85 | admin    | Visitor Portal |
    #And SKIP TO LOGIN with Visitor in Visitor Portal
      #| MobileEmail | Validation   |
      #|  8500000011 | Create Visit |
    #When CheckIn Visit from visitor portal and submit form
      #| HostID | Answer1  | validation                    |
      #| COS_85 | Option 1 | Eligibility criteria achieved |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email              | SMSCount | EmailCount |
      #| COS_85    |   8500000001 | cos85@gmail.com    |        1 |          1 |
      #| COS_85ESS |   8500000021 | cos85ess@gmail.com |        1 |          1 |
    #And Visit State Change via API
      #| user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      #|         0 |            5 | SA        |         0 |       0 | COS_85 |
#
  #@VMM16
  #Scenario: Visitor Pre-registration Approval/Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_86      |
      #| COS_86_RIC1 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8600000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   8600000021 | cos86ric1@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email      |
      #| COS_86      | COS_86      |               1 |         1 |               1 |                  1 |                    1 |    8600000001 | cos86@gmail.com     |
      #| COS_86_RIC1 | COS_86_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8600000021 | cos86ric1@gmail.com |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS86RICGrp      |        1 | COS_86_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_86 | COS86RICGrp    |                |            |              | Saved Successfully |
    #And Set Visitor Management tab parameteres in GP
      #| AuthForVisitorPreRegistration |
      #| Always                        |
    #And Set Alert Configuration "Visitor Pre-registration Approval/Rejection"
    #And Update Alert Configuration "Visitor Pre-registration Approval/Rejection"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Assign User in Alert "Visitor Pre-registration Approval/Rejection"
      #| UserID      |
      #| COS_86_RIC1 |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_86 |                          1 | admin        |    1 |
    #And Set default Visitor Pre-Registration Template
    #When Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_86       | Matrix            | 8600000011 | visitor86@gmail.com | COS_86  | COS_86    | Default Location   |
    #Then Validate SMS and Email Alert for Users
      #| userid      | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_86_RIC1 |   8600000021 | cos86ric1@gmail.com |        1 |          1 |
    #And Reset "Visitor Management" page to default
#
  #@VMM17
  #Scenario: Visit Request Approval
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_87      |
      #| COS_87_RIC1 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8700000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   8700000001 | cos87@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email      |
      #| COS_87      | COS_87      |               1 |         1 |               1 |                  1 |                    1 |    8700000001 | cos87@gmail.com     |
      #| COS_87_RIC1 | COS_87_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8700000021 | cos87ric1@gmail.com |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS87RICGrp      |        1 | COS_87_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_87 | COS87RICGrp    |                |            |              | Saved Successfully |
    #And Set Visitor Management tab parameteres in GP
      #| AuthForVisitorPreRegistration |
      #| Always                        |
    #And Set Alert Configuration "Visit Request Approval/Rejection"
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_87      |                          1 | admin        |    1 |
      #| COS_87_RIC1 |                          1 | admin        |    1 |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_87       | Matrix            | 8700000011 | visitor87@gmail.com | COS_87  | COS_87    | Default Location   |
    #When Visitor PreRegistration Approval API
      #| verdict | remark      | approvedBy  | StartDate | EndDate | HostID |
      #|       1 | RICApproved | COS_87_RIC1 |         0 |       0 | COS_87 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_87 |   8700000001 | cos87@gmail.com |        1 |          1 |
    #And Reset "Visitor Management" page to default
#
  #@VMM18
  #Scenario: Visit Request Rejection
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID      |
      #| COS_88      |
      #| COS_88_RIC1 |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8800000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   8800000001 | cos88@gmail.com |
    #And Create User via api
      #| Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email      |
      #| COS_88      | COS_88      |               1 |         1 |               1 |                  1 |                    1 |    8800000001 | cos88@gmail.com     |
      #| COS_88_RIC1 | COS_88_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8800000021 | cos88ric1@gmail.com |
    #And Create Reporting Group
      #| ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      #| COS88RICGrp      |        1 | COS_88_RIC1 |      |      |      |      | Saved Successfully |
    #And Assign groups to user from user configuration
      #| UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      #| COS_88 | COS88RICGrp    |                |            |              | Saved Successfully |
    #And Set Visitor Management tab parameteres in GP
      #| AuthForVisitorPreRegistration |
      #| Always                        |
    #And Set Alert Configuration "Visit Request Approval/Rejection"
    #And Set Password via API
      #| Userid      | user-verified-for-password | new-password | type |
      #| COS_88      |                          1 | admin        |    1 |
      #| COS_88_RIC1 |                          1 | admin        |    1 |
    #And Set default Visitor Pre-Registration Template
    #And Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_88       | Matrix            | 8800000011 | visitor88@gmail.com | COS_88  | COS_88    | Default Location   |
    #When Visitor PreRegistration Approval API
      #| verdict | remark      | approvedBy  | StartDate | EndDate | HostID |
      #|       2 | RICRejected | COS_88_RIC1 |         0 |       0 | COS_88 |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_88 |   8800000001 | cos88@gmail.com |        1 |          1 |
    #And Reset "Visitor Management" page to default
#
  #@VMM19
  #Scenario: Security Clearance
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_89    |
      #| COS_89ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   8900000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email              |
      #|   8900000021 | cos89ess@gmail.com |
    #And Delete System Account User "SA_CS_89" from database
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_89    | COS_89    |               1 |         1 |               1 |                  1 |                    1 |    8900000001 | cos89@gmail.com    |
      #| COS_89ESS | COS_89ESS |               1 |         1 |               1 |                  1 |                    1 |    8900000021 | cos89ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | ValidationMessage  |
      #| SA_CS_89 | COS_89ESS | Saved Successfully |
    #And Set Visitor Management tab parameteres in GP
      #| AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      #| Not Required                  | True                            |
    #And Set Alert Configuration "Security Clearance"
    #And Update Alert Configuration "Security Clearance"
      #| ApprovalLinks | ApprovalAcknowledgment |
      #| True          | True                   |
    #And Set Password via API
      #| Userid | user-verified-for-password | new-password | type |
      #| COS_89 |                          1 | admin        |    1 |
    #And Set default Visitor Pre-Registration Template
    #When Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_89       | Matrix            | 8900000011 | visitor89@gmail.com | COS_89  | COS_89    | Default Location   |
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email              | SMSCount | EmailCount |
      #| COS_89ESS |   8900000021 | cos89ess@gmail.com |        1 |          1 |
    #And Reset "Visitor Management" page to default
#
  #@VMM20
  #Scenario: Visit State Change
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID    |
      #| COS_90    |
      #| COS_90ESS |
    #And Delete visitor via API
      #| mobilenumber |
      #|   9000000011 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email               |
      #|   9000000001 | cos90@gmail.com     |
      #|   9000000021 | cos90ess@gmail.com  |
      #|   9000000011 | visitor90@gmail.com |
    #And Delete System Account User "SA_CS_90" from database
    #And Create User via api
      #| Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email     |
      #| COS_90    | COS_90    |               1 |         1 |               1 |                  1 |                    1 |    9000000001 | cos90@gmail.com    |
      #| COS_90ESS | COS_90ESS |               1 |         1 |               1 |                  1 |                    1 |    9000000021 | cos90ess@gmail.com |
    #And Create New System Account User
      #| SAUser   | ESSUSer   | APIAccess | ValidationMessage  |
      #| SA_CS_90 | COS_90ESS | True      | Saved Successfully |
    #And Logout from Cosec Web
    #And Set User password
      #| User     | NewPassword | ConfirmPassword | Validation |
      #| SA_CS_90 | admin       | admin           | LOGIN      |
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set Alert Configuration "Visit State Change"
    #And Set Send Alert to parameters for "Visit State Change" Alert
    #And Update Alert Configuration "Visit State Change"
      #| CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      #| True           | True          | True                   |
    #And Set default Visitor Pre-Registration Template
    #When Visitor Preregistration via API
      #| user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      #|         0 |          0 |                0 |                1 |             10 | VIS_90       | Matrix            | 9000000011 | visitor90@gmail.com | COS_90  | SA_CS_90  | Default Location   |
    #Then Validate SMS and Email Alert for Users
      #| userid    | mobilenumber | Email               | SMSCount | EmailCount |
      #| COS_90    |   9000000001 | cos90@gmail.com     |        1 |          1 |
      #| COS_90ESS |   9000000021 | cos90ess@gmail.com  |        1 |          1 |
      #| VIS_90    |   9000000011 | visitor90@gmail.com |        1 |          1 |
    #And Reset "Visitor Management" page to default
#
  #@ASA-67
  #Scenario: Alert - CWM - Contractor Details Alert
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   6700000001 | cos67@gmail.com |
      #|   6700000011 | con67@gmail.com |
    #And Delete Contractor via API
      #| id     |
      #| CON_67 |
    #And Delete user via API
      #| UserID |
      #| COS_67 |
    #And Create User via api
      #| Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      #| COS_67 | COS_67 |               1 |         1 |               1 |                  1 |    6700000001 | cos67@gmail.com |
    #And Set custom fields for "Contractors" in GP
      #| Active | FieldName | Type | Upload | Mandatory |
      #| True   | Adhar     | Date | False  | False     |
    #When Create Contractor from CWM module
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_67 | CON_67 |              10 | CON_67         |     6700000011 | con67@gmail.com |      6700 | Lic         | True          | True             | Saved Successfully |
    #And Update Contractor custom fields from Contractor Profile
      #| Id     | Adhar | Validation         |
      #| CON_67 |     1 | Saved Successfully |
    #And Set Alert Configuration "Contractor Details Alert"
    #And Set Send Alert to parameters for "Contractor Details Alert" Alert
    #And Update Alert Configuration "Contractor Details Alert"
      #| SendAlertFor | Document | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      #| True         | Adhar    |                1 |            2 | False          |                    1 |
    #And Assign User in Alert "Contractor Details Alert"
      #| UserID | ContractorID | DocumentName |
      #| COS_67 | CON_67       | Adhar        |
    #When Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| COS_67 |   6700000001 | cos67@gmail.com |        1 |          1 |
      #| CON_67 |   6700000011 | con67@gmail.com |        1 |          1 |
#
  #@ASA-18
  #Scenario: Alert - User - Invite User
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email           |
      #|   1800000001 | cos18@gmail.com |
    #And Set Alert Configuration "Invite User"
    #And Delete Link from Invite User page
      #| Name  |
      #| cos18 |
    #When Send link from Invite user tab
      #| Name  | MobileNo   | EmailID         |
      #| cos18 | 1800000001 | cos18@gmail.com |
    #Then Validate SMS and Email Alert for Users
      #| userid | mobilenumber | Email           | SMSCount | EmailCount |
      #| cos18  |   1800000001 | cos18@gmail.com |        1 |          1 |
#
  #@ASA-19
  #Scenario: Alert - User - User Onboarding - On Submit
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID       |
      #| COS_19       |
      #| COS_19_Alert |
    #And Delete SMS and Mail log
      #| mobilenumber | Email                |
      #|   1900000011 | cos19Alert@gmail.com |
    #And Create User via api
      #| Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      #| COS_19_Alert | COS_19_Alert |               1 |         1 |               1 |                  1 |    1900000011 | cos19Alert@gmail.com |
    #And Set Alert Configuration "User Onboarding - On Submit"
    #And Assign User in Alert "User Onboarding - On Submit"
      #| UserID       |
      #| COS_19_Alert |
    #And Delete Link from Invite User page
      #| Name   |
      #| COS_19 |
    #And Send link from Invite user tab
      #| Name   | MobileNo   | EmailID         |
      #| COS_19 | 1900000001 | cos19@gmail.com |
    #And "Copy link" and open in new browser tab
      #| Name   |
      #| COS_19 |
    #And Go to previous Tab
    #And Get OTP from Alert view for "1900000001"
    #And Go to next Tab
    #And click on Login after entering OTP in COSEC Onboarding Portal
      #| Validation              |
      #| COSEC Onboarding Portal |
    #When Enter details in employees onbording portal
      #| Name   |
      #| COS_19 |
    #And Go to previous Tab
    #Then Validate SMS and Email Alert for Users
      #| userid       | mobilenumber | Email                | SMSCount | EmailCount |
      #| COS_19_Alert |   1900000011 | cos19Alert@gmail.com |        1 |          1 |
#
  #@ASA-20
  #Scenario: Alert - User - User Onboarding - Schedule Time
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID       |
      #| COS_20       |
      #| COS_20_Alert |
    #And Delete SMS and Mail log
      #| mobilenumber | Email                |
      #|   2000000011 | cos20Alert@gmail.com |
    #And Create User via api
      #| Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      #| COS_20_Alert | COS_20_Alert |               1 |         1 |               1 |                  1 |    2000000011 | cos20Alert@gmail.com |
    #And Delete Link from Invite User page
      #| Name   |
      #| COS_20 |
    #And Send link from Invite user tab
      #| Name   | MobileNo   | EmailID         |
      #| COS_20 | 2000000001 | cos20@gmail.com |
    #And "Copy link" and open in new browser tab
      #| Name   |
      #| COS_20 |
    #And Go to previous Tab
    #And Get OTP from Alert view for "2000000001"
    #And Go to next Tab
    #And click on Login after entering OTP in COSEC Onboarding Portal
      #| Validation              |
      #| COSEC Onboarding Portal |
    #When Enter details in employees onbording portal
      #| Name   |
      #| COS_20 |
    #And Go to previous Tab
    #And Update Alert Configuration "User Onboarding - Schedule Time"
      #| ScheduleTime |
      #|            2 |
    #And Set Alert Configuration "User Onboarding - Schedule Time"
    #And Assign User in Alert "User Onboarding - Schedule Time"
      #| UserID       |
      #| COS_20_Alert |
    #And Wait for "4" min
    #Then Validate SMS and Email Alert for Users
      #| userid       | mobilenumber | Email                | SMSCount | EmailCount |
      #| COS_20_Alert |   2000000011 | cos20Alert@gmail.com |        1 |          1 |
#
  #@ASA-21
  #Scenario: Alert - User - User Onboarding - Schedule Time
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Delete user via API
      #| UserID  |
      #| COS_211 |
    #And Delete SMS and Mail log
      #| mobilenumber | Email            |
      #|   2100000011 | cos211@gmail.com |
    #And Create User via api
      #| Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      #| COS_211 | COS_211 |               1 |         1 |               1 |                  1 |    2100000011 | cos211@gmail.com |
    #And Set Alert Configuration "User Access - QR Credential"
    #And Assign User in Alert "User Access - QR Credential"
      #| UserID  |
      #| COS_211 |
    #When Generate QR Credential from User Configuration
      #| UserId  |
      #| COS_211 |
    #Then Validate SMS and Email Alert for Users
      #| userid  | mobilenumber | Email            | SMSCount | EmailCount |
      #| COS_211 |   2100000011 | cos211@gmail.com |        1 |          1 |
